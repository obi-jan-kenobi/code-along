sayHello :: String -> IO ()
sayHello x = 
    putStrLn ("Hello, " ++ x ++ "!")

triple x = x * 3
triple' = (*3)
triple'' = (*) 3

timesPi x = 3.14 * x
timesPi' = (*pi)

where1' = x * 3 + y
    where
        x = 3
        y = 1000

where2' = x * 5
    where
        x = 10 * 5 + y
        y = 10

where3' = z / x + y
    where
        z = y * 10
        y = (negate x)
        x = 7

waxOn = x * 5
    where 
        x = y ^ 2
        y = z + 8
        z = 7

waxOff = triple

quotandrem x y = (quot x y) * y + (rem x y) == x
{-
example for x = 10, y = -4:
    (quot 10 (-4)) * (-4) + (rem 10 (-4))
    (quot 10 (-4)) == (-2) & (rem 10 (-4)) == 2
    (-2) * (-4) + 2 == 10 == x
-}

divandmod x y = (div x y) * y + (mod x y) == x
{-
example for x = 10, y = -4:
    (div 10 (-4)) * (-4) + (mod 10 (-4))
    (div 10 (-4)) == (-3) & (mod 10 (-4)) == -2
    (-3) * (-4) + (-2) == 10 == x
-}

