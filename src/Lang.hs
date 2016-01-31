{-

This module defines a Simple-Typed Lambda Calculus with recursive
bindings (and thus non-termination) and 'Sources', which are values
with some meta-data that is propogated through computations, such that
any resulting value will have all the sources that were involved in
its result. This is used for out-of-language mutation and then
recomputation.

-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TupleSections     #-}

module Lang where

import           Data.List   (nub)
import qualified Data.Map    as M
import           Data.Maybe  (fromMaybe)
import           Data.Monoid ((<>))
import           Data.Text   (Text)
import qualified Data.Text   as T

data T = TInt
       | TDouble
       | TBool
       | TString
       | TList !T
       | TObject !(M.Map Text T)
       | TLam ![T] !T
       deriving (Show, Eq)

renderT :: T -> Text
renderT TInt = "int"
renderT TDouble = "double"
renderT TBool = "bool"
renderT TString = "string"
renderT (TList t) = "[" <> renderT t <> "]"
renderT (TObject fs) = "{" <> T.intercalate "," (map (\(k, v) -> k <> ": " <> renderT v) (M.assocs fs)) <> "}"
renderT (TLam as r) = T.intercalate ", " (map renderT as) <> " -> " <> renderT r

data Var = Var Text deriving (Show, Eq, Ord)

data Prim = PPlus
          | PTimes
          | PMinus
          | PDivide
          | PEquals
          deriving (Show, Eq)

data E = EInt Int
       | EDouble Double
       | EBool Bool
       | EString Text
       | EList T [E]
       | EObject (M.Map Text E)
       | EVar Var
       | ELam [(Var, T)] T E
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

renderV :: V -> Text
renderV (VInt n) = T.pack (show n)
renderV (VDouble n) = T.pack (show n)
renderV (VBool True) = "true"
renderV (VBool False) = "false"
renderV (VString s) = s
renderV (VList vs) = "[" <> T.intercalate ", " (map renderV vs) <> "]"
renderV (VObject m) = "{" <> T.intercalate ", " (map (\(k,v) -> k <> ": " <> renderV v) $ M.assocs m) <> "}"
renderV (VLam _ as _) = "(" <> T.intercalate ", " (map (\(Var v) -> v) as) <> ") { .. }"

data VS = VSBase Id [UserId] V
        | VSList Id [UserId] [VS]
        | VSObject Id [UserId] (M.Map Text VS)
        deriving (Show, Eq)

data Id = Id Text deriving (Show, Eq)

data UserId = UserId Int deriving (Show, Eq)

type SourceResolver = VS -> IO (Maybe V)


tc :: Bool -> TEnv -> E -> (T, TEnv)
tc _ e (EInt _)                    = (TInt, e)
tc _ e (EDouble _)                 = (TDouble, e)
tc _ e (EBool _)                   = (TBool, e)
tc _ e (EString _)                 = (TString, e)
tc _ env (EList t es)                =
  case nub $ map (fst . tc False env) es of
    [] -> (TList t, env)
    [t'] | t == t' -> (TList t, env)
    [t']  -> error $ "tc: List elements don't have type of annotation. Annotation was " <> show t <> " but elements have type " <> show t'
    ts -> error $ "tc: Found list with different sorts of elements in it: " <> show ts
tc _ env (EObject fs)              = (TObject $ M.map (fst . tc False env) fs, env)
tc _ (TEnv env) (EVar v)           = fromMaybe (error $ "tc: Unbound identifier " <> show v) ((, TEnv env) <$> M.lookup v env)
tc shallow env (ELam vs rt e)      =
  if shallow
     then (TLam (map snd vs) rt, env)
     else let bt = fst $ tc False (extendTEnv env vs) e
          in if bt == rt then (TLam (map snd vs) bt, env) else error $ "tc: expected return type of function to be " <> show rt <> ", but got " <> show bt <> " instead."
tc _ env (EApp e es)  = case fst $ tc False env e of
                          TLam ts t -> let as = map (fst . tc False env) es in
                                           if as == ts
                                              then (t, env)
                                              else error $ "tc: Arguments did not match types expected by lambda. Expected " <> show ts <> " but got " <> show as
                          t -> error $ "tc: Got non-function type in application: " <> show t
tc _ env (EIf c t e) = case fst $ tc False env c of
                         TBool -> let tt = fst $ tc False env t
                                      te = fst $ tc False env e
                                  in if tt == te
                                        then (tt, env)
                                        else error $ "tc: if had different types in the then and else branches: " <> show tt <> " and " <> show te
                         t' -> error $ "tc: Got non-boolean in if test: " <> show t'
tc _ env (ECase e n h t s)         =
  let v = fst $ tc False env e
  in case v of
       TList te ->
         let tnull = fst $ tc False env n
             tcons = fst $ tc False (extendTEnv env [(h, te), (t, TList te)]) s
         in if tnull == tcons
               then (tnull, env)
               else error $ "tc: null and cons branch of case did not have the same type: " <> show tnull <> " and " <> show tcons
       twrong -> error $ "tc: Got non-list in case: " <> show twrong
tc _ env (EDot e f)                =
  case fst $ tc False env e of
    to@(TObject fs) ->
      case M.lookup f fs of
        Just t -> (t, env)
        Nothing -> error $ "tc: field " <> show f <> " not found on object: " <> show to
    t -> error $ "tc: got non-object in dot: " <> show t
tc _ env (ELet var e b)            = let t = fst $ tc True env e
                                     in tc False (extendTEnv env [(var, t)]) b
tc _ env (EPrim p es)              =
  case p of
    PPlus ->
      case map (fst . tc False env) es of
        [TInt, TInt] -> (TInt, env)
        [TInt, o] -> error $ "tc: Can't mix + with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix + with TInt and " <> show o
        [TDouble, TDouble] -> (TDouble, env)
        [TDouble, o] -> error $ "tc: Can't mix + with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix + with TDouble and " <> show o
        [TString, TString] -> (TString, env)
        [TString, o] -> error $ "tc: Can't mix + with TString and " <> show o
        [o, TString] -> error $ "tc: Can't mix + with TString and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to +: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to +."
    PMinus ->
      case map (fst . tc False env) es of
        [TInt, TInt] -> (TInt, env)
        [TInt, o] -> error $ "tc: Can't mix - with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix - with TInt and " <> show o
        [TDouble, TDouble] -> (TDouble, env)
        [TDouble, o] -> error $ "tc: Can't mix - with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix - with TDouble and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to -: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to -."
    PTimes ->
      case map (fst . tc False env) es of
        [TInt, TInt] -> (TInt, env)
        [TInt, o] -> error $ "tc: Can't mix * with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix * with TInt and " <> show o
        [TDouble, TDouble] -> (TDouble, env)
        [TDouble, o] -> error $ "tc: Can't mix * with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix * with TDouble and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to *: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to *."
    PDivide ->
      case map (fst . tc False env) es of
        [TInt, TInt] -> (TInt, env)
        [TInt, o] -> error $ "tc: Can't mix / with TInt and " <> show o
        [o, TInt] -> error $ "tc: Can't mix / with TInt and " <> show o
        [TDouble, TDouble] -> (TDouble, env)
        [TDouble, o] -> error $ "tc: Can't mix / with TDouble and " <> show o
        [o, TDouble] -> error $ "tc: Can't mix / with TDouble and " <> show o
        [a,b] -> error $ "tc: Invalid arguments to /: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to /."
    PEquals ->
      case map (fst . tc False env) es of
        [t1, t2] | t1 == t2 && notLam t1 -> (TBool, env)
          where notLam (TLam _ _) = False
                notLam _ = True
        [a,b] -> error $ "tc: Invalid arguments to ==: " <> show a <> " and " <> show b
        _ -> error "tc: Need two arguments to ==."

tc _ env (ESource (ES _id t) def) =
  if haslam t then error $ "tc: Sources cannot contain functions. Found one in type: " <> show t
  else let tv = fst $ tc False env def
  in if tv == t
        then (t, env)
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
eval env (ELam vs _ e)     = (VLam env (map fst vs) e, [])
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
       PEquals -> case vs of
                    [VLam _ _ _, _] -> error "==: can't compare functions."
                    [_, VLam _ _ _] -> error "==: can't compare functions."
                    [v1, v2] -> (VBool (v1 == v2), ss)
                    _ -> error $ "==: didn't get two arguments, got: " <> show vs
eval env (ESource (ES id' _t) def)      =
  let v = eval env def
  in (fst v, snd v <> [VSBase id' [] (fst v)])
