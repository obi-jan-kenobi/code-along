-- IO-Actions will be perfomed when its given the 'main' name and then run it
-- in a 'do-block' the last action cannot be bound because it extracts the value from its last action
-- and yields that as its own result

main = do 
  putStrLn "hello world"
  name <- getLine
  putStrLn $ "Hey " ++ name ++ ", you rock!"

-- putStrLn :: String -> IO ()
-- getLine :: IO String
