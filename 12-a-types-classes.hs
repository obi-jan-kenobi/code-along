-- type constructor left side of  '='
-- value constructor right side of '='
data Bool = False | True


data Point = Point Float Float deriving (Show)
-- Type Shape
-- Value Constructors: Circle / Rectangle
data Shape = Circle Point Float | Rectangle Point Point
  deriving (Show) -- Type class Show lets haskell print a Shape

baseCircle :: Float -> Shape
baseCircle = Circle (Point 0 0)

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

area :: Shape -> Float
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1) -- z $ x y == z (x y)

{-
map (Circle 2 2) [1,2,3,4] makes 4 circles 
[Circle 2 2 1, Circle 2 2 2, ...] 
-}
