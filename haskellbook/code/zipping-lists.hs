module MyZip where

jszip :: [a] -> [b] -> [(a, b)]
jszip [] _ = []
jszip _ [] = []
jszip (x:xs) (y:ys) = (x, y) : (zip xs ys)

jszipwith :: (a -> b -> c) -> [a] -> [b] -> [c]
jszipwith _ [] _ = []
jszipwith _ _ [] = []
jszipwith f (x:xs) (y:ys) = (f x y) : (jszipwith f xs ys) 
