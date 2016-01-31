{-# LANGUAGE BangPatterns        #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}

module Web where

import qualified Blaze.ByteString.Builder as Blaze
import           Control.Exception        (SomeException, catch)
import           Control.Lens
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

evalTemplateWithProg :: Text -> [X.Node] -> IO [X.Node]
evalTemplateWithProg progtext ns =
    let (env, tenv) =
          if T.null progtext
             then (emptyEnv, emptyTEnv)
             else let prog = parse $ lexer $ T.unpack $ progtext <> " in () : {} { {} }"
                      (TLam _ _, tenv') = tc False emptyTEnv prog
                      (VLam env' _ _, _) = eval emptyEnv prog
                   in (env', tenv')
     in evalTemplate env tenv ns


evalTemplate :: Env -> TEnv -> [X.Node] -> IO [X.Node]
evalTemplate env tenv ns = concat <$> mapM evalNode ns
  where evalNode n@(X.Element t atrs cs) |
                   t == "show" &&
                   X.hasAttribute "e" n =
          catch (let Just src = X.getAttribute "e" n
                     prog = parse (lexer (T.unpack src))
                     !t = tc False tenv prog
                     (v,_) = eval env prog
                 in return $ [X.TextNode (renderV v)])
                (\(e ::SomeException) ->
                   return $ [X.TextNode (T.pack (show e))])
        evalNode n@(X.Element t atrs cs) |
                   t == "each" &&
                   X.hasAttribute "e" n  &&
                   X.hasAttribute "v" n =
         catch (let Just src = X.getAttribute "e" n
                    Just var = X.getAttribute "v" n
                    prog = parse (lexer (T.unpack src))
                    (TList t, _) = tc False tenv prog
                    (v,_) = eval env prog
                in case v of
                     VList vs ->
                       concat <$> mapM (\v ->
                               evalTemplate (extendEnv env [(Var var, v)])
                                            (extendTEnv tenv [(Var var, t)])
                                            cs)
                            vs
                     v -> return $ [X.TextNode $ "<each>: got non-list: " <> renderV v])
               (\(e ::SomeException) ->
                  return $ [X.TextNode (T.pack (show e))])
        evalNode (X.Element t atrs cs) =
          do cs' <- concat <$> mapM evalNode cs
             return $ [X.Element t atrs cs']
        evalNode n = return [n]
