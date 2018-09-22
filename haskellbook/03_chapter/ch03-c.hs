module DropTake where

shout :: String -> String
shout x = concat [x, "!"]

fifth :: String -> String
fifth x = take 1 $ drop 4 x

dropNine:: String -> String
dropNine = drop 9

thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex = (!!) "Curry is awesome!"
