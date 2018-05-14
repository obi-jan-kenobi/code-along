{-# LANGUAGE FlexibleInstances #-}

a = fmap (+1) $ read "[1]" :: [Int]
b = (fmap . fmap) (++ "lol") (Just ["Hi,", " Hello"])
c = fmap (*2) (\x -> x - 2)
d = (fmap . fmap) ((return '1' ++) . show) (\x -> [x, 1..3])

e :: IO Integer
e = let ioi = readIO "1" :: IO Integer
        changed = fmap (read . ("123"++) . show) ioi
        in fmap (*3) changed

-- newtype Identity a = Identity a
--     deriving (Eq, Show)

-- instance Functor Identity where
--     fmap _ (Identity a) = (Identity a)

data Pair a = Pair a a

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b)

data Two a b = Two a b

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

data Three a b c = Three a b c

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

data Three' a b = Three' a b b

instance Functor (Three' a) where
    fmap f (Three' a b c) = Three' a (f b) (f c)

data Four a b c d = Four a b c d

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

data Four' a b = Four' a a a b

instance Functor (Four' a) where
    fmap f (Four' a b c d) = Four' a b c (f d)

data Sum b a
    = First a
    | Second b

instance Functor (Sum e) where
    fmap f (First a) = First (f a)
    fmap f (Second b) = Second b

data Company a c b
    = DeepBlue a c
    | Something b

instance Functor (Company e e') where
    fmap f (Something b) = Something (f b)
    fmap _ (DeepBlue x y) = DeepBlue x y

data More b a
    = L a b a
    | R b a b

instance Functor (More x) where
    fmap f (L a b a') = L (f a) b (f a')
    fmap f (R b a b') = R b (f a) b

data Quant a b
    = Finance
    | Desk a
    | Bloor b

instance Functor (Quant x) where
    fmap f (Bloor b) = Bloor $ f b
    fmap _ (Desk a) = Desk a
    fmap _ Finance = Finance

data K a b
    = K a

instance Functor (K a) where
    fmap _ (K x) = K x

newtype Flip f a b
    = Flip (f b a)
    deriving (Eq, Show)

newtype Y a b
    = Y a

instance Functor (Flip Y a) where
  fmap f (Flip (Y b)) = Flip (Y (f b))


data EvilGoateeConst a b
    = GoatyConst b

instance Functor (EvilGoateeConst a) where
    fmap f (GoatyConst b) = GoatyConst $ f b

data LiftItOut f a
    = LiftItOut (f a)

instance Functor f => Functor (LiftItOut f) where
    fmap f (LiftItOut x) = LiftItOut $ fmap f x

data Parappa f g a
    = DaWrappa (f a) (g a)

instance (Functor f, Functor g) => Functor (Parappa f g) where
    fmap f (DaWrappa x y) = DaWrappa (fmap f x) (fmap f y)

data IgnoreOne f g a b
    = IgnoringSomething (f a) (g b)

instance (Functor g) => Functor (IgnoreOne f g a) where
    fmap f (IgnoringSomething x y) = IgnoringSomething x (fmap f y)

data Notorious g o a t
    = Notorious (g o) (g a) (g t)

instance Functor g => Functor (Notorious g o a) where
    fmap f (Notorious x y z) = Notorious x y (fmap f z)

data List a
    = Nil
    | Cons a (List a)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a ls) = Cons (f a) (fmap f ls)

data GoatLord a
    = NoGoat
    | OneGoat a
    | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)

instance Functor GoatLord where
    fmap _ NoGoat = NoGoat
    fmap f (OneGoat x) = OneGoat $ f x
    fmap f (MoreGoats x y z) = MoreGoats (fmap f x) (fmap f y) (fmap f z)

data TalkToMe a
    = Halt
    | Print String a
    | Read (String -> a)

instance Functor TalkToMe where
    fmap _ Halt = Halt
    fmap f (Print s a) = Print s (f a)
    fmap f (Read x) = Read (fmap f x)
                
