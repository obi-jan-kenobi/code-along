-- possible to define types that have themselves as types in their fields
-- can create recursive data types
-- eg 5:4:[] is [5,4] ( : is right associative)

data OwnList a = Empty | Cons a (OwnList a) deriving (Eq, Ord, Show, Read)
