eftBool :: Bool -> Bool -> [Bool]
eftBool start stop
    | start < stop = []
    | start > stop = [start, stop]
    | start == stop = [start]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd start stop = go start stop start []

eftInt :: Int -> Int -> [Int]
eftInt start stop = go start stop start []

eftChar :: Char -> Char -> [Char]
eftChar start stop = go start stop start []

go start stop current result
            | start > stop = result
            | current < stop = go start stop (succ current) (result ++ [current])
            | current == stop = result ++ [current]

filterFiller :: String -> [String]
filterFiller = filter (\x -> x /= "the" && x /= "an" && x /= "a") . words

myZip :: [a] -> [b] -> [(a, b)]
myZip x y = go x y []
    where go _ [] result = result
          go [] _ result = result
          go (x:xs) (y:ys) result = go xs ys (result ++ [(x,y)])

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f x y = go f x y []
    where go _ _ [] result = result
          go _ [] _ result = result
          go f (x:xs) (y:ys) result = go f xs ys (result ++ [f x y])
