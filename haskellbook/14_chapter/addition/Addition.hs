module Addition where

import Test.Hspec
import Test.QuickCheck

genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a'..'z']

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a,b)
genTuple = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a,b,c)
genThreeple = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (a,b,c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
    a <- arbitrary
    b <- arbitrary
    elements [Left a, Right b]

genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
    a <- arbitrary
    elements [Nothing, Just a]

genMaybe' :: Arbitrary a => Gen (Maybe a)
genMaybe' = do
    a <- arbitrary
    frequency [(1, return Nothing), (3, return $ Just a)]

runQc :: IO ()
runQc = quickCheck $ \x -> x + 1 > (x :: Int)

main :: IO ()
main = hspec $ do
    describe "Addition" $ do
        it "1 + 1 is greater than 1" $ do
            (1 + 1) > 1 `shouldBe` True
        it "x + 1 is always greater than x" $ do
            property $ \x -> x + 1 > (x :: Int)
    describe "Multiplication" $ do
        it "2 * 2 should equal 4" $ do
            mult 2 2 `shouldBe` 4
        it "5 * -7 should equal -35" $ do
            mult 5 (-7) `shouldBe` (-35)


mult :: (Ord a, Num a) => a -> a -> a
mult x y = go x y 0
    where go n m sum
            | m == 0 = sum
            | m < 0 = go n (m + 1) (sum - n)
            | otherwise = go n (m - 1) (sum + n)
