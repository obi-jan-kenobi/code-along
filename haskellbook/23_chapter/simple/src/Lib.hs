module Lib
    ( someFunc
    ) where

import System.Random

-- mkStdGen :: Int -> StdGen
-- next :: g -> (Int, g)
-- random :: (RandomGen g, Random a) => g -> (a, g)

init :: StdGen
init = mkStdGen 0

init' :: StdGen
init' = mkStdGen 0

first :: (Int, StdGen)
first = next init'

first' :: (Int, StdGen)
first' = next init'

second :: (Int, StdGen)
second = next $ snd $ next init'

rngGeneric :: Random a => (a, StdGen)
rngGeneric = random $ snd $ next init'

rngInt :: (Int, StdGen)
rngInt = random $ snd $ next init'

rngDouble :: (Double, StdGen)
rngDouble = random $ snd $ next init'

{-
newtype State s a =
  State { runState :: s -> (a, s) }

newtype Reader r a =
  Reader { runReader :: r -> a }

State :: (s -> (a, s)) -> State s a
runState :: State s a -> s -> (a, s)
-}

someFunc :: IO ()
someFunc = putStrLn "someFunc"
