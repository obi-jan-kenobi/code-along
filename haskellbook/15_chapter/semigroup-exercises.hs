module SemigroupExercises where

import Data.Semigroup

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

newtype Identity a = Identity a
    deriving (Eq, Show)
instance Semigroup a => Semigroup (Identity a) where
    Identity x <> Identity y = Identity (x <> y)

data Two a b = Two a b
    deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    Two a b <> Two c d = Two (a <> c) (b <> d)

newtype BoolConj = BoolConj Bool
    deriving (Eq, Show)

instance Semigroup BoolConj where
    BoolConj True <> BoolConj True = BoolConj True
    BoolConj _ <> BoolConj _ = BoolConj False

newtype BoolDisj = BoolDisj Bool
    deriving (Eq, Show)

instance Semigroup BoolDisj where
    BoolDisj True <> BoolDisj _ = BoolDisj True
    BoolDisj _ <> BoolDisj True = BoolDisj True
    BoolDisj _ <> BoolDisj _ = BoolDisj False

data Or a b
    = Fst a
    | Snd b
    deriving (Eq, Show)

instance Semigroup (Or a b) where
    _ <> Snd y = Snd y
    Snd x <> _ = Snd x
    _ <> Fst x = Fst x
