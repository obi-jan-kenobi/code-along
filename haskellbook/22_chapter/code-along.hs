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

-- Applicative f =>
-- f ~ (->) r
-- pure :: a -> f a pure :: a -> (r -> a)
-- (<*>) :: f (a -> b) -> f a -> f b 
-- (<*>) :: (r -> a -> b) -> (r -> a) -> (r -> b)

newtype HumanName = HumanName String deriving (Eq, Show)
newtype DogName = DogName String deriving (Eq, Show)
newtype Address = Address String deriving (Eq, Show)

data Person
  = Person 
    { humanName :: HumanName
    , dogName :: DogName
    , address :: Address
    } deriving (Eq, Show)

data Dog
  = Dog
    { dogsName :: DogName
    , dogsAddress :: Address
    } deriving (Eq, Show)

pers :: Person
pers = Person (HumanName "Big Bird") (DogName "Barkley") (Address "Sesame Street")

getDog :: Person -> Dog
getDog p = Dog (dogName p) (address p)

getDogR :: Person -> Dog
getDogR = Dog <$> dogName <*> address

-- Dog :: DogName -> Address -> Dog
-- Dog <$> dogName :: Person -> (Address -> Dog)
-- Dog <*> dogName <*> address :: Person -> Dog

getDogR' :: Person -> Dog
getDogR' = liftA2 Dog dogName address

-- Monad

data Reader r a = Reader { runReader :: r -> a }

foo :: (Functor f, Num a) => f a -> f a
foo r = fmap (+1) r

bar :: Foldable f => t a -> f a -> (t a, Int)
bar r t = (r, length t)

froot :: Num a => [a] -> ([a], Int)
froot r = (map (+1) r, length r)

frooty :: Num a => [a] -> ([a], Int)
frooty r = bar (foo r) r

frooty' :: Num a => [a] -> ([a], Int)
frooty' = \r -> bar (foo r) r

frootyR :: Num a => Reader [a] ([a], Int)
frootyR = Reader $ \r -> bar (foo r) r 

fooBind :: (r -> a) -> (a -> r -> b) -> (r -> b)
fooBind m k = \r -> k (m r) r

getDogRM :: Person -> Dog
getDogRM = do
  name <- dogName
  addr <- address
  return $ Dog name addr
