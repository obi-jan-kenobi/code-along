module MaybeLib where

isJust :: Maybe a -> Bool
isJust (Just x) = True
isJust _ = False

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _ = False

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee x f Nothing = x
mayybee x f (Just y) = f y

fromMaybe :: a -> Maybe a -> a
fromMaybe x Nothing = x
fromMaybe _ (Just x) = x

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:xs) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]

cutMaybes :: [Maybe a] -> [a]
cutMaybes [] = []
cutMaybes (Just x:xs) = x:(cutMaybes xs)
cutMaybes (Nothing:xs) = cutMaybes xs

flipMaybe :: Eq a => [Maybe a] -> Maybe [a]
flipMaybe xs
    | elem Nothing xs == True = Nothing
    | otherwise = Just (cutMaybes xs)
