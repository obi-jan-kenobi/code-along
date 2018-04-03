module Validation where

import Data.List (nub)
import Data.Monoid ((<>))
type Password = String

data Validation e a
  = Error e
  | Valid a
  deriving (Show, Eq)

instance Functor (Validation e) where
  fmap f (Valid a) = Valid $ f a
  fmap _ (Error e) = Error e


instance (Monoid e) => Applicative (Validation e) where
  pure a = Valid a
  (<*>) (Valid f) (Valid x) = Valid $ f x
  (<*>) (Error x) (Error y) = Error $ x <> y
  (<*>) (Error x) _ = Error x
  (<*>) _ (Error y) = Error y

passwordLength :: Password -> Validation [String] Password
passwordLength pw
  | length pw < 8 = Error ["Password too short"]
  | otherwise = Valid pw

passwordChars :: Password -> Validation [String] Password
passwordChars pw
  | (length $ nub pw) < 4 = Error ["Too many repetitive chars"]
  | otherwise = Valid pw

validatePW :: Password -> Validation [String] Password
validatePW pw = (\x y -> y) <$> passwordLength pw <*> passwordChars pw
