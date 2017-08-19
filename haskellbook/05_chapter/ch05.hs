module TypeInference where 

fx :: Num a => a -> a -> a
fx x y = x + y + 3

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
f = show

g :: String -> Char
g = head

h :: Int -> Char
h = g . f

{-
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
-}

-- munge :: (x -> y) -> (y -> (w, z)) -> x -> w
-- munge xtoy ytowz x = fst(xtoy ytowz x)

data TrivialType = TrivialData

instance Eq TrivialType where
  TrivialData == TrivialData = True

data DayOfWeek = 
  Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving Show

instance Eq DayOfWeek where
  (==) Mon Mon = True
  (==) Tue Tue = True
  (==) Wed Wed = True
  (==) Thu Thu = True
  (==) Fri Fri = True
  (==) Sat Sat = True
  (==) Sun Sun = True
  (==) _ _ = False

data Date = 
  Date DayOfWeek Int deriving Show

instance Eq Date where
  (==) (Date weekday dayofmonth)
       (Date weekday' dayofmonth') =
         weekday == weekday' && dayofmonth == dayofmonth'

data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn v) (TisAn v') = v == v'

data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two a b) (Two a' b') = a == a && b == b

data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt a) (TisAnInt a') = a == a'
  (==) (TisAString b) (TisAString b') = b == b'
  (==) _ _ = False

data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair b c) (Pair b' c') = b == b' && c == c'

data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b') = a == a' && b == b'

data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne a) (ThisOne a') = a == a'
  (==) (ThatOne b) (ThatOne b') = b == b'
  (==) _ _ = False

data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello a) (Hello a') = a == a'
  (==) (Goodbye b) (Goodbye b') = b == b'
  (==) _ _ = False
