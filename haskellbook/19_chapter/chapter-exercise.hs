module Chapter where

data Constant a b
    = Constant b

instance Foldable (Constant a) where
    foldr f z (Constant b) = f b z

data Two a b
    = Two a b

instance Foldable (Two a) where
    foldr f z (Two a b) = f b z

data Three a b c
    = Three a b c

instance Foldable (Three a b) where
    foldr f z (Three a b c) = f c z

data Three' a b
    = Three' a b b

instance Foldable (Three' a) where
    foldr f z (Three' a b c) = f b (f c z)

data Four' a b
    = Four' a b b b

instance Foldable (Four' a) where
    foldr f z (Four' a b c d) = f b $ f c $ f d z