{
module ParseE (parse) where

import Data.Monoid

import Lexer
import Lang
}

%name parse
%tokentype { Token }
%error { parseError }

%token
      int             { TokenInt $$ }
      double          { TokenDouble $$ }
      true            { TokenTrue }
      false           { TokenFalse }
      var             { TokenVar $$ }
      string          { TokenString $$ }
      tint            { TokenTInt }
      tstring         { TokenTString }
      '.'             { TokenDot }
      ','             { TokenComma }
      ':'             { TokenColon }
      '('             { TokenPO }
      ')'             { TokenPC }
      '['             { TokenSBO }
      ']'             { TokenSBC }
      '{'             { TokenBO }
      '}'             { TokenBC }
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
      | '(' ')' '{' Exp '}' { ELam [] $4 }
      | '(' LamArgs ')' '{' Exp '}' { ELam $2 $5 }
      | Exp '(' ')' { EApp $1 [] }
      | Exp '(' AppArgs ')' { EApp $1 $3 }

ListElems : Exp ',' ListElems { $1:$3 }
          | Exp { [$1] }

LamArgs : var ':' Type ',' LamArgs { (Var $1, $3):$5 }
        | var ':' Type { [(Var $1, $3)] }

AppArgs : Exp ',' AppArgs { $1:$3 }
        | Exp { [$1] }

Type : tint { TInt }
     | tstring { TString }
     | '[' Type ']' { TList $2 }
     | '->' Type { TLam [] $2 }
     | ArrowArgs '->' Type { TLam $1 $3 }

ArrowArgs : Type ',' ArrowArgs { $1:$3 }
          | Type { [$1] }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"
}