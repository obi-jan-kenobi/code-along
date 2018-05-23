module ShortExercise where

import Control.Applicative
import Data.Char

cap :: [Char] -> [Char]
cap = map toUpper

rev :: [Char] -> [Char]
rev = reverse

composed :: [Char] -> [Char]
composed = cap . rev

fmapped :: [Char] -> [Char]
fmapped = cap <$> rev

tupled :: [Char] -> ([Char], [Char])
tupled = (,) <$> rev <*> cap

-- (,) <$> rev
-- :t (a -> (b -> (a,b))) <$> ((-> [Char]) [Char])
-- [Char] -> b -> ([Char], b)
--
-- (,) <$> rev <*> cap
-- :t ([Char] -> b -> ([Char], b)) -> <*> ([Char] -> [Char])
-- [Char] -> ([Char], [Char])

