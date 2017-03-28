multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

multTwoWithNine :: Int -> Int -> Int
multTwoWithNine = multThree 9

compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x

-- equivalent to above

compareWithHundred' :: Int -> Ordering
compareWithHundred' = compare 100

-- Sections
-- for infix operators

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

-- Functions can take Functions as parameters
applyTwice :: (a -> a) -> a -> a
applyTwice fn x = fn (fn x)

doubleMe :: (Num a) => a -> a
doubleMe a = a * 2

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _   = []
zipWith' _ _ []   = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x
