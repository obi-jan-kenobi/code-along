palindromer :: [a] -> [a]
palindromer [] = []
palindromer xs = xs ++ reverse xs
