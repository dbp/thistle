{-

This module defines a Simple-Typed Lambda Calculus with recursive
bindings (and thus non-termination) and 'Sources', which are values
with some meta-data that is propogated through computations, such that
any resulting value will have all the sources that were involved in
its result. This is used for out-of-language mutation and then
recomputation.

-}

module Lang where

import           Data.List   (nub)
import qualified Data.Map    as M
import           Data.Maybe  (fromMaybe)
import           Data.Monoid ((<>))
import           Data.Text   (Text)

data T = TInt
       | TDouble
       | TBool
       | TString
       | TList !T
       | TObject !(M.Map Text T)
       | TLam ![T] !T
       deriving (Show, Eq)

data Var = Var Text deriving (Show, Eq, Ord)

data Prim = PPlus
          | PTimes
          | PMinus
          | PDivide
          deriving (Show, Eq)

data E = EInt Int
       | EDouble Double
       | EBool Bool
       | EString Text
       | EList T [E]
       | EObject (M.Map Text E)
       | EVar Var
       | ELam [(Var, T)] E
       | EApp E [E]
       | EIf E E E
       | ECase E E Var Var E
       | EDot E Text
       | ELet Var E E
       | EPrim Prim [E]
       | ESource ES E
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

extendTEnv :: TEnv -> [(Var, T)] -> TEnv
extendTEnv (TEnv e) vs = TEnv (M.union (M.fromList vs) e)

data V = VInt Int
       | VDouble Double
       | VBool Bool
       | VString Text
       | VList [V]
       | VObject (M.Map Text V)
       | VLam Env [Var] E
       deriving (Show, Eq)

data VS = VSBase Id [UserId] V
        | VSList Id [UserId] [VS]
        | VSObject Id [UserId] (M.Map Text VS)
        deriving (Show, Eq)

data Id = Id Text deriving (Show, Eq)

data UserId = UserId Int deriving (Show, Eq)



tc :: TEnv -> E -> T
tc _ (EInt _)                    = TInt
tc _ (EDouble _)                 = TDouble
tc _ (EBool _)                   = TBool
tc _ (EString _)                 = TString
tc env (EList t es)                =
  case nub $ map (tc env) es of
    [] -> TList t
    [t'] | t == t' -> TList t
    [t']  -> error $ "tc: List elements don't have type of annotation. Annotation was " <> show t <> " but elements have type " <> show t'
    ts -> error $ "tc: Found list with different sorts of elements in it: " <> show ts
tc env (EObject fs)              = TObject $ M.map (tc env) fs
tc (TEnv env) (EVar v)           = fromMaybe (error $ "tc: Unbound identifier " <> show v) (M.lookup v env)
tc env (ELam vs e)               =
  TLam (map snd vs) (tc (extendTEnv env vs) e)
tc env (EApp e es)               = case tc env e of
                                     TLam ts t -> let as = map (tc env) es in
                                                      if as == ts
                                                         then t
                                                         else error $ "tc: Arguments did not match types expected by lambda. Expected " <> show ts <> " but got " <> show as
                                     t -> error $ "tc: Got non-function type in application: " <> show t
tc env (EIf c t e)               = case tc env c of
                                     TBool -> let tt = tc env t
                                                  te = tc env e
                                              in if tt == te
                                                    then tt
                                                    else error $ "tc: if had different types in the then and else branches: " <> show tt <> " and " <> show te
                                     t' -> error $ "tc: Got non-boolean in if test: " <> show t'
tc env (ECase e n h t s)         = let v = tc env e
                                   in case v of
                                        TList te ->
                                          let tnull = tc env n
                                              tcons = tc (extendTEnv env [(h, te), (t, TList te)]) s
                                          in if tnull == tcons
                                                then tnull
                                                else error $ "tc: null and cons branch of case did not have the same type: " <> show tnull <> " and " <> show tcons
                                        twrong -> error $ "tc: Got non-list in case: " <> show twrong
tc env (EDot e f)                =
  case tc env e of
    to@(TObject fs) ->
      case M.lookup f fs of
        Just t -> t
        Nothing -> error $ "tc: field " <> show f <> " not found on object: " <> show to
    t -> error $ "tc: got non-object in dot: " <> show t
tc env (ELet var e b)            = let t = tc env e
                                   in tc (extendTEnv env [(var, t)]) b
tc env (EPrim p es)              =
  case p of
    PPlus ->
      case map (tc env) es of
        [TInt, TInt] -> TInt
        [TInt, o] -> error $ "tc: Can't mix + with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix + with TInt and " <> show o
        [TDouble, TDouble] -> TDouble
        [TDouble, o] -> error $ "tc: Can't mix + with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix + with TDouble and " <> show o
        [TString, TString] -> TString
        [TString, o] -> error $ "tc: Can't mix + with TString and " <> show o
        [o, TString] -> error $ "tc: Can't mix + with TString and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to +: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to +."
    PMinus ->
      case map (tc env) es of
        [TInt, TInt] -> TInt
        [TInt, o] -> error $ "tc: Can't mix - with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix - with TInt and " <> show o
        [TDouble, TDouble] -> TDouble
        [TDouble, o] -> error $ "tc: Can't mix - with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix - with TDouble and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to -: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to -."
    PTimes ->
      case map (tc env) es of
        [TInt, TInt] -> TInt
        [TInt, o] -> error $ "tc: Can't mix * with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix * with TInt and " <> show o
        [TDouble, TDouble] -> TDouble
        [TDouble, o] -> error $ "tc: Can't mix * with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix * with TDouble and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to *: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to *."
    PDivide ->
      case map (tc env) es of
        [TInt, TInt] -> TInt
        [TInt, o] -> error $ "tc: Can't mix / with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix / with TInt and " <> show o
        [TDouble, TDouble] -> TDouble
        [TDouble, o] -> error $ "tc: Can't mix / with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix / with TDouble and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to /: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to /."
tc env (ESource (ES _id t) def) =
  if haslam t then error $ "tc: Sources cannot contain functions. Found one in type: " <> show t
  else let tv = tc env def
  in if tv == t
        then t
        else error $ "tc: Default value of source doesn't have type of source. Expected " <> show t <> " but got " <> show tv

haslam :: T -> Bool
haslam (TLam _ _) = True
haslam (TList t) = haslam t
haslam (TObject m) = any haslam (M.elems m)
haslam _ = False

eval :: Env -> E -> (V, [VS])
eval _env (EInt n)         = (VInt n, [])
eval _env (EDouble d)      = (VDouble d, [])
eval _env (EBool b)        = (VBool b, [])
eval _env (EString t)      = (VString t, [])
eval env (EList _ es)        = let vs = map (eval env) es
                               in (VList (map fst vs), concatMap snd vs)
eval env (EObject fs)      =
  let vs = M.map (eval env) fs
  in (VObject (M.map fst vs), concat $ M.map snd vs)
eval (Env env) (EVar v)    =
  case M.lookup v env of
    Nothing -> error $ "Could not find " <> show v <> " in env " <> show env
    Just v' -> (v', [])
eval env (ELam vs e)     = (VLam env (map fst vs) e, [])
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
eval env (EDot e f)        = let v = eval env e
                             in case fst v of
                                  VObject fs -> (fs M.! f, snd v)
                                  _ -> error $ "Non-object in dot: " <> show e
eval env (ELet var e b)    =
  -- NOTE(dbp 2015-12-26): I haven't thought through this recursion
  -- very well. It _seems_ plausible, because we are using it to
  -- implement recursion (so anywhere it'll cause divergence,
  -- presumably the looping should have happened).
  let v  = eval (extendEnv env [(var, fst v)]) e
      v' = eval (extendEnv env [(var, fst v)]) b
  in (fst v', snd v <> snd v')
eval env (EPrim p es)      =
  let vs' = map (eval env) es
      vs  = map fst vs'
      ss  = concatMap snd vs'
  in case p of
       PPlus -> case vs of
                  [VInt a, VInt b] -> (VInt (a + b), ss)
                  [VDouble a, VDouble b] -> (VDouble (a + b), ss)
                  [VString a, VString b] -> (VString (a <> b), ss)
                  _ -> error $ "+: didn't get two ints, two doubles, or two strings, got: " <> show vs
       PTimes -> case vs of
                   [VInt a, VInt b] -> (VInt (a * b), ss)
                   [VDouble a, VDouble b] -> (VDouble (a * b), ss)
                   _ -> error $ "*: didn't get two ints, or two doubles, got: " <> show vs
       PMinus -> case vs of
                   [VInt a, VInt b] -> (VInt (a - b), ss)
                   [VDouble a, VDouble b] -> (VDouble (a - b), ss)
                   _ -> error $ "-: didn't get two ints, or two doubles, got: " <> show vs
       PDivide -> case vs of
                    [VInt a, VInt b] -> (VInt (a `div` b), ss)
                    [VDouble a, VDouble b] -> (VDouble (a / b), ss)
                    _ -> error $ "*: didn't get two ints, or two doubles, got: " <> show vs
eval env (ESource (ES id' _t) def)      =
  let v = eval env def
  in (fst v, snd v <> [VSBase id' [] (fst v)])
