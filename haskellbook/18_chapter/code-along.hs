import Control.Monad (join)

bind :: Monad m => (a -> m b) -> m a -> m b
bind f = join . fmap f

data Cow = Cow 
    { name  :: String
    , age   :: Int
    , weigth :: Int
    } deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty str = Just str

noNegative :: Int -> Maybe Int
noNegative n | n >= 0 = Just n
             | otherwise = Nothing

weightCheck :: Cow -> Maybe Cow
weightCheck c =
    let w = weigth c
        n = name c
    in if n == "Bess" && w > 499
        then Nothing
        else Just c

mkSphericalCow :: String -> Int -> Int -> Maybe Cow
mkSphericalCow name age weight = do
    name' <- noEmpty name
    age' <- noNegative age
    weight' <- noNegative weight
    weightCheck (Cow name' age' weight')


mcomp :: Monad m => (b -> m c) -> (a -> m b) -> (a -> m c)
mcomp f g = (\x -> (g x) >>= f)

