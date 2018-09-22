module Chapter12 where

type Name = String
type Age = Integer

data Person = Person Name Age
    deriving Show

data PersonInvalid = NameEmpty | AgeTooLow
    deriving (Eq)

mkPerson :: Name -> Age -> Maybe Person
mkPerson name age
    | name /= "" && age >= 0 = Just $ Person name age
    | otherwise = Nothing

toString :: PersonInvalid -> String
toString NameEmpty = "NameEmpty"
toString AgeTooLow = "AgeTooLow"

instance Show PersonInvalid where
    show = toString

mkPerson' :: Name -> Age -> Either PersonInvalid Person
mkPerson' name age
    | name /= "" && age >= 0 = Right $ Person name age
    | name == "" = Left NameEmpty
    | otherwise = Left AgeTooLow
