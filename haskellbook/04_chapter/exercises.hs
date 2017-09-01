module Exercise4 where

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah

-- 1.
-- :t length
-- length :: [a] -> Int

-- 2.
-- length [1,2,3,4,5] -- 5
-- length [(1, 2), (2, 3), (3, 4)] -- 3
-- length allAwesome -- 2
-- length (concat allAwesome) -- 5

-- 3.
-- length evaluates to Int
-- / expects a Fractional

-- 4.
-- div 6 length [1,2,3]

-- 5.
-- :t 2 + 3 == 5
-- Bool

-- 6.
-- let x = 5
-- x + 3 == 5 -- Bool False

-- 7. 
-- length allAwesome == 2 -- works - false
-- length [1, 'a', 3, 'b'] -- type-mismatch
-- length allAwesome + length awesome -- works -- 7
-- (8 == 8) && ('b' < 'a') -- works - false
-- (8 == 8) && 9 -- 9 is no Bool

-- 8.

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

myAbs :: Integer -> Integer
myAbs x = if x > 0 then x else negate x

f:: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))

x = (+)

fs xs = x w 1
  where w = length xs

-- \x -> x
-- \x : xs ->

fx (a, b) = a