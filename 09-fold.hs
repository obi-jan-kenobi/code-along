-- reducer
-- takes binary function
-- starting value (accumulator)
-- and list to fold up

-- foldl starts at head
-- foldr starts at end and binary function gets params reversed

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- same as 
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

--since : is much faster than ++ its common to use foldr to build up new lists
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

-- foldl1 and foldr1 take first elem as starting value
