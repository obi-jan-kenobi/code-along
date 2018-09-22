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

3.
x :: a -> b -> b
x _ b = b

# Partial functions
are functions that dont handle all possible input scenarios

# Typeclasses
        instance Eq a => Eq (Identity a) where
        (==) (Identity v) (Identity v') = v == v'

needs contraint to make sure a is of Typeclass Eq because we will use their Eq 
in the Eq of Identity

# Pureness

It may not seem obvious that printing results to the screen could be a source of worry. The function is not just applied to the arguments that are in its scope but also asked to affect the world outside its scope in some way, namely by showing you its result on a screen. This is known as a side effect, a *potentially observable result apart from the value the expression evaluates to*. Haskell manages effects by separating effectful computations from pure computations in ways that preserve the predictability and safety of function evaluation. Importantly, effect-bearing computations themselves become more composable and easier to reason about. The benefits of explicit effects include the fact that it makes it relatively easy to reason about and predict the results of our functions.

# IO
So we use this empty tuple to represent the return value
at the end of our IO action. That is, the print function will first do the IO action of printing the string to the terminal and then complete the IO action, marking an end to the execution of the function and a delimitation of the side effects, by returning this empty nothing tuple.

# Typeclass instances
We’ve said a few times, without explaining it, that typeclasses are dispatched by type, but it’s an important thing to understand. Typeclasses are defined by the set of operations and values all instances will provide. Typeclass instances are unique pairings of the typeclass and a type.
