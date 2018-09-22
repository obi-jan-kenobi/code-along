doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y

doubleOnlySmall x = (if x > 100 then x else x * 2)

double7and = doubleUs 7

m :: String
m = "Polly wants a cracker"

main = putStrLn m


magicCoin :: Bool -> Bool
magicCoin = \_ -> True

magicCoin' :: Bool -> Bool
magicCoin' _ = True

magicBool :: Bool -> (Bool -> Bool)
magicBool = \_ -> magicCoin

magicBool'1 :: Bool -> Bool -> Bool
magicBool'1 = \_ -> \_ -> True

magicBool'2 :: Bool -> Bool -> Bool
magicBool'2 = \_ _ -> True

plus :: Int -> Int -> Int
plus x y = x + y

plus' :: Int -> Int -> Int
plus' = \x -> \y -> x + y

increment :: Int -> Int
increment = plus 1

increment' :: Num a => a -> a
increment' = (\x -> \y -> x + y) 1

number1 :: Num a => a
number1 = 1 + 5 + 7 + 3 + 2

number2 :: Num a => a
number2 = number1 * number1

aList = []
aList2 = "sauce" : aList

aList4 :: [] String
aList4 = ["napkin"]

aList5 = [number1]

aList8 :: Num a => [a]
aList8 = 1 : 4: []

firstOrEmpty :: [] String -> String
firstOrEmpty [] = ""
firstOrEmpty (x:_) = x
