-- are similar to where bindings
-- allow binding anywhere 
-- are expressions
-- dont span across guards
-- let <bindings> in <expression>

-- variables defined in bindings are visible in entire expression

-- are useful for
-- declaring functions in local scope
-- binding several variables inline
-- pattern matching  of tuples
-- inside list comprehensions

cylinder :: Double -> Double -> Double
cylinder r h = 
  let sidearea = 2 * pi * r * h
      toparea = pi * r ^ 2
  in  sidearea + 2 * toparea

calcBmis :: [(Double, Double)] -> [] Double
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
