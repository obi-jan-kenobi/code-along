iterate' :: (a -> a) -> a -> [a]
iterate' next start = go [] next start
    where
        go :: [a] -> (a -> a) -> a -> [a]
        go [] next previous = go [previous] next (next previous)
        go (x:xs) next previous = go (previous:x:xs) next (next previous)

-- unfoldr' :: (b -> Maybe (a, b)) -> b -> [a]
-- unfoldr' next start = go [] next start
--     where go [] next previous = go [previous] next (previous)
