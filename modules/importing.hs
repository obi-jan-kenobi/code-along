-- general import
import Data.List

-- selective import 
import Data.List (nub, sort)

-- hiding import
import Data.List hiding (nub)

-- qualified import
-- import has to be fully qualified
import qualified Data.Map

-- qualified import with alias
import qualified Data.Map as M

import qualified Data.Char as C

-- nub is a function from Data.List
-- composing is equivalent to \xs = length (nub xs)
numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

wordNums :: String -> [(String, Int)]
wordNums = map(\ws -> (head ws, length ws)) . group . sort . words

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` hayStack = any (needle `isPrefixOf`) (tails hayStack)

encode :: Int -> String -> String
encode offset msg = map (C.chr . (+ offset) . C.ord) msg

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

digitSum :: Int -> Int
digitSum = sum . map C.digitToInt . show

firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]
