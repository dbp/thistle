module Lang where

import qualified Data.Map    as M
import           Data.Monoid ((<>))
import           Data.Text   (Text)

data T = TInt
       | TDouble
       | TBool
       | TString
       | TList T
       | TObject (M.Map Text T)
       | TLam [T] T
       deriving (Show, Eq)

data Var = Var Text deriving (Show, Eq, Ord)

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
       | ELet Var E E
       | EPrim Prim [E]
       | ESource ES
       deriving (Show, Eq)

data ES = ES Id T deriving (Show, Eq)

data Env = Env (M.Map Var V) deriving (Show, Eq)

emptyEnv :: Env
emptyEnv = Env M.empty

envFromList :: [(Var, V)] -> Env
envFromList ls = Env (M.fromList ls)

extendEnv :: Env -> [(Var, V)] -> Env
extendEnv (Env e) vs = Env (M.union (M.fromList vs) e)

data TEnv = TEnv (M.Map Var T) deriving (Show, Eq)

emptyTEnv :: TEnv
emptyTEnv = TEnv M.empty

data V = VInt Int
       | VDouble Double
       | VBool Bool
       | VString Text
       | VList [V]
       | VObject (M.Map Text V)
       | VLam Env [Var] E
       | VSource VS
       deriving (Show, Eq)

data VS = VSBase Id [UserId] V
        | VSList Id [UserId] [VS]
        | VSObject Id [UserId] (M.Map Text VS)
        deriving (Show, Eq)

data Id = Id Int deriving (Show, Eq)

data UserId = UserId Int deriving (Show, Eq)



tc :: TEnv -> E -> T
tc = undefined

eval :: Env -> E -> (V, [VS])
eval _env (EInt n)         = (VInt n, [])
eval _env (EDouble d)      = (VDouble d, [])
eval _env (EBool b)        = (VBool b, [])
eval _env (EString t)      = (VString t, [])
eval env (EList es)        = let vs = map (eval env) es
                             in (VList (map fst vs), concatMap snd vs)
eval env (EObject fs)      =
  let vs = M.map (eval env) fs
  in (VObject (M.map fst vs), concat $ M.map snd vs)
eval (Env env) (EVar v)    =
  case M.lookup v env of
    Nothing -> error $ "Could not find " <> show v <> " in env " <> show env
    Just v -> (v, [])
eval env (ELam vs e)       = (VLam env vs e, [])
eval env (EApp e es)       =
  case eval env e of
    (lam@(VLam venv vs body), sources) ->
      if length vs == length es
         then let args = map (eval env) es
                  res = eval (extendEnv venv (zip vs (map fst args))) body
              in (fst res, snd res <> concatMap snd args <> sources)
         else error $ "Wrong number of arguments to lambda " <> show lam <> ". Expected " <> show vs <> ", got" <> show es <> "."
    l -> error $ "Applying a non-lambda " <> show l <> " to arguments " <> show es
eval env (EIf c t e)       =
  let v = eval env c
  in case fst v of
       VBool True -> let v2 = eval env t
                     in (fst v2, snd v <> snd v2)
       VBool False -> let v2 = eval env e
                      in (fst v2, snd v <> snd v2)
       _ -> error $ "Non-boolean in if: " <> show c
eval env (ECase e n h t s) =
  let v = eval env e
  in case fst v of
       VList [] -> let v2 = eval env n
                   in (fst v2, snd v <> snd v2)
       VList (x:xs) -> let v2 = eval (extendEnv env [(h, x),(t, VList xs)]) s
                       in (fst v2, snd v <> snd v2)
       _ -> error $ "Non-list in case: " <> show e
eval env (EDot e f)        = undefined
eval env (ELet var e b)    = let v  = eval env e
                                 v' = eval (extendEnv env [(var, fst v)]) b
                             in (fst v', snd v <> snd v')
eval env (EPrim p es)      = undefined
eval env (ESource es)      = undefined
