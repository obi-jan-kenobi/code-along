data WhoCares a
    = ItDoesnt
    | Matter a
    | WhatThisIsCalled
    deriving (Show, Eq)

-- this is valid
instance Functor WhoCares where
    fmap _ ItDoesnt = ItDoesnt
    fmap _ WhatThisIsCalled = WhatThisIsCalled
    fmap f (Matter a) = Matter (f a)

-- this is invalid because it breaks the Identity Law
instance Functor WhoCares where
    fmap _ ItDoesnt = WhatThisIsCalled
    fmap _ WhatThisIsCalled = ItDoesnt
    fmap f (Matter a) = Matter (f a)

data CountingBad a = Heisenberg Int a
    deriving (Show, Eq)

-- this is invalid because it breaks Composition Law
instance Functor CountingBad where
    fmap f (Heisenberg n a) = Heisenberg (n + 1) (f a)

{-
let u = "Uncle"
let oneWhoKnocks = Heisenberg 0 u
fmap (++ " Jesse") oneWhoKnocks -- Heisenberg 1 "Uncle Jesse"

let f = ((++ " Jesse").(++ "++ lol"))
fmap f oneWhoKnocks -- Heisenberg 1 "Uncle lol Jesse"

let j = (++ " Jesse")
let l = (++ " lol")

fmap (j . l) oneWhoKnocks -- Heisenberg 1 "Uncle lol Jesse"
fmap j . fmap l oneWhoKnocks -- Heisenberg 2 "Uncle lol Jesse"
-}
