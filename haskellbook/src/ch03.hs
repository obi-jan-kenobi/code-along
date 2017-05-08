module Print where

myGreeting :: String
myGreeting = "hello" ++ " world!"

main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn "Count to four for me:"
  putStr "one, two"
  putStr ", three, and"
  putStrLn " four!"
  putStrLn secondGreeting
  where secondGreeting = concat ["hello", " ", "world"]

topLevelFunction :: Integer -> Integer
topLevelFunction x = x + woot + topLevelValue
  where woot :: Integer
        woot = 10

topLevelValue :: Integer
topLevelValue = 5

area d = pi * (r * r)
  where r = d / 2
