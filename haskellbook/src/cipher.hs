module Cipher where

import Data.Char

shiftBy :: Int -> Char -> Char
shiftBy x = chr . (+ 65) . (flip mod 26) . (+ x) . ord

caesar :: Int -> String -> String
caesar x = map (shiftBy x) 

uncaesar :: Int -> String -> String
uncaesar x = caesar (-x)
