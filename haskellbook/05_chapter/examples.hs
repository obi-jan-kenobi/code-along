module Examples5 where

-- sectioning

-- both same
addtwoto = (+2)
addtotwo = (2+)

-- not same
powerTwo = (2^)
twoPower = (^2)

celebrate = (++ " woot!")

isInTen = (`elem` [1..10])

isTenIn :: (Eq a, Num a) => [a] -> Bool
isTenIn = (10 `elem`)

g :: a -> b -> c -> b
g x y z = y

h :: (Num a, Num b) => a -> b -> b
h x y = y
