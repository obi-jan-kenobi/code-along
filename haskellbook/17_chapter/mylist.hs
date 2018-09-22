module MyList where

data List a
  = Nil
  | Cons a (List a)
  deriving (Eq, Show)

instance Monoid (List a) where
  mempty = Nil
  mappend Nil ys = ys
  mappend (Cons x xs) ys = Cons x $ mappend xs ys

instance Functor List where
  fmap f Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Applicative List where
  pure x = Cons x Nil
  (<*>) Nil x = Nil
  (<*>) x Nil = Nil
  (<*>) (Cons x xs) ys = (x <$> ys) `mappend` (xs <*> ys)
