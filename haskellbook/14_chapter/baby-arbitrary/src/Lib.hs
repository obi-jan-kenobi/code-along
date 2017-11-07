module Lib where

import Test.QuickCheck

data Trivial
    = Trivial
    deriving (Eq, Show)

data Identity a
    = Identity a
    deriving (Eq, Show)
