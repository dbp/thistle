{-# LANGUAGE OverloadedStrings #-}

import           Test.Hspec

import           Lang

main :: IO ()
main = hspec $ do
  describe "constants" $ do
    it "ints" $
      eval emptyEnv (EInt 10) `shouldBe` (VInt 10, [])
    it "doubles" $
      eval emptyEnv (EDouble 10) `shouldBe` (VDouble 10, [])
    it "strings" $
      eval emptyEnv (EString "hello") `shouldBe` (VString "hello", [])
    it "bools" $
      eval emptyEnv (EBool True) `shouldBe` (VBool True, [])
    it "lists" $
      eval emptyEnv (EList [EInt 1, EInt 2])
         `shouldBe` (VList [VInt 1, VInt 2], [])
  describe "vars, lams, and application" $ do
    it "lookup" $
      eval (envFromList [(Var "x", VInt 10)]) (EVar (Var "x"))
        `shouldBe` (VInt 10, [])
    it "applying one argument functions" $
      eval emptyEnv (EApp (ELam [Var "x"] (EVar (Var "x"))) [EInt 10])
           `shouldBe` (VInt 10, [])
