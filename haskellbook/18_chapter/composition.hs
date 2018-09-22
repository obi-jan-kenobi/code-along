module Composition where

mcomp :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
mcomp f g x = g x >>= f
