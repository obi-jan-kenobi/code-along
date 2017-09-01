module Excercise3 where

takeThird = head . (drop 2)

letterIndex :: Int -> Char
letterIndex x = head $ drop x "Curry is awesome!"

data Mood = Blah | Woot deriving Show

changeMood :: Mood -> Mood
changeMood Woot = Blah
changeMood _ = Woot

awesome = ["Papuchon", "curry", ":)"]
also = ["Quake", "The Simons"]
allAwesome = [awesome, also]

-- length :: [a] -> Int

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = (==) (reverse x) x

myAbs :: Integer -> Integer
myAbs x = if x > 0 then x else x * (-1)

x = (+)

incLength xs = w `x` 1
    where
        w = length xs

myId :: a -> a
myId = \x -> x

myFirst :: (a, b) -> a
myFirst (a, b) = a
