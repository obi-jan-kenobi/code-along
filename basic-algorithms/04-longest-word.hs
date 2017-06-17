longestWord :: [String] -> String
longestWord [] = ""
longestWord [x] = foldr (\x y -> longer) "" [x]
  where longer x y = 

longer :: [] -> [] -> []
longer x y = if (length x > length y) then x else y

