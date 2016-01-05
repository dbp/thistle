{-# LANGUAGE OverloadedStrings #-}

import           Control.Exception (evaluate)
import qualified Data.Map          as M
import           Test.Hspec

import           Lang

main :: IO ()
main = hspec $ do
  describe "eval" $ do
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
        eval emptyEnv (EApp (ELam [(Var "x", TInt)] (EVar (Var "x"))) [EInt 10])
             `shouldBe` (VInt 10, [])
      it "applying two argument functions" $
        eval emptyEnv (EApp (ELam [(Var "x", TInt), (Var "y", TInt)] (EVar (Var "x"))) [EInt 10, EInt 20])
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
              (ELet (Var "f") (ELam [(Var "x", TList TInt)]
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
    describe "sources" $ do
      it "sources should produce their default values" $
        eval emptyEnv (ESource (ES (Id 1) TInt) (EInt 10))
             `shouldBe` (VInt 10, [VSBase (Id 1) [] (VInt 10)])
      it "should be able to add sources of ints" $
        eval emptyEnv (EPrim PPlus [EInt 1
                                   ,ESource (ES (Id 1) TInt) (EInt 10)])
             `shouldBe` (VInt 11, [VSBase (Id 1) [] (VInt 10)])
  describe "tc" $ do
    describe "constants" $ do
      it "ints" $ tc emptyTEnv (EInt 1) `shouldBe` TInt
      it "strings" $ tc emptyTEnv (EString "hello") `shouldBe` TString
      it "bools" $ tc emptyTEnv (EBool True) `shouldBe` TBool
      it "doubles" $ tc emptyTEnv (EDouble 1) `shouldBe` TDouble
      it "lists" $
        tc emptyTEnv (EList [EInt 1, EInt 2])
           `shouldBe` TList TInt
      it "lists should not be hererogeneous" $
         evaluate (tc emptyTEnv (EList [EInt 1, EDouble 2]))
                  `shouldThrow` anyErrorCall
      it "objects" $
        tc emptyTEnv (EObject (M.fromList [("k", EInt 2),("l", EInt 3)]))
           `shouldBe` TObject (M.fromList [("k", TInt),("l", TInt)])
    describe "prims" $ do
      describe "+ on ints" $ do
        it "works" $
          tc emptyTEnv (EPrim PPlus [EInt 1, EInt 10])
             `shouldBe` TInt
        it "doesn't work on more than two arguments" $
          evaluate (tc emptyTEnv (EPrim PPlus [EInt 1, EInt 1, EInt 2]))
                   `shouldThrow` anyErrorCall
        it "doesn't work on less than two arguments" $
          evaluate (tc emptyTEnv (EPrim PPlus [EInt 1]))
                   `shouldThrow` anyErrorCall
        it "doesn't work on ints and doubles" $
          evaluate (tc emptyTEnv (EPrim PPlus [EInt 1, EDouble 1]))
                   `shouldThrow` anyErrorCall
        it "doesn't work on ints and bools" $
          evaluate (tc emptyTEnv (EPrim PPlus [EInt 1, EBool True]))
                   `shouldThrow` anyErrorCall
        it "doesn't work on ints and strings" $
          evaluate (tc emptyTEnv (EPrim PPlus [EInt 1, EString "hello"]))
                   `shouldThrow` anyErrorCall
      describe "+ on doubles" $ do
        it "works" $
          tc emptyTEnv (EPrim PPlus [EDouble 1, EDouble 10])
             `shouldBe` TDouble
        it "doesn't work on bools and doubles" $
          evaluate (tc emptyTEnv (EPrim PPlus [EBool True, EDouble 10]))
                   `shouldThrow` anyErrorCall
      describe "+ on strings" $ do
        it "works" $
             tc emptyTEnv (EPrim PPlus [EString "a", EString "b"])
                `shouldBe` TString
        it "doesn't work on strings and ints" $
          evaluate (tc emptyTEnv (EPrim PPlus [EString "a", EInt 10]))
                   `shouldThrow` anyErrorCall
      describe "- on ints" $ do
        it "works" $
           tc emptyTEnv (EPrim PMinus [EInt 1, EInt 10])
              `shouldBe` TInt
        it "doesn't work on bools and ints" $
          evaluate (tc emptyTEnv (EPrim PMinus [EBool True, EInt 10]))
                   `shouldThrow` anyErrorCall
        it "- on less than two arguments" $
           evaluate (tc emptyTEnv (EPrim PMinus [EInt 1]))
                    `shouldThrow` anyErrorCall
        it "- on more than two arguments" $
           evaluate (tc emptyTEnv (EPrim PMinus [EInt 1, EInt 1, EInt 1]))
                    `shouldThrow` anyErrorCall
      describe "- on doubles" $ do
        it "works" $
          tc emptyTEnv (EPrim PMinus [EDouble 1, EDouble 10])
             `shouldBe` TDouble
        it "doesn't work on doubles and ints" $
          evaluate (tc emptyTEnv (EPrim PMinus [EDouble 1, EInt 10]))
                   `shouldThrow` anyErrorCall
      describe "* on ints" $ do
        it "works" $
          tc emptyTEnv (EPrim PTimes [EInt 1, EInt 10])
             `shouldBe` TInt
        it "doesn't work on doubles and ints" $
          evaluate (tc emptyTEnv (EPrim PTimes [EDouble 1, EInt 10]))
                   `shouldThrow` anyErrorCall
      describe "* on doubles" $ do
        it "works" $
          tc emptyTEnv (EPrim PTimes [EDouble 1, EDouble 10])
             `shouldBe` TDouble
        it "doesn't work on doubles and ints" $
          evaluate (tc emptyTEnv (EPrim PTimes [EDouble 1, EInt 10]))
                   `shouldThrow` anyErrorCall
      describe "/ on ints" $ do
        it "works" $
          tc emptyTEnv (EPrim PDivide [EInt 1, EInt 10])
             `shouldBe` TInt
        it "doesn't work on doubles and ints" $
          evaluate (tc emptyTEnv (EPrim PDivide [EDouble 1, EInt 10]))
                   `shouldThrow` anyErrorCall
      describe "/ on doubles" $ do
        it "works" $
          tc emptyTEnv (EPrim PDivide [EDouble 1, EDouble 10])
             `shouldBe` TDouble
        it "doesn't work on doubles and ints" $
          evaluate (tc emptyTEnv (EPrim PDivide [EDouble 1, EInt 10]))
                   `shouldThrow` anyErrorCall
    describe "vars, let, lam, and application" $ do
      it "(x:int) { x } typechecks" $
        tc emptyTEnv (ELam [(Var "x", TInt)] (EVar (Var "x")))
           `shouldBe` TLam [TInt] TInt
      it "(x:int) { x x } fails" $
        evaluate (tc emptyTEnv (ELam [(Var "x", TInt)] (EApp (EVar (Var "x"))  [(EVar (Var "x"))])))
                 `shouldThrow` anyErrorCall
      it "(x:int) { 10 } typechecks" $
        tc emptyTEnv (ELam [(Var "x", TInt)] (EVar (Var "x")))
           `shouldBe` TLam [TInt] TInt
      it "(f : int -> int) { f 10 } typechecks" $
        tc emptyTEnv (ELam [(Var "f", TLam [TInt] TInt)] (EApp (EVar (Var "f")) [EInt 10]))
           `shouldBe` TLam [TLam [TInt] TInt] TInt
      it "(x:int y:bool) { y } typechecks" $
        tc emptyTEnv (ELam [(Var "x", TInt),(Var "y", TBool)]
                           (EVar (Var "y")))
           `shouldBe` TLam [TInt, TBool] TBool
      it "(f : int -> bool) { f true } fails" $
        evaluate (tc emptyTEnv (ELam [(Var "f", TLam [TInt] TBool)] (EApp (EVar (Var "f")) [EBool True])))
                   `shouldThrow` anyErrorCall
    describe "if and case" $ do
      it "if true 1 2 typechecks" $
        tc emptyTEnv (EIf (EBool True) (EInt 1) (EInt 2))
           `shouldBe` TInt
      it "if false 1 true fails" $
        evaluate (tc emptyTEnv (EIf (EBool False) (EInt 1) (EBool True)))
                 `shouldThrow` anyErrorCall
      it "if 1 1 1 fails" $
        evaluate (tc emptyTEnv (EIf (EInt 1) (EInt 1) (EInt 1)))
                 `shouldThrow` anyErrorCall
      it "if true (x : int) { 10 } (y : int) { 20 } typechecks" $
        tc emptyTEnv (EIf (EBool True) (ELam [(Var "x", TInt)] (EInt 10)) (ELam [(Var "y", TInt)] (EInt 20)))
           `shouldBe` TLam [TInt] TInt
