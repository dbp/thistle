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
      | TokenSemiColon
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
      | TokenIf
      | TokenElse
      | TokenCase
      | TokenEqual
      | TokenEquals
      | TokenIn
      | TokenSource
      | TokenAO
      | TokenAC
      | TokenPlus
      | TokenTimes
      | TokenMinus
      | TokenDivide
 deriving Show


lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
      | isSpace c = lexer cs
      | isAlpha c || c == '_' = lexVar (c:cs)
      | isDigit c = lexNum (c:cs)
lexer ('.':cs) = TokenDot : lexer cs
lexer (',':cs) = TokenComma : lexer cs
lexer ('=':'=':cs) = TokenEquals : lexer cs
lexer ('=':cs) = TokenEqual : lexer cs
lexer ('-':'>':cs) = TokenArrow : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer (';':cs) = TokenSemiColon : lexer cs
lexer ('(':cs) = TokenPO : lexer cs
lexer (')':cs) = TokenPC : lexer cs
lexer ('[':cs) = TokenSBO : lexer cs
lexer (']':cs) = TokenSBC : lexer cs
lexer ('{':cs) = TokenBO : lexer cs
lexer ('}':cs) = TokenBC : lexer cs
lexer ('<':cs) = TokenAO : lexer cs
lexer ('>':cs) = TokenAC : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('*':cs) = TokenTimes : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer ('/':cs) = TokenDivide : lexer cs
lexer ('"':cs) = let (s, rest) = span (/= '"') cs in
                 TokenString (pack s) : lexer (tail rest)

lexVar :: String -> [Token]
lexVar cs =
   case span (\c -> isAlpha c || isDigit c || c == '_' || c == '-' || c == '\'' ) cs of
      ("true",rest) -> TokenTrue : lexer rest
      ("false",rest) -> TokenFalse : lexer rest
      ("if",rest) -> TokenIf : lexer rest
      ("else",rest) -> TokenElse : lexer rest
      ("case",rest) -> TokenCase : lexer rest
      ("in",rest) -> TokenIn : lexer rest
      ("source",rest) -> TokenSource : lexer rest
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
