module ChapterSeven where
functionC x y = 
  case (x > y) of
    True -> x
    False -> y

ifEvenAdd2 n =
  case even n of
    True -> n + 2
    False -> n

nums x =
  case compare x 0 of
    LT -> -1
    GT -> 1
    _ -> 0

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d = xLast `mod` 10

tensDivmod :: Integral a => a -> a
tensDivmod x = mod (fst (divMod x 10)) 10

hunsD x = mod (fst (divMod x 100)) 100

foldBool :: a -> a -> Bool -> a
foldBool x y z
  | z == True = x
  | otherwise = y

g :: (a -> b) -> (a, c) -> (b, c)
g f (x, xs) = (f x, xs)
