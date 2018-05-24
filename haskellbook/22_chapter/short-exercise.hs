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

newtype Reader r a
    = Reader { runReader :: r -> a }

instance Functor (Reader r) where
    -- fmap :: (a -> b) -> Reader r a -> Reader r b
    fmap f (Reader ra) = Reader $ (f . ra)

ask :: Reader a a
ask = Reader id

myLiftA2 :: Applicative f => (a -> b -> c) -> f a -> f b -> f c
myLiftA2 r a b = r <$> a <*> b

asks :: (r -> a) -> Reader r a
asks f = Reader f

instance Applicative (Reader r) where
  pure a = Reader $ \r -> a
  (<*>) (Reader rab) (Reader ra) = Reader $ \r -> (rab r) (ra r)
