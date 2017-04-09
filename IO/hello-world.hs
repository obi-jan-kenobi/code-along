import Data.Char
-- IO-Actions will be perfomed when its given the 'main' name and then run it
-- in a 'do-block' the last action cannot be bound because it extracts the value from its last action
-- and yields that as its own result
-- several 'do-blocks' can be nested



main = do 
  putStrLn "whats your firstname?"
  firstname <- getLine
  putStrLn "whats your lastname?"
  lastname <- getLine
  let upperFirst = map toUpper firstname
  let upperLast = map toUpper lastname 
  -- let can be used to bind pure values to names
  
  putStrLn $ "Hey " ++ upperFirst ++ " " ++ upperLast ++ ", you rock!"

-- putStrLn :: String -> IO ()
-- getLine :: IO String
