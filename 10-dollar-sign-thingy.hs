-- $: function application operator
-- has lowest precedence

printStrLn sqrt 3 + 4 + 9 -- 14.73...

-- the same
printStrLn sqrt (3 + 4 + 9) -- 4.0
printStrLn sqrt $  3 + 4 + 9 -- 4.0
