ifEvenAdd2 :: Integer -> Maybe Integer
ifEvenAdd2 n = if even n then Just (n+2) else Nothing

type Name = String
type Age = Integer

data Person = Person Name Age deriving (Eq, Show)

type ValidatePerson  a = Either [PersonInvalid] a

data PersonInvalid = NameEmpty | AgeTooLow deriving (Eq)

toString :: PersonInvalid -> String
toString NameEmpty = "NameEmpty"
toString AgeTooLow = "AgeTooLow"

ageOkay :: Age -> Either [PersonInvalid] Age
ageOkay age = case age >= 0 of
    True -> Right age
    _ -> Left [AgeTooLow]

nameOkay :: Name -> Either [PersonInvalid] Name
nameOkay name = case name /= "" of
    True -> Right name
    _ -> Left [NameEmpty]

instance Show PersonInvalid where
    show = toString

mkPerson :: Name -> Age -> ValidatePerson Person
mkPerson name age =
    mkPerson' (nameOkay name) (ageOkay age)

mkPerson' :: ValidatePerson Name 
            -> ValidatePerson Age 
            -> ValidatePerson Person
mkPerson' (Right nameOk) (Right ageOk) = Right (Person nameOk ageOk)
mkPerson' (Left badName) (Left badAge) = Left (badName ++ badAge)
mkPerson' (Left badName) _ = Left badName
mkPerson' _ (Left badAge) = Left badAge
