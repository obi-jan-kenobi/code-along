module Database where

import Data.Time

data DatabaseItem = DbString String | DbNumber Integer | DbDate UTCTime
    deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
    [ DbDate (UTCTime 
                (fromGregorian 1911 5 1)
                (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbNumber 252
    , DbNumber 5643
    , DbNumber 234
    , DbString "Hello World!"
    , DbDate (UTCTime
                (fromGregorian 1921 5 1)
                (secondsToDiffTime 34123))
    ]

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr getTimes []
    where 
        getTimes :: DatabaseItem -> [UTCTime] -> [UTCTime]
        getTimes (DbDate time) dates = time:dates
        getTimes _ dates = dates

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr getNumbers []
    where 
        getNumbers :: DatabaseItem -> [Integer] -> [Integer]
        getNumbers (DbNumber num) numbers = num:numbers
        getNumbers _ numbers = numbers
        
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

avgDb :: [DatabaseItem] -> Double
avgDb xs = (fromIntegral . sum . filterDbNumber) xs / (fromIntegral . length . filterDbNumber) xs
