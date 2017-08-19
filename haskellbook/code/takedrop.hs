module Words where

myWords :: [Char] -> [[Char]]
myWords [] = []
myWords a = takeWhile (/= ' ') a : myWords (dropWhile (/= ' ') (tail a))
