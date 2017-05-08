sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

-- rewritten whith where
where1 = x * 3 + y
  where x = 3
        y = 1000

where2 = x * 5
  where y = 10
        x = 10 * 5 + y

where3 = z / x + y
  where x = 7
        y = negate x
        z = y * 10

waxOn = x * 5
  where x = y ^ 2
        y = z + 8
        z = 7

triple = (*) 3

waxOff = triple
