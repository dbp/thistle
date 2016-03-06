import           Network.Wai.Handler.Warp (run)
import           Web.Fn

import           Web

main :: IO ()
main = do ctxt <- initializer
          putStrLn "Starting up on port 2000..."
          run 2000 (toWAI ctxt site)
