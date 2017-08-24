data Expr
    = Lit Integer
    | Add Expr Expr

eval :: Expr -> Integer
eval (Lit x) = x
eval (Add y x) = (+) (eval y) (eval x)

printExpr :: Expr -> String
printExpr (Lit x) = show x
printExpr (Add y z) = (printExpr y) ++ " + " ++ (printExpr z)
