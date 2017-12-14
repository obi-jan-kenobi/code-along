data Nope a = NopeDotJpg deriving (Eq, Show)

instance Functor Nope where
    fmap _ NopeDotJpg = NopeDotJpg

instance Applicative Nope where
    pure a = NopeDotJpg
    (<*>) NopeDotJpg NopeDotJpg = NopeDotJpg

instance Monad Nope where
    return = pure
    (>>=) NopeDotJpg _ = NopeDotJpg

data PEither b a
    = PLeft a
    | PRight b
    deriving (Eq, Show)

instance Functor (PEither b) where
    fmap _ (PRight b) = PRight b
    fmap f (PLeft a) = PLeft $ f a

instance Applicative (PEither b) where
    pure = PLeft
    (<*>) (PRight b) _ = PRight b
    (<*>) _ (PRight b) = PRight b
    (<*>) (PLeft f) (PLeft x) = PLeft $ f x

instance Monad (PEither b) where
    return = pure
    (>>=) (PRight x) _ = PRight x
    (>>=) (PLeft x) f = f x

newtype Identity a = Identity a
    deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
    pure a = Identity a
    (<*>) (Identity f) (Identity x) = Identity $ f x

instance Monad Identity where
    return = pure
    (>>=) (Identity x) f = f x
