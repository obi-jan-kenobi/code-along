module Chapter22 where

import Control.Applicative

boop = (*2)
doop = (+10)

bip :: Integer -> Integer
bip = boop . doop

bloop :: Integer -> Integer
bloop = fmap boop doop

floop :: Integer -> Integer
floop = boop <$> doop

-- fmap :: (a -> b) -> f a -> f b
-- f = ((->) r)
-- fmap boop doop
-- (a -> b) -> ((-> r) a) -> ((-> r) b)
-- (Int -> Int) -> ((-> Int) Int) -> ((-> Int) Int)
-- ist das selbe wie function composition

bbop :: Integer -> Integer
bbop = (+) <$> boop <*> doop

-- fmap (+) boop
-- fmap :: (Int -> (Int -> Int)) -> (Int -> Int) -> (Int -> (Int -> Int))
-- fmap :: (a -> b) -> f a -> f b
-- f = ((->) r)
-- fmap :: (a -> b) -> ((->) r) a -> ((->) r) b
-- function composition

-- (+) <$> boop <*> doop
-- (Int -> Int -> Int) <*> doop
-- (Int -> Int -> Int) -> (Int -> Int) -> (Int -> Int)
-- (<*>) :: f (a -> b) -> f a -> f b
-- f = ((->) r)
-- (<*>) :: ((->) r) (r -> b) -> ((->) r) r -> ((->) r) b
-- (<*>) :: (r -> r -> b) -> (r -> r) -> (r -> b)
-- applicative leiten das argument an die funktionen weiter

bblop = bbop 3
-- ((*2) 3) + ((+10) 3)
