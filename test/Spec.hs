import           Test.Hspec

import           Lang

main :: IO ()
main = hspec $ do it "should eval constants" $ eval (EInt 10) `shouldBe` (VInt 10, [])
