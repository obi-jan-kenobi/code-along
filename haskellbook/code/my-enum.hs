module Fraudenum where

myEnumFromTo :: (Enum a, Ord a) => a -> a -> [a]
myEnumFromTo start stop = go start stop []
  where go from to result
          | from == to = result ++ [from]
          | from < to = go (succ from) to (result ++ [from])
