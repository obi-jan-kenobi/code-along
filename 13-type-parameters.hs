-- type constructor can take types as parameters to produce new types
-- because of type inference types dont usually get passed explicitly as parameters

-- a is type parameter
-- type constructor produces Maybe Int, Maybe Char, ...
data Maybe a = Nothing | Just a

-- passing type explicity
-- Just 3 :: Maybe Int

data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
vplus (Vector x y z) (Vector a b c ) = Vector (x+a) (y+b) (z+c)

dotProd :: (Num a) => Vector a -> Vector a -> a
dotProd (Vector x y z) (Vector a b c) = x*a + y*b + z*c

vmult :: (Num a) => Vector a -> a -> Vector a
vmult (Vector x y z) a = Vector (x*a) (y*a) (z*a)
