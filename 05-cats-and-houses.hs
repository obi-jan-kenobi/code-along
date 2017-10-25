-- qualified import doesnt put loaded functions in global namescape
import qualified Data.List as L
-- Maybe returns something if found and Nothing if nothing is found
-- L.find :: Foldable t => (a -> Bool) -> t a -> Maybe a

-- sumtype
data CatBreed = Siamese | Persian | Bengal | Sphynx | Burmese

type Name = String
type Age = Integer

-- Product type
-- Cat is name of value constructor as well as name of type
-- Cat :: Name -> CatBreed -> Age -> Cat
data Cat = Cat Name CatBreed Age

type HouseNumber = Int
data House = House HouseNumber Cat

humanAge :: Cat -> Age
humanAge (Cat _ _ catAge)
  | catAge <= 0 = 0
  | catAge == 1 = 15
  | catAge == 2 = 25
  | otherwise = 25 + (catAge - 2) * 4

street :: House : [] -- same as [House]
street = 
  [ House 1 (Cat "George" Siamese 10)
  , House 2 (Cat "Mr Bigglesworth" Persian 5)
  , House 3 (Cat "Mr Tinkles" Burmese 1)
  ]

getCatFromHouse :: House -> Cat
getCatFromHouse (House _ c) = c


-- . function composition operator
-- same as getHumanAgeOfCatFromHouse h = humanAge (getCatFromHouse h)
getHumanAgeOfCatFromHouse :: House -> Age
getHumanAgeOfCatFromHouse = humanAge . getCatFromHouse
