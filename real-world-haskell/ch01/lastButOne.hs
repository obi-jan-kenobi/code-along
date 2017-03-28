lastButOne :: [a] -> a
lastButOne [] = 
lastButOne (x:xs) = if (length xs > 1) then lastButOne xs else x
