import           Network.Wai.Handler.Warp (run)
import           Web.Fn

import           Web

main :: IO ()
main = do ctxt <- initializer
          run 2000 (toWAI ctxt site)
