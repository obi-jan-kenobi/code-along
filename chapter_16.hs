incIfJust :: Num a => Maybe a -> Maybe a
incIfJust (Just n) = Just $ n + 1
incIfJust Nothing = Nothing

showIfJust :: Show a => Maybe a -> Maybe String
showIfJust (Just n) = Just $ show n
showIfJust Nothing = Nothing

incIfRight :: Num a => Either e a -> Either e a
incIfRight (Right n) = Right $ n + 1
incIfRight (Left e) = Left e

showIfRight :: (Show a, Num a) => Either e a -> Either e String
showIfRight (Right n) = Right $ show n
showIfRight (Left e) = Left e

-- better version

liftedInc :: (Functor f, Num b) => f b -> f b
liftedInc = fmap (+1)

liftedShow :: (Functor f, Num b, Show b) => f b -> f String
liftedShow = fmap show

data Possibly a
    = Lolnope
    | Yeppers a
    deriving (Eq, Show)

instance Functor Possibly where
    fmap _ Lolnope = Lolnope
    fmap f (Yeppers a) = Yeppers $ f a

data Sum a b
    = First a
    | Second b
    deriving (Eq, Show)

instance Functor (Sum a) where
    fmap _ (First a) = First a
    fmap f (Second b) = Second $ f b

data Wrap f a
    = Wrap (f a)
    deriving (Eq, Show)

instance Functor f => Functor (Wrap f) where
    fmap f (Wrap fa) = Wrap $ fmap f fa

-- Chapter exercises

data Company a c b
  = DeepBlue a c
  | Something b

instance Functor (Company a c) where
  fmap f (Something b) = Something $ f b
  fmap f (DeepBlue a c) = DeepBlue a c

data More b a
  = L a b a
  | R b a b
  deriving (Eq, Show)

instance Functor (More x) where
  fmap f (L a b a') = L (f a) b (f a')
  fmap f (R b a b') = R b (f a) b'

data Quant a b
  = Finance
  | Desk a
  | Bloor b

instance Functor (Quant a) where
  fmap _ Finance = Finance
  fmap _ (Desk a) = Desk a
  fmap f (Bloor b) = Bloor $ f b

-- data K a b
--  = K a

-- instance Functor (K a) where
--  fmap _ (K a) = K a

newtype Flip f a b
  = Flip (f b a)
  deriving (Eq, Show)

newtype K a b
  = K a

instance Functor (Flip K a) where
  fmap f (Flip K
