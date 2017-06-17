module FunFunctor where

instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x) = Left x

data Tree a = Node a [Tree a]

instance Functor (Tree a) where
  fmap f Tree  = 

instance Functor ((->) r) where
  fmap f (-> r) = f r
