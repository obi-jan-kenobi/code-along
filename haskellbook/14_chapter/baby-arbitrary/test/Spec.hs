module Main where

import Lib
import Test.QuickCheck

trivialGen :: Gen Trivial
trivialGen = return Trivial

instance Arbitrary Trivial where
    arbitrary = trivialGen

identityGen :: Arbitrary a => Gen (Identity a)
identityGen = do
    a <- arbitrary
    return $ Identity a

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = identityGen

main :: IO ()
main = do
    sample trivialGen
    sample (identityGen :: Gen (Identity Int))
