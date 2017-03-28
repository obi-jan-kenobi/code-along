-- type aliases
type Name = String
type PriceInCents = Int
type ShoppingListItem = (,) Name PriceInCents
type ShoppingList = [] ShoppingListItem

aShoppingListItem :: ShoppingListItem
aShoppingListItem = ("Bananas", 300)

shoppingList :: ShoppingList
shoppingList =  [ ("Bananas", 300)
                , ("Chocolate", 250)
                ]

-- foldred
-- foldr :: (a -> b -> b) -> b -> [] a -> b
-- foldr :: (function with two args) -> initial value -> list/container -> result
sumShoppingList :: ShoppingList -> PriceInCents
sumShoppingList xs = foldr (\x y -> (getPriceFromItem x) + y) 0 xs

getPriceFromItem :: ShoppingListItem -> PriceInCents
getPriceFromItem (_, price) = price

getPriceAndAdd :: ShoppingListItem ->
                  PriceInCents ->
                  PriceInCents
getPriceAndAdd item currentTotal = getPriceFromItem item + currentTotal
