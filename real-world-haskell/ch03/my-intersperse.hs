intersperse' :: a -> [[a]] -> [a]
intersperse' _ [] = []
intersperse' _ (x:[]) = x
intersperse' x (y:ys) = y ++ [x] ++ (intersperse' x ys)

flatten' :: [[a]] -> [a]
flatten' [] = []
flatten' [[]] = []
flatten' (y:ys) = y ++ flatten' ys
