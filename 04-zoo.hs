-- Sum Type
data Animal = Giraffe
              | Elephant
              | Tiger
              | Flea

type Zoo = [Animal]

localZoo :: Zoo
localZoo = [Elephant, Tiger, Tiger, Giraffe, Elephant, Flea]

adviceOnEscape :: Animal -> String
adviceOnEscape animal = 
  case animal of 
    Giraffe -> "Look up"
    Elephant -> "Ear to the ground"
    Tiger -> "Check the morgues"
    Flea -> "Dont worry"

-- recursion
adviceOnZooEscape :: Zoo -> [] String -- same as [String]
adviceOnZooEscape [] = []
adviceOnZooEscape (x:xs) = adviceOnEscape x : adviceOnZooEscape xs

-- local var
adviceOnZooEscape' :: Zoo -> String : [] -- same as [String]
adviceOnZooEscape' xs =
    foldr addAdviceForAnimal [] xs
  where addAdviceForAnimal animal adviceList =
            adviceOnEscape animal : adviceList

-- map
adviceOnZooEscape'' :: Zoo -> [] String
adviceOnZooEscape'' = map adviceOnEscape
