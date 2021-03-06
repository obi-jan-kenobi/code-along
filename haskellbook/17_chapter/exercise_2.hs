import Data.List (elemIndex)

x :: Maybe Int
x = elemIndex 3 [1,2,3,4,5]

y :: Maybe Int
y = elemIndex 4 [1,2,3,4,5]

max' :: Int -> Int -> Int
max' = max

sidestep :: Maybe (Int -> Int)
sidestep = max' <$> x

maxed :: Maybe Int
maxed = max' <$> x <*> y

