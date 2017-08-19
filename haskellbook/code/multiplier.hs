module Multiplier where

myMultiplier :: (Integral a) => a -> a -> a
myMultiplier num mult = go num mult 0
  where go n m r
           | m == 0 = r
           | otherwise = go n (m - 1) (r + n)
