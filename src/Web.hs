{-# LANGUAGE BangPatterns        #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell     #-}

module Web where

import qualified Blaze.ByteString.Builder  as Blaze
import           Control.Exception         (SomeException, catch)
import           Control.Lens
import           Control.Monad             (foldM, void)
import qualified Data.Aeson                as A
import           Data.Binary               (decode, encode)
import qualified Data.ByteString.Lazy      as BL
import qualified Data.HashMap.Strict       as HM (toList)
import           Data.List                 (find)
import qualified Data.Map                  as M
import           Data.Monoid
import           Data.Scientific           (floatingOrInteger)
import           Data.Text                 (Text)
import qualified Data.Text                 as T
import qualified Data.Text.Encoding        as T
import qualified Data.Text.IO              as T
import qualified Data.Vector               as V (toList)
import qualified Database.Redis            as R
import           Network.HTTP.Types.Header (hReferer)
import           Network.Wai               (Response, requestHeaders)
import           System.Directory          (doesFileExist)
import qualified Text.XmlHtml              as X
import           Web.Fn


import           Data.Aeson.Helpers

import           Grammar
import           Lang
import           Lexer

data Ctxt = Ctxt { _req   :: FnRequest
                 , _redis :: R.Connection
                 }
makeLenses ''Ctxt
instance RequestContext Ctxt where
  requestLens = req

initializer :: IO Ctxt
initializer = do
  rconn <- R.connect R.defaultConnectInfo
  return (Ctxt defaultFnRequest rconn)

site :: Ctxt -> IO Response
site ctxt = route ctxt [segment ==> handleTemplate
                       ,path "api" /? param "source" /? param "value" /? param "type" ==> handleAPI]
            `fallthrough` notFoundText "Page Not Found."

instance FromParam V where
  fromParam [t] = case decodeValue (BL.fromStrict $ T.encodeUtf8 t) of
                    Nothing -> Left ParamUnparsable
                    Just v -> Right $ jsonToV v
    where jsonToV j = case j of
                        A.Number n -> case floatingOrInteger n of
                                        Left r -> VDouble r
                                        Right i -> VInt i
                        A.String s -> VString s
                        A.Bool b -> VBool b
                        A.Array a -> VList $ map jsonToV $ V.toList a
                        A.Object o -> VObject $ M.fromList $ map (\(k,v) -> (k, jsonToV v)) $ HM.toList o
                        A.Null -> VObject M.empty

instance FromParam T where
  fromParam [s] = let EList t _ = parse (lexer (T.unpack $ "[:" <> s <> "]"))
                  in Right t


handleAPI :: Ctxt -> Text -> V -> T -> IO (Maybe Response)
handleAPI ctxt i v t = do redisSetSource (_redis ctxt) (Id i) (v,t)
                          case find ((== hReferer) . fst) $ requestHeaders (fst $ _req ctxt) of
                            Just (_,r) -> redirect (T.decodeUtf8 r)
                            Nothing -> okText "ok"

handleTemplate :: Ctxt -> Text -> IO (Maybe Response)
handleTemplate ctxt pth =
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
             do x <- evalTemplateWithProg (redisSource (view redis ctxt))
                                          progtext
                                          doc
                let b = X.render (X.HtmlDocument enc typ x)
                okHtml $ T.decodeUtf8 $ Blaze.toByteString b
           Right _ -> error "renderFile: parseHTML returned XML."

redisSetSource :: R.Connection -> Id -> (V,T) -> IO ()
redisSetSource conn (Id i) v = void $ R.runRedis conn $ R.set (T.encodeUtf8 $ "thistle:default:" <> i) (BL.toStrict $ encode v)

redisSource :: R.Connection -> Id -> IO (Maybe (V, T))
redisSource conn (Id i) =
  do resp <- R.runRedis conn $ R.get (T.encodeUtf8 $ "thistle:default:" <> i)
     case resp of
       Left err -> error $ show err
       Right v -> return (decode . BL.fromStrict <$> v)


evalTemplateWithProg :: (Id -> IO (Maybe (V, T))) -> Text -> [X.Node] -> IO [X.Node]
evalTemplateWithProg gs progtext ns =
  do (env, tenv) <-
          if T.null progtext
             then return (emptyEnv, emptyTEnv)
             else do let prog = parse $ lexer $ T.unpack $ progtext <> " in () : {} { {} }"
                         (TLam _ _, tenv') = tc False emptyTEnv prog
                     (VLam env' _ _, _) <- eval gs emptyEnv prog
                     return (env', tenv')
     evalTemplate gs env tenv ns


evalTemplate :: (Id -> IO (Maybe (V, T))) -> Env -> TEnv -> [X.Node] -> IO [X.Node]
evalTemplate gs env tenv ns = (\(_,_,x) -> x) <$>
                           (foldM evalNode (env, tenv, []) ns)
  where renderSource (VSBase (Id t) ty _ v) = X.Element "form" [("action", "/api")]
                                           [X.Element "textarea" [("name", "value")] [X.TextNode (vToJson v)]
                                           ,X.Element "input" [("type", "hidden"), ("name", "source"), ("value", t)] []
                                           ,X.Element "input" [("type", "hidden"), ("name", "type"), ("value", renderT ty)] []
                                           ,X.Element "button" [("type", "submit")] [X.TextNode "Submit"]]
        evalNode (env,tenv,ns) n@(X.Element t atrs cs) |
                   t == "show" &&
                   X.hasAttribute "e" n =
          catch (do let Just src = X.getAttribute "e" n
                        prog = parse (lexer (T.unpack src))
                        !t = tc False tenv prog
                    (v,sources) <- eval gs env prog
                    return (env, tenv, ns ++ [X.TextNode (renderV v)
                                             ,X.Element "div" [("class", "sources")] (map renderSource sources)]))
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
                   (v,ss) <- eval gs env prog
                   case v of
                     VList vs ->
                       foldM (\(env, tenv, ns) v ->
                          do ns' <- evalTemplate
                                      gs
                                      (extendEnv env [(var, (v, ss))])
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
                       v <- eval gs env prog
                       return (extendEnv env [(var, v)], extendTEnv tenv [( var, t)], ns))
                   (\(e ::SomeException) ->
                      return (env, tenv, ns ++ [X.TextNode (T.pack (show e))]))
        evalNode (env,tenv,ns) (X.Element t atrs cs) =
          do (_,_,cs') <- foldM evalNode (env, tenv, []) cs
             return (env,tenv, ns ++ [X.Element t atrs cs'])
        evalNode (env,tenv,ns) n = return (env, tenv, ns ++ [n])
