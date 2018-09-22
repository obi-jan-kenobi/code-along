module EitherLib where

lefts' :: [Either a b] -> [a]
lefts' = foldr addLeft []
    where 
        addLeft (Left x) xs = x:xs  
        addLeft _ xs = xs

rights' :: [Either a b] -> [b]
rights' = foldr addRight []
    where
        addRight (Right x) xs = x:xs
        addRight _ xs = xs

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' = foldr partition ([], [])
    where
        partition (Right x) (lefts, rights) = (lefts, x:rights)
        partition (Left x) (lefts, rights) = (x:lefts, rights)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f (Left x) = Nothing
eitherMaybe' f (Right x) = Just $ f x

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f g (Left x) = f x
either' f g (Right x) = g x

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (\x -> Nothing) (Just . f)
