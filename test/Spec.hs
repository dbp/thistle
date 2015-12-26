{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Map   as M
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
    it "objects" $
      eval emptyEnv (EObject (M.fromList [("k", EInt 2),("l", EInt 3)]))
         `shouldBe` (VObject (M.fromList [("k", VInt 2),("l", VInt 3)]), [])
  describe "vars, let, lams, and application" $ do
    it "lookup" $
      eval (envFromList [(Var "x", VInt 10)]) (EVar (Var "x"))
        `shouldBe` (VInt 10, [])
    it "applying one argument functions" $
      eval emptyEnv (EApp (ELam [Var "x"] (EVar (Var "x"))) [EInt 10])
           `shouldBe` (VInt 10, [])
    it "applying two argument functions" $
      eval emptyEnv (EApp (ELam [Var "x", Var "y"] (EVar (Var "x"))) [EInt 10, EInt 20])
           `shouldBe` (VInt 10, [])
    it "applying closures" $
      eval (envFromList [(Var "f", VLam emptyEnv [Var "x"] (EVar (Var "x")))])
           (EApp (EVar (Var "f")) [EInt 10])
           `shouldBe` (VInt 10, [])
    it "let binding" $
      eval emptyEnv (ELet (Var "x") (EInt 1) (EVar (Var "x")))
           `shouldBe` (VInt 1, [])
    it "let shadowing existing vars in env" $
      eval (envFromList [(Var "x", VInt 10)])
           (ELet (Var "x") (EInt 1) (EVar (Var "x")))
           `shouldBe` (VInt 1, [])
    it "let shadowing let" $
      eval emptyEnv
           (ELet (Var "x") (EInt 2)
                           (ELet (Var "x") (EInt 1) (EVar (Var "x"))))
           `shouldBe` (VInt 1, [])
    it "let should be recursive" $
       eval emptyEnv
            (ELet (Var "f") (ELam [Var "x"]
                                  (ECase (EVar (Var "x"))
                                         (EInt 0)
                                         (Var "_")
                                         (Var "rest")
                                         (EPrim
                                            PPlus
                                            [EInt 1,
                                             EApp (EVar (Var "f"))
                                                  [EVar (Var "rest")]])))
                  (EApp (EVar (Var "f")) [EList [EInt 0, EInt 0, EInt 0]]))
            `shouldBe` (VInt 3, [])
  describe "if, case, and dot" $ do
    it "if true" $
      eval emptyEnv (EIf (EBool True) (EInt 1) (EInt 2))
           `shouldBe` (VInt 1, [])
    it "if false" $
      eval emptyEnv (EIf (EBool False) (EInt 1) (EInt 2))
           `shouldBe` (VInt 2, [])
    it "case on empty lists" $
      eval emptyEnv (ECase (EList []) (EInt 1) (Var "h") (Var "t") (EInt 2))
           `shouldBe` (VInt 1, [])
    it "case on non-empty list" $
      eval emptyEnv (ECase (EList [EInt 1]) (EInt 1) (Var "h") (Var "t") (EInt 2))
           `shouldBe` (VInt 2, [])
    it "case on non-empty, using head" $
      eval emptyEnv (ECase (EList [EInt 3]) (EInt 1) (Var "h") (Var "t") (EVar (Var "h")))
           `shouldBe` (VInt 3, [])
    it "case on non-empty, using tail" $
      eval emptyEnv (ECase (EList [EInt 2, EInt 3]) (EInt 1) (Var "h") (Var "t") (EVar (Var "t")))
           `shouldBe` (VList [VInt 3] , [])
    it "dot on object should get field" $
      eval emptyEnv (EDot (EObject (M.fromList [("x", EInt 1)])) "x")
           `shouldBe` (VInt 1, [])
  describe "prims" $ do
    it "+ on ints" $
      eval emptyEnv (EPrim PPlus [EInt 1, EInt 1])
           `shouldBe` (VInt 2, [])
    it "+ on doubles" $
      eval emptyEnv (EPrim PPlus [EDouble 1, EDouble 1])
           `shouldBe` (VDouble 2, [])
    it "+ on strings" $
      eval emptyEnv (EPrim PPlus [EString "a", EString "b"])
           `shouldBe` (VString "ab", [])
    it "* on ints" $
      eval emptyEnv (EPrim PTimes [EInt 2, EInt 3])
           `shouldBe` (VInt 6, [])
    it "* on doubles" $
      eval emptyEnv (EPrim PTimes [EDouble 2, EDouble 3])
           `shouldBe` (VDouble 6, [])
    it "- on ints" $
      eval emptyEnv (EPrim PMinus [EInt 2, EInt 3])
           `shouldBe` (VInt (-1), [])
    it "- on doubles" $
      eval emptyEnv (EPrim PMinus [EDouble 2, EDouble 3])
           `shouldBe` (VDouble (-1), [])
    it "/ on int" $
      eval emptyEnv (EPrim PDivide [EInt 4, EInt 2])
           `shouldBe` (VInt 2, [])
    it "/ on doubles" $
      eval emptyEnv (EPrim PDivide [EDouble 3, EDouble 2])
           `shouldBe` (VDouble 1.5, [])
