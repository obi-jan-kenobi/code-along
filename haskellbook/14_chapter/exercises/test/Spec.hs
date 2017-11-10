module Main where

import Data.List (sort)
import Test.Hspec
import Test.QuickCheck
import WordNumber
import HalfIdentity
import IsOrdered

main :: IO ()
main = hspec $ do
    describe "digitToWord" $ do
        it "returns zero for 0" $ do
            digitToWord 0 `shouldBe` "zero"
        it "returns one for 1" $ do
            digitToWord 1 `shouldBe` "one"

    describe "digits" $ do
        it "returns [1] for 1" $ do
            digits 1 `shouldBe` [1]
        it "return [1,0,0] for 100" $ do
            digits 100 `shouldBe` [1,0,0]

    describe "wordNumber" $ do
        it "one-zero-zero given 100" $ do
            wordNumber 100 `shouldBe` "one-zero-zero"
        it "nine-zero-zero-one for 9001" $ do
            wordNumber 9001 `shouldBe` "nine-zero-zero-one"

    describe "halfIdentity" $ do
        it "should always return its input unmodified" $ do
            property $ \x -> halfIdentity x == (x :: Double)

    describe "listOrdered" $ do
        it "should return true for every sorted list" $ do
            property $ \xs -> listOrdered (sort xs :: [Double]) == True

    describe "Associativity Addition" $ do
        it "should hold" $ do
            property $ \x y z -> x + (y + z) == ((x :: Int) + (y :: Int)) + (z :: Int)

    describe "Commutativity Addition" $ do
        it "should hold" $ do
            property $ \x y -> x + y == (y :: Int) + (x :: Int)

    describe "Associativity Multiplication" $ do
        it "should hold" $ do
            property $ \x y z -> x * (y * z) == ((x :: Int) * (y :: Int)) * (z :: Int)

    describe "Commutativity Multiplication" $ do
        it "should hold" $ do
            property $ \x y -> x * y == (y :: Int) * (x :: Int)

    describe "Quot & Rem laws" $ do
        it "should hold for quot and & rem" $ do
            property $ \x y -> x /= 0 && y /= 0 ==> (quot x y) * y + (rem x (y :: Int)) == (x :: Int)
        it "should hold for div & mod" $ do
            property $ \x y -> x /= 0 && y /= 0 ==> (div x y) * y + (mod x (y :: Int)) == (x :: Int)

    describe "Power" $ do
        it "should not be associative" $ do
            property $ \x y z -> x /= 0 && y > 0 && z > 0 ==> (x ^ y) ^ z /= (x :: Int) ^ ((y :: Int) ^ (z :: Int))

    describe "reverse twice == id" $ do
        it "reverse . reverse == id for lists" $ do
            property $ \x -> (reverse $ reverse x) == id (x :: [Int])

    describe "function application" $ do
        it "f a == f $ a" $ do
            property $ \x -> ((+) x ((+) x x)) == ((+) x $ (+) x (x :: Int))

    describe "f . g == x -> f (g x)" $ do
        it "should be the same" $ do
            property $ \x -> ((2+) . (2-)) x == ((2+) ((2-)(x :: Int)))

    describe "foldr" $ do
        it "foldr (:) == (++)" $ do
            property $ \x -> foldr (:) "" x == (++) "" (x :: [Char])
        it "foldr (++) [] == concat" $ do
            property $ \x -> foldr (++) [] x == concat (x :: [[Char]])

    describe "f n xs = length (take n xs)" $ do
        it "is the same as n" $ do
            property $ \x xs -> length (take x (xs :: [Int])) == (x :: Int)

