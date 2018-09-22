-- Deriving from Ord makes values orderable
-- False is first so First < True -> True
data Bool = False | True deriving (Ord)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Ord, Bounded, Eq, Enum, Show, Read)

-- Bounded makes it so minBound :: Day -> Monday and maxBound :: Day -> Sunday works
-- Enum makes it so [Thursday .. Saturday] -> [Thursday, Friday, Saturday]
-- succ Monday -> Tuesday
-- [minBound .. maxBound] :: [Day]
