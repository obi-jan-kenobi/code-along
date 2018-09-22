module Chapter15 where

monoidappend xs ys = mappend xs ys

monoididentity x = mappend x mempty

{-
class Monoid m where
    mempty :: m
    mappend :: m -> m -> m
    mconcat :: [m] -> m
    mconcat = foldr mappend mempty

instance Monoid [a] where
    mempty = []
    mappend = (++)

newtype Sum a = Sum {getSum :: a}
instance Num a => Monoid (Sum a)

:t (<>)
(<>) :: Monoid m => m -> m -> m

class Semigroup a where
    (<>) :: a -> a -> a

(a <> b) <> c == a <> (b <> c)

Anything that is a Monoid is also a Semigroup
class Semigroup a => Monoid where ...

-}

data Optional a
    = Nada
    | Only a
    deriving (Eq, Show)

instance Monoid a
    => Monoid (Optional a) where
    mempty = Nada
    mappend (Only a) (Only b) = Only (mappend a b)
    mappend mempty (Only a) = Only a
    mappend (Only a) mempty = Only a
    mappend _ _ = Nada
