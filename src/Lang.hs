module Lang where

import qualified Data.Map  as M
import           Data.Text (Text)

data T = TInt
       | TDouble
       | TBool
       | TString
       | TList T
       | TObject (M.Map Text T)
       | TLam [T] T
       deriving (Show, Eq)

data Var = Var Text deriving (Show, Eq)

data Prim = PAdd deriving (Show, Eq)

data E = EInt Int
       | EDouble Double
       | EBool Bool
       | EString Text
       | EList [E]
       | EObject (M.Map Text E)
       | EVar Var
       | ELam [Var] E
       | EApp E [E]
       | EIf E E E
       | ECase E E Var Var E
       | EDot E Text
       | ELet Var E
       | EPrim Prim [E]
       | ESource ES
       deriving (Show, Eq)

data ES = ES Id T deriving (Show, Eq)

data Env = Env (M.Map Var V) deriving (Show, Eq)

data V = VInt Int
       | VDouble Double
       | VBool Bool
       | VString Text
       | VList [VS]
       | VObject (M.Map Text VS)
       | VLam Env [Var] E
       | VSource VS
       deriving (Show, Eq)

data VS = VS Id [UserId] V deriving (Show, Eq)

data Id = Id Int deriving (Show, Eq)

data UserId = UserId Int deriving (Show, Eq)



tc :: E -> T
tc = undefined

eval :: E -> (V, [VS])
eval = undefined
