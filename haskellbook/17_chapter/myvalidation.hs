module MyValidation where

data Validation e a
  = Failure e
  | Success a
  deriving (Eq, Show)

instance Functor (Validation e) where
  fmap _ (Failure e) = Failure e
  fmap f (Success a) = Success $ f a

instance Monoid e => Applicative (Validation e) where
  pure a = Success a
  (<*>) (Failure x) (Failure y) = Failure $ mappend x y
  (<*>) _ (Failure y) = Failure y
  (<*>) (Failure x) _ = Failure x
  (<*>) (Success f) (Success x) = Success $ f x
