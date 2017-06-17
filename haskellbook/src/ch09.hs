module ChapterNine where

import Data.Char

onlyUpper :: String -> String
onlyUpper = filter isUpper

capitalize :: String -> String
capitalize [] = []
capitalize xs = toUpper (head xs) : tail xs

initial :: String -> Char
initial = toUpper . head

myrev :: [a] -> [a]
myrev [] = []
myrev (x:xs) = (myrev xs) ++ [x]

squish :: [[a]] - [a]
squish [] = []
squish [[]] = []
squish 
