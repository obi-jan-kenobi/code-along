-- data type
-- data typeconstructor = valueconstructor members | anothervalueconstructor
-- each value construcor has to be spererated by |

data Customer = Customer {
      customerID      :: CustomerID
    , customerName    :: String
    , customerAddress :: Address
    } deriving (Show)
--equivalent to:
data Customer' = Customer' Int String [String]
                deriving (Show)

customerID :: Customer' -> Int
customerID (Customer id _ _) = id

customerName :: Customer' -> String
customerName (Customer _ name _) = name

customerAddress :: Customer' -> [String]
customerAddress (Customer _ _ address) = address
