incIfJust :: Num a => Maybe a -> Maybe a
incIfJust (Just n) = Just $ n + 1
incIfJust Nothing = Nothing

showIfJust :: Show a => Maybe a -> Maybe String
showIfJust (Just n) = Just $ show n
showIfJust Nothing = Nothing

incIfRight :: Num a => Either e a -> Either e a
incIfRight (Right n) = Right $ n + 1
incIfRight (Left e) = Left e

showIfRight :: Num a => Either e a -> Either e String
showIfRight (Right n) = Right $ show n
showIfRight (Left e) = Left e

-- better version

liftedInc :: (Functor f, Num b) => f b -> f b
liftedInc = fmap (+1)

liftedShow :: (Functor f, Num b) => f b -> f String
liftedShow = fmap show

data Possibly a
    = Lolnope
    | Yeppers a
    deriving (Eq, Show)

instance Functor Possibly where
    fmap _ Lolnope = Lolnope
    fmap f Yeppers a = Yeppers $ f a

data Sum a b
    = First a
    | Second b
    deriving (Eq, Show)

instance Functor Sum a where
    fmap _ First a = First a
    fmap f Second b = Second $ f b

data Wrap f a
    = Wrap (f a)
    deriving (Eq, Show)

instance Functor f => Functor (Wrap f) where
    fmap f (Wrap fa) = Wrap $ fmap f fa
