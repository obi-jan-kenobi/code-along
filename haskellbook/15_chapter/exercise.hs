data Optional a
    = Nada
    | Only a
    deriving (Show, Eq)


-- instance Monoid a => besagt, dass a im Optional a auch Monoid sein muss
instance Monoid a => Monoid (Optional a) where
    mempty = Nada
    mappend Nada (Optional a) = Optional a
    mappend (Optional a) Nada = Optional a
    mappend (Optional a) (Optional b) = Optional (mappend a b)
    mappend Nada Nada = Nada
