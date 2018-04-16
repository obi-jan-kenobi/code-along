module Chapter where

newtype Identity a
    = Identity a
    deriving (Eq, Ord, Show)

instance Functor Identity where
    fmap f (Identity x) = Identity $ f x

instance Applicative Identity where
    pure = Identity
    (<*>) (Identity f) (Identity x) = Identity $ f x

instance Foldable Identity where
    foldr f empty (Identity x) = f x empty

instance Traversable Identity where
    traverse f (Identity x) = fmap Identity (f x)

newtype Constant a b
    = Constant { getConstant :: a }

instance Functor (Constant a) where
    fmap _ (Constant x) = Constant x

instance Monoid a => Applicative (Constant a) where
    pure _ = Constant mempty
    (<*>) (Constant f) (Constant x) = Constant $ mappend f x

instance Foldable (Constant a) where
    foldr _ init _ = init

instance Traversable (Constant a) where
    traverse _ (Constant x) = fmap Constant (pure x)

data Optional a
    = Nada
    | Yep a

instance Functor Optional where
    fmap _ Nada = Nada
    fmap f (Yep a) = Yep $ f a

instance Applicative Optional where
    pure x = Yep x
    (<*>) (Yep f) (Yep x) = Yep $ f x
    (<*>) _ _ = Nada

instance Foldable Optional where
    foldr f init Nada = init
    foldr f init (Yep x) = f x init

instance Traversable Optional where
    traverse f (Yep x) = fmap Yep $ f x
    traverse f _ = pure Nada
