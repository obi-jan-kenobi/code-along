import qualified Data.Map as Map

data LockerState = Taken | Free deriving (Eq, Show)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = case Map.lookup lockerNumber map of
  Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist!"
  Just (state, code) -> if state /= Taken
                        then Right code
                        else Left $ "Locker " ++ show lockerNumber ++ "is taken!"
