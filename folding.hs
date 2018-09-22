joinStrings :: [String] -> String
joinStrings xs = foldr (++) "" xs

sumIntegers :: [Integer] -> Integer
sumIntegers xs = foldr (+) 0 xs

subtractNums :: Num a => [a] -> a
subtractNums xs = foldr (-) 0 xs

productOfIntegers :: [Integer] -> Integer
productOfIntegers xs = foldr (*) 1 xs
