module Lib where

import GHC.Generics
import Test.QuickCheck

data Trivial
    = Trivial
    deriving (Eq, Show)

data Identity a
    = Identity a
    deriving (Eq, Show)

data Pair a b
    = Pair a b
    deriving (Eq, Show)

data Sum a b
    = First a
    | Second b
    deriving (Eq, Show)

data Bool'
    = True'
    | False'
    deriving (Generic)
