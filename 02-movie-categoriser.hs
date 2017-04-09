movies =
  [ "Aeon Flux"
  , "The Black Cat"
  , "Superman"
  , "Stick It"
  , "The Matrix Revolutions"
  , "The Raven"
  , "Inception"
  , "Looper"
  , "Hoodwinked"
  , "Tell-Tale"
  ]

-- predicate function
isGood :: String -> Bool
isGood (x:_)  = x <= 'M'
isGood _      = False

-- local scoping of assessment with where-clause
assess :: String -> (String, Bool)
assess movie = (movie, assessment)
  where assessment = isGood movie

-- only assessing lists with one or two values
assessMovies' :: [] String -> [] (String, Bool)
assessMovies' [] = []
assessMovies' (y:[]) = assess y : []
assessMovies' (x:y:[]) = assess y : []

-- recursion
assessMovies :: [] String -> [] (String, Bool)
assessMovies [] = []
assessMovies (x:xs) = assess x : assessMovies xs

-- with map
assessMoviesMap :: [] String -> [] (String, Bool)
assessMoviesMap = map assess
