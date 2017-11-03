module Addition where

import Test.Hspec

main :: IO ()
main = hspec $ do
    describe "Addition" $ do
        it "1 + 1 is greater than 1" $ do
            (1 + 1) > 1 `shouldBe` True
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
