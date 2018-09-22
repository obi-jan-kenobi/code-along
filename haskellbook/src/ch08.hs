incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times - 1) n)

applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)

incTimes' :: (Eq a, Num a) => a -> a -> a
incTimes' times n = applyTimes times (+1) n

sumStuff :: (Eq a, Num a) => a -> a
sumStuff n = go n 0 0
    where go n count sum
            | n == count = sum + count
            | otherwise = go n (count + 1) (sum + count)

multiplyStuff :: (Integral a) => a -> a -> a
multiplyStuff x y = go x y 0 0
    where go x y count sum
            | y == count = sum
            | otherwise = go x y (count + 1) (sum + x)
