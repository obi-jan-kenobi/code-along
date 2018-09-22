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

pairGen :: (Arbitrary a, Arbitrary b) => Gen (Pair a b)
pairGen = do
    a <- arbitrary
    b <- arbitrary
    return $ Pair a b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Pair a b) where
    arbitrary = pairGen

sumGen :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGen = do
    a <- arbitrary
    b <- arbitrary
    oneof [return $ First a, return $ Second b]

trueGen :: Gen Int
trueGen = coarbitrary True' arbitrary

falseGen :: Gen Int
falseGen = coarbitrary False' arbitrary

main :: IO ()
main = do
    sample trivialGen
    sample (identityGen :: Gen (Identity Int))
    sample (pairGen :: Gen (Pair Int String))
    sample (sumGen :: Gen (Sum Char Int))
