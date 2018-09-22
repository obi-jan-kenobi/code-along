module MonadLaws where

-- right identity
-- m >>= return = m
-- take value out of m and lifts it afterwards
rIdentity = do
  putStrLn $ show $ (Just 5 >>= return) == Just 5

-- left identity
-- return x >>= f = f x
-- lifts x into monadic structure and feeds it into function
lIdentity = do
  putStrLn $ show $ (return 5 >>= Just) == Just 5

-- associativity
-- (m >>= f) >>= g = m >>= (\x -> f x >>= g)
associa = do
  putStrLn $ show $ ((Just 5 >>= incIf5) >>= decIf6) == (Just 5 >>= (\x -> incIf5 x >>= decIf6))

incIf5 x = if x == 5 then Just 6 else Nothing
decIf6 x = if x == 6 then Just 5 else Nothing
