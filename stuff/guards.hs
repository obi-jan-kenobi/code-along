-- indicated by pipe | 
-- followed by boolean expression
-- follewed by function body
-- if no guards or patterns are found error is thrown
-- otherwise catches everything

bmiTell :: (Double, Double) -> String
bmiTell (x,y)
  | bmi (x,y) <= 18.5 = "youre underweight"
  | otherwise = "IDK"

bmi :: (Double, Double) -> Double
bmi (weight, height) = weight / height ^ 2
