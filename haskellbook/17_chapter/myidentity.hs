newtype Identity a
    = Identity a
    deriving (Eq, Show)

instance Functor Identity where
    fmap f (Identity a) = Identity $ f a

instance Applicative Identity where
    pure a = Identity a
    (<*>) (Identity f) (Identity a) = Identity $ f a
