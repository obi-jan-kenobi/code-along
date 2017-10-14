-- argument & result are both of type a
-- a has kind *
class Sumthin a where
    s :: a -> a

-- b stands alone as argument so b has kind *
-- f is type constructor and takes single argument
-- f has kind * -> *
-- g is applied to three arguments
-- g has kind * -> * -> * -> *
class Else where
    e :: b -> f (g a b c)


-- kind of e is * -> * -> *
-- a & b are arguments to a function so both must be of kind *
-- c & d must result to *
class Biffy where
    slayer :: e a b
        -> (a -> c)
        -> (b -> d)
        -> e c d

-- v is bound throughout the definition
-- must be the same and cant be v one time and v a another time
class Impish v where
    impossibleKind :: v -> v a

class AlsoImp v where
    nope :: v a -> v

data FixMePls
    = FixMe
    | Pls
    deriving (Show, Eq)

instance Functor FixMePls where
    fmap = error

{-
replaceWithP = const 'p'

:t (fmap.fmap) :: (Functor f, Functor f1) => (a -> b) -> f1 (f a) -> f1 (f b)

:t (fmap.fmap) replaceWithP :: (Functor f, Functor f1) => (a -> Char) -> f1 (f a) -> f1 (f Char)

-}

data Two a b =
    Two a b
    deriving (Eq, Show)

data Or a b
    = First a
    | Second b
    deriving (Eq, Show)

instance Functor (Two a) where
    fmap f (Two a b) = Two (a (f b))
    
instance Functor (Or a) where
    fmap _ First a = First a
    fmap f Second b = Second (f b)
