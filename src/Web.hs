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
     let !t = tc emptyTEnv prog
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
             do x <- evalTemplate progtext doc
                let b = X.render (X.HtmlDocument enc typ x)
                okHtml $ T.decodeUtf8 $ Blaze.toByteString b
           Right _ -> error "renderFile: parseHTML returned XML."

evalTemplate :: Text -> [X.Node] -> IO [X.Node]
evalTemplate progtext nodes = mapM evalNode nodes
  where evalNode n@(X.Element t atrs cs) |
                   t == "show" &&
                   X.hasAttribute "e" n =
          catch (let Just src = X.getAttribute "e" n
                     prog' = progtext <> " in " <> src
                     prog = parse (lexer (T.unpack prog'))
                     !t = tc emptyTEnv prog
                     (v,_) = eval emptyEnv prog
                 in return $ X.TextNode (renderV v))
                (\(e ::SomeException) ->
                   return $ X.TextNode (T.pack (show e)))
        evalNode (X.Element t atrs cs) =
          do cs' <- mapM evalNode cs
             return $ X.Element t atrs cs'
        evalNode n = return n
