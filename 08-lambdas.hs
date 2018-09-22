-- are anonymous functions
-- start with \
-- take parameter spererated by spaces
-- followed by -> and function body
-- if lambda expression is not in ()
-- its assumend, that everything after -> is function body

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
