module Chapter where

data Constant a b
  = Constant b
  deriving (Show, Eq)

instance Functor (Constant a) where
  fmap f (Constant x) = Constant $ f x

instance Applicative (Constant a) where
  pure = Constant
  (<*>) (Constant f) (Constant x) = Constant $ f x

instance Monad (Constant a) where
  return = pure
  (>>=) (Constant x) f = f x

instance Foldable (Constant a) where
  foldMap f (Constant x) = f x

data Two a b
  = Two a b

instance Functor (Two a) where
  fmap f (Two x y) = Two x $ f y

instance Foldable (Two a) where
  foldMap f (Two x y) = f y

data Three a b c
  = Three a b c

instance Foldable (Three a b) where
  foldMap f (Three x y z) = f z

data Three' a b
  = Three' a b b
  deriving (Show, Eq)

instance Foldable (Three' a) where
  foldr f empty (Three' x y z) = f y $ f z empty

data Four' a b
  = Four' a b b b

instance Foldable (Four' a) where
  foldr f empty (Four' _ x y z) = f x $ f y $ f z empty

filterF :: ( Applicative f
           , Foldable t
           , Monoid (f a))
           => (a -> Bool) -> t a -> f a
filterF f = foldMap (\x -> if f x then pure x else mempty)
