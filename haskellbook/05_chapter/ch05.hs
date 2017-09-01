module TypeInference where 

f :: Num a => a -> a -> a
f x y = x + y + 3

functionH :: [a] -> a
functionH (x:_) = x

functionC :: (Ord a) => a -> a -> Bool
functionC x y = if (x > y) then True else False

functionS :: (a, b) -> b
functionS (x, y) = y

-- 1

i :: a -> a
i x = x

c :: a -> b -> a
c x y = x

c' :: a -> b -> b
c' x y = y

r :: [a] -> [a]
r xs = xs


f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = g f

data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = w q

data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge xtoy ytowz x = fst(xtoy ytowz x)
