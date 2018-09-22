module Exercise where

sum :: (Foldable t, Num a) => t a -> a
sum = foldr (+) 0

product :: (Foldable t, Num a) => t a -> a
product = foldr (*) 1

elem :: (Foldable t, Eq a) => a -> t a -> Bool
elem x xs = foldr (\y ys -> if y == x then True else ys) False xs

min :: (Ord a) => a -> Maybe a -> Maybe a
min x Nothing = Just x
min x (Just y) = if x >= y then Just y else Just x

minimum :: (Foldable t, Ord a) => t a -> Maybe a
minimum xs = foldr (Exercise.min) Nothing xs

max :: (Ord a) => a -> Maybe a -> Maybe a
max x Nothing = Just x
max x (Just y) = if x >= y then Just x else Just y

maximum :: (Foldable t, Ord a) => t a -> Maybe a
maximum xs = foldr (Exercise.max) Nothing xs

null :: (Foldable t) => t a -> Bool
null = foldr (\y ys -> False) True

length :: (Foldable t) => t a -> Int
length = foldr (\y ys -> ys + 1) 0

toList :: (Foldable t) => t a -> [a]
toList = foldr (\y ys -> (y:ys)) []

fold :: (Foldable t, Monoid m) => t m -> m
fold = Prelude.foldMap id

foldMap :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
foldMap f = foldr (mappend . f) mempty