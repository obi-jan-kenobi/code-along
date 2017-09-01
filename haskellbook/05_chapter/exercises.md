# Typeclass constraints
    (Num a, Num b) => a -> b -> b

    (Ord a, Num a) => a -> a -> Ordering

In the first example **both** *a & b* muste be of typeclass *Num*.  
In the second *a* must implement both *Ord* and *Num*

# Sectioning
Is partial application of infix operators

    let x = 5
    let y = (2^)
    let z = (^2)
    y x
    -- 32
    z x
    -- 25

Its possible to apply prefix operators in infix with `backticks` (``)

Parametricity

1. impossible
2. 
x :: a -> a -> a
x _ a = a
x a _ = a

