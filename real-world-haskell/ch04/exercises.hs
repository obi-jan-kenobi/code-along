import Data.Char (digitToInt)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast xs = Just $ (head . reverse) xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just $ (reverse . tail . reverse) xs

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith f xs =
    let (pre, suf) = span f xs
    in pre:(splitWith f suf)

asInt :: String -> Int
asInt xs = 
    let (int, _) = foldr step (0, 1) xs
    in int
    where step x (ys, digits) = if (x == '-') then (ys * (-1), digits) else (ys + (digitToInt x) * digits, 10 * digits)

concat' :: [[a]] -> [a]
concat' = foldr (++) []

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' f xs =
    let (result, _) = foldr step ([], True) xs
    in result
    where step x (ys, pred) = if (f x && pred) then (x:ys, True) else (ys, False) 
