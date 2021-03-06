module ChapterExercise where

import Moi

get :: Moi s s
get = Moi (\s -> (s, s))

put :: s -> Moi s ()
put s = Moi (\_ -> ((), s))

exec :: Moi s a -> s -> s
exec (Moi sa) s = snd $ sa s

eval :: Moi s a -> s -> a
eval (Moi sa) s = fst $ sa s

modify :: (s -> s) -> Moi s ()
modify f = Moi (\s -> ((), f s))  
