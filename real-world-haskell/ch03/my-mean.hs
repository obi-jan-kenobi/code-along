mean :: Fractional a => [a] -> a
mean xs = sum xs / fromIntegral (length xs)
