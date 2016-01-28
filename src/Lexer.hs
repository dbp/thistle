{-# LANGUAGE OverloadedStrings #-}
module Lexer where

import           Data.Char
import           Data.Monoid
import           Data.Text   (Text, pack)

data Token
      = TokenInt Int
      | TokenDouble Double
      | TokenTrue
      | TokenFalse
      | TokenString Text
      | TokenVar Text
      | TokenDot
      | TokenColon
      | TokenComma
      | TokenPO
      | TokenPC
      | TokenSBO
      | TokenSBC
      | TokenBO
      | TokenBC
      | TokenArrow
      | TokenTInt
      | TokenTString
 deriving Show


lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
      | isSpace c = lexer cs
      | isAlpha c || c == '_' = lexVar (c:cs)
      | isDigit c = lexNum (c:cs)
lexer ('.':cs) = TokenDot : lexer cs
lexer (',':cs) = TokenComma : lexer cs
lexer ('-':'>':cs) = TokenArrow : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('(':cs) = TokenPO : lexer cs
lexer (')':cs) = TokenPC : lexer cs
lexer ('[':cs) = TokenSBO : lexer cs
lexer (']':cs) = TokenSBC : lexer cs
lexer ('{':cs) = TokenBO : lexer cs
lexer ('}':cs) = TokenBC : lexer cs
lexer ('"':cs) = let (s, rest) = span (/= '"') cs in
                 TokenString (pack s) : lexer (tail rest)

lexVar :: String -> [Token]
lexVar cs =
   case span (\c -> isAlpha c || isDigit c || c == '_' || c == '-' || c == '\'' ) cs of
      ("true",rest) -> TokenTrue : lexer rest
      ("false",rest) -> TokenFalse : lexer rest
      ("int",rest) -> TokenTInt : lexer rest
      ("string",rest) -> TokenTString : lexer rest
      (var,rest)   -> TokenVar (pack var) : lexer rest

lexNum :: String -> [Token]
lexNum cs =
  case rest of
    ('.':xs) ->
      let (afterdec, rest') = span isDigit xs
      in TokenDouble (read (num <> "." <> afterdec)) : lexer rest'
    _ -> TokenInt (read num) : lexer rest
  where (num,rest) = span isDigit cs
