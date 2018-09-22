module Chapter10 where

stops = "pbtdkg"
vowels = "aeiou"

pCombinator = [(x, y, z) | x <- stops, y <- vowels,  z <- stops, x == 'p']

wordCombinator :: [String] -> [String] -> [(String, String, String)]
wordCombinator nouns verbs = [(x, y, z) | x <- nouns, y <- verbs, z <- nouns]

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x y -> (f x) || y) False

myElem :: Eq a => a -> [a] -> Bool
myElem e = foldr (\x y -> e == x || y) False

myElem' :: Eq a => a -> [a] -> Bool
myElem' e = any (\x -> x == e)

data OperatingSystem =
    GnuPlusLinux |
    OpenBSDPlusNevermindJustBSDStill |
    Mac |
    Windows
    deriving (Eq, Show)

data ProgrammingLanguage =
    Haskell |
    Agda |
    Idris |
    PureScript
    deriving (Eq, Show)

data Programmer = Programmer {
    os :: OperatingSystem ,
    lang :: ProgrammingLanguage
} deriving (Eq, Show)


allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSDStill
    , Mac
    , Windows
    ]

allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = [Programmer x y | x <- allOperatingSystems, y <- allLanguages]
