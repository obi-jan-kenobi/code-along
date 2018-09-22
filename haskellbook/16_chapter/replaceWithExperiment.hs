module ReplaceExperiment where


replaceWithP :: a -> Char
replaceWithP = const 'p'


lms :: [Maybe [Char]]
lms = [Just "Ave", Nothing, Just "woohoo"]


replaceWithP' :: [Maybe [Char]] -> Char
replaceWithP' = replaceWithP


liftedReplace :: Functor f => f a -> f Char
liftedReplace = fmap replaceWithP

liftedReplace' :: [Maybe [Char]] -> [Char]
liftedReplace' = liftedReplace

twiceLifted :: (Functor f1, Functor f) => f1 (f a) -> f1 (f Char)
twiceLifted = (fmap . fmap) replaceWithP

twiceLifted' :: [Maybe [Char]] -> [Maybe Char]
twiceLifted' = twiceLifted

thriceLifted :: (Functor f2, Functor f1, Functor f) => f2 (f1 (f a)) -> f2 (f1 (f Char))
thriceLifted = (fmap . fmap . fmap) replaceWithP

thriceLifted' :: [Maybe [Char]] -> [Maybe [Char]]
thriceLifted' = thriceLifted
