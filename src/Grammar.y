{
module Grammar (parse) where

import Data.Monoid
import qualified Data.Map as M

import Lexer
import Lang
}

%name parse
%tokentype { Token }
%error { parseError }
%right in
%left '=='
%left '+' '-'
%left '*' '/'

%token
      int             { TokenInt $$ }
      double          { TokenDouble $$ }
      true            { TokenTrue }
      false           { TokenFalse }
      if              { TokenIf }
      else            { TokenElse }
      case            { TokenCase }
      in              { TokenIn }
      source          { TokenSource }
      '+'             { TokenPlus }
      '*'             { TokenTimes }
      '-'             { TokenMinus }
      '/'             { TokenDivide }
      '='             { TokenEqual }
      '=='            { TokenEquals }
      var             { TokenVar $$ }
      string          { TokenString $$ }
      tint            { TokenTInt }
      tdouble         { TokenTDouble }
      tbool           { TokenTBool }
      tstring         { TokenTString }
      '.'             { TokenDot }
      ','             { TokenComma }
      ':'             { TokenColon }
      ';'             { TokenSemiColon }
      '('             { TokenPO }
      ')'             { TokenPC }
      '['             { TokenSBO }
      ']'             { TokenSBC }
      '{'             { TokenBO }
      '}'             { TokenBC }
      '<'             { TokenAO }
      '>'             { TokenAC }
      '->'            { TokenArrow }


%%

Exp   : int  { EInt $1 }
      | double { EDouble $1 }
      | true { EBool True }
      | false { EBool False }
      | var { EVar (Var $1) }
      | string { EString $1 }
      | '[' ':' Type ']' { EList $3 [] }
      | '[' ListElems ':' Type ']' { EList $4 $2 }
      | '(' ')' ':' Type '{' Exp '}' { ELam [] $4 $6 }
      | '(' LamArgs ')' ':' Type '{' Exp '}' { ELam $2 $5 $7 }
      | Exp '(' ')' { EApp $1 [] }
      | Exp '(' AppArgs ')' { EApp $1 $3 }
      | '{' '}' { EObject M.empty }
      | '{' ObjectFields '}' { EObject (M.fromList $2) }
      | if Exp '{' Exp '}' else '{' Exp '}' { EIf $2 $4 $8 }
      | case Exp '{' Exp '}' '(' var var ')' '{' Exp '}' { ECase $2 $4 (Var $7) (Var $8) $11 }
      | Exp '.' var { EDot $1 $3 }
      | LetExp { $1 }
      | Exp '==' Exp { EPrim PEquals [$1, $3] }
      | Exp '+' Exp { EPrim PPlus [$1, $3] }
      | Exp '-' Exp { EPrim PMinus [$1, $3] }
      | Exp '*' Exp { EPrim PTimes [$1, $3] }
      | Exp '/' Exp { EPrim PDivide [$1, $3] }
      | '(' Exp ')' { $2 }
      | source '<' var ';' Type ';' Exp '>' { ESource (ES (Id $3) $5) $7 }

LetExp : var '=' Exp LetExp { ELet (Var $1) $3 $4 }
       | var '=' Exp in Exp { ELet (Var $1) $3 $5 }

ListElems : Exp ',' ListElems { $1:$3 }
          | Exp { [$1] }

LamArgs : var ':' Type ',' LamArgs { (Var $1, $3):$5 }
        | var ':' Type { [(Var $1, $3)] }

AppArgs : Exp ',' AppArgs { $1:$3 }
        | Exp { [$1] }

ObjectFields : var ':' Exp ',' ObjectFields { ($1,$3):$5 }
             | var ':' Exp { [($1, $3)] }

Type : tint { TInt }
     | tstring { TString }
     | tbool { TBool }
     | tdouble { TDouble }
     | '[' Type ']' { TList $2 }
     | '->' Type { TLam [] $2 }
     | ArrowArgs '->' Type { TLam $1 $3 }

ArrowArgs : Type ',' ArrowArgs { $1:$3 }
          | Type { [$1] }

{

parseError :: [Token] -> a
parseError s = error $ "Parse error at: " ++ unwords (map renderToken s)
}
