-- main is an IO-action and can get nested in a do-block
-- here it calls itself recursivly

-- return wrap a pure value in an IO-action
-- its possible to bind those actions to names like so 
-- a <- return "hello"
-- its "the opposite of <-"

main = do
  line <- getLine
  if null line
    then return ()
    else do
          putStrLn $ reverseWords line
          main

-- words breaks a string up into a list of words, which were delimited by white space.
-- unwords is an inverse operation to words. It joins words with separating spaces.
reverseWords :: String -> String
reverseWords = unwords . map reverse . words
