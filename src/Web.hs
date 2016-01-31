{-# LANGUAGE BangPatterns        #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}

module Web where

import qualified Blaze.ByteString.Builder as Blaze
import           Control.Exception        (SomeException, catch)
import           Control.Lens
import           Control.Monad            (foldM)
import           Data.Monoid
import           Data.Text                (Text)
import qualified Data.Text                as T
import qualified Data.Text.Encoding       as T
import qualified Data.Text.IO             as T
import           Network.Wai              (Response)
import           System.Directory         (doesFileExist)
import qualified Text.XmlHtml             as X
import           Web.Fn

import           Grammar
import           Lang
import           Lexer

data Ctxt = Ctxt { _req :: FnRequest }
makeLenses ''Ctxt
instance RequestContext Ctxt where
  requestLens = req

initializer :: IO Ctxt
initializer = return (Ctxt defaultFnRequest)

site :: Ctxt -> IO Response
site ctxt = route ctxt [segment ==> handle]
            `fallthrough` notFoundText "Page Not Found."

handle :: Ctxt -> Text -> IO (Maybe Response)
handle ctxt pth =
  do progtext <- T.readFile "program.thst"
     let prog = parse (lexer (T.unpack (progtext <> " in {}")))
     let !t = tc False emptyTEnv prog
     let file = "templates/" <>  pth <> ".tpl"
     e <- doesFileExist (T.unpack file)
     if not e
        then return Nothing
        else renderFile progtext file
  where
    renderFile progtext f =
      do contents <- T.readFile (T.unpack f)
         case X.parseHTML (T.unpack f) (T.encodeUtf8 contents) of
           Left err -> errText (T.pack err)
           Right (X.HtmlDocument enc typ doc) ->
             do x <- evalTemplateWithProg progtext doc
                let b = X.render (X.HtmlDocument enc typ x)
                okHtml $ T.decodeUtf8 $ Blaze.toByteString b
           Right _ -> error "renderFile: parseHTML returned XML."

noSources :: Id -> IO (Maybe (V, T))
noSources = const (return Nothing)

evalTemplateWithProg :: Text -> [X.Node] -> IO [X.Node]
evalTemplateWithProg progtext ns =
  do (env, tenv) <-
          if T.null progtext
             then return (emptyEnv, emptyTEnv)
             else do let prog = parse $ lexer $ T.unpack $ progtext <> " in () : {} { {} }"
                         (TLam _ _, tenv') = tc False emptyTEnv prog
                     (VLam env' _ _, _) <- eval noSources emptyEnv prog
                     return (env', tenv')
     evalTemplate env tenv ns


evalTemplate :: Env -> TEnv -> [X.Node] -> IO [X.Node]
evalTemplate env tenv ns = (\(_,_,x) -> x) <$>
                           (foldM evalNode (env, tenv, []) ns)
  where evalNode (env,tenv,ns) n@(X.Element t atrs cs) |
                   t == "show" &&
                   X.hasAttribute "e" n =
          catch (do let Just src = X.getAttribute "e" n
                        prog = parse (lexer (T.unpack src))
                        !t = tc False tenv prog
                    (v,_) <- eval noSources env prog
                    return (env, tenv, ns ++ [X.TextNode (renderV v)]))
                (\(e ::SomeException) ->
                   return (env, tenv, ns ++ [X.TextNode (T.pack (show e))]))
        evalNode (env,tenv,ns) n@(X.Element t atrs cs) |
                   t == "each" &&
                   X.hasAttribute "e" n  &&
                   X.hasAttribute "v" n =
         catch (do let Just src = X.getAttribute "e" n
                       Just var = X.getAttribute "v" n
                       prog = parse (lexer (T.unpack src))
                       (TList t, _) = tc False tenv prog
                   (v,_) <- eval noSources env prog
                   case v of
                     VList vs ->
                       foldM (\(env, tenv, ns) v ->
                          do ns' <- evalTemplate
                                      (extendEnv env [(var, v)])
                                      (extendTEnv tenv [(var, t)])
                                      cs
                             return (env, tenv, ns ++ ns'))
                            (env, tenv, [])
                            vs
                     v -> return (env, tenv, ns ++ [X.TextNode $ "<each>: got non-list: " <> renderV v]))
               (\(e ::SomeException) ->
                  return (env, tenv, ns ++ [X.TextNode (T.pack (show e))]))
        evalNode (env,tenv,ns) n@(X.Element t atrs cs) |
                   t == "let" &&
                   X.hasAttribute "e" n  &&
                   X.hasAttribute "v" n =
          do catch (do let Just src = X.getAttribute "e" n
                           Just var = X.getAttribute "v" n
                           prog = parse (lexer (T.unpack src))
                           !(t,_) = tc False tenv prog
                       (v,_) <- eval noSources env prog
                       return (extendEnv env [(var, v)], extendTEnv tenv [( var, t)], ns))
                   (\(e ::SomeException) ->
                      return (env, tenv, ns ++ [X.TextNode (T.pack (show e))]))
        evalNode (env,tenv,ns) (X.Element t atrs cs) =
          do (_,_,cs') <- foldM evalNode (env, tenv, []) cs
             return (env,tenv, ns ++ [X.Element t atrs cs'])
        evalNode (env,tenv,ns) n = return (env, tenv, ns ++ [n])
