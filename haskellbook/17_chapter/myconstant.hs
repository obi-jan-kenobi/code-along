newtype Constant a b
    = Constant { getConstant :: a}
    deriving (Eq, Ord, Show)

instance Functor (Constant a) where
    fmap f (Constant a) = Constant a

instance Monoid a => Applicative (Constant a) where
    pure b = Constant mempty
    (<*>) (Constant x) (Constant y) = Constant $ mappend x y
