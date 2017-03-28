-- stores result of intermediate calculation
-- have to be aligned or haskell will be confused
-- has function-scope but are not shared between matching patterns

bmiTell :: Double -> Double -> String
bmiTell weight height
  | bmi <= skinny = "youre underweight"
  | otherwise = "IDK"
  where bmi = weight / height ^ 2
        skinny = 18.5


-- this wont work since niceGreeting isnt defined in first two patterns
{-
greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name
  where badGreeting = "Oh! Pfft its you."
        niceGreeting = "Hello! Nice to see you."
-}

-- pattern matching is also possible
initials :: String -> String -> String
initials firstname lastname = f:[] ++ " " ++ l:[]
  where (f:_) = firstname
        (l:_) = lastname

-- function declaration in a where block
calcBmis :: [(Double, Double)] -> [] Double
calcBmis xs = [bmi w h | (w,h) <- xs]
  where bmi weight height = weight / height ^ 2
