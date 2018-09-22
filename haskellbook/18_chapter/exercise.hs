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

data List a
    = Nil
    | Cons a (List a)
    deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a (l)) = (Cons (f a) (fmap f l))

instance Monoid (List a) where
    mempty = Nil
    mappend Nil xs = xs
    mappend xs Nil = xs
    mappend (Cons x xs) ys = Cons x (mappend xs ys)

instance Applicative List where
    pure a = (Cons a) Nil
    (<*>) Nil _ = Nil
    (<*>) _ Nil = Nil
    (<*>) (Cons f fs) xs = mappend (fmap f xs) (fs <*> xs)

instance Monad List where
    return = pure
    -- (>>=) (Cons x xs) f = mappend (f x) (xs >>= f)
    (Cons x xs) >>= f = mappend (f x) (xs >>= f)

j :: Monad m => m (m a) -> m a
j m = m >>= id

l1 :: Monad m => (a -> b) -> m a -> m b
l1 = fmap

l2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
l2 f x y = f <$> x <*> y

a :: Monad m => m a -> m (a -> b) -> m b
a = flip (<*>)

meh :: Monad m => [a] -> (a -> m b) -> m [b]
meh [] _ = pure []
meh (x:xs) f = do
  x' <- f x
  ((:) x') <$> (meh xs f)
  
flipType :: (Monad m) => [m a] -> m [a]
flipType = (flip meh) id
