module Validation where

import Data.List (nub)
import Data.Monoid ((<>))
type Password = String

data Validation e a
  = Error e
  | Valid a

instance Functor (Validation e) where
  fmap f (Valid a) = Valid $ f a
  fmap _ (Error e) = Error e


instance (Monoid e) => Applicative (Validation e) where
  pure a = Valid a
  (<*>) (Valid f) (Valid x) = Valid $ f x
  (<*>) (Error x) (Error y) = Error $ x <> y
  (<*>) (Error x) _ = Error x
  (<*>) _ (Error y) = Error y

passwordLength :: Password -> Either String Password
passwordLength pw
  | length pw < 8 = Left "Password too short"
  | otherwise = Right pw

passwordChars :: Password -> Either String Password
passwordChars pw
  | (length $ nub pw) < 4 = Left "Too many repetitive chars"
  | otherwise = Right pw


