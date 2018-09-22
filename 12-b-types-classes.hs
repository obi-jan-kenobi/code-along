-- record syntax
data Person = Person {
  firstName :: String,
  lastName :: String,
  age :: Int,
  height :: Float,
  phoneNumber :: String,
  flavor :: String
} deriving (Eq, Show, Read)

-- deriving from Eq type class makes it possible to compare two Persons
-- checks if value constructors match and then checks if all data inside matches

-- deriving from Read makes this possible
-- read "Person {firstName =\"Michael\", lastname=\"Diamond\" ..." :: Person
-- Person {firstName = "Michael", lastName = "Diamond", ...}

-- haskell creates automatically "getter"-functions
-- like flavor :: Person -> String
-- and makes it possible to put the fields in arbitrary order

data Car = Car {
  company :: String,
  model:: String,
  year :: Int
} deriving (Show)

-- Car {year=1923, model="GT", company="Shelby"}
