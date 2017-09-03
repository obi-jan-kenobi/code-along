module Chapter12 where

ifEvenAdd2 :: Int -> Maybe Int
ifEvenAdd2 n =
    if even n
    then Just (n + 2)
    else Nothing
