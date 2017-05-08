# Prelude
**Prelude** is a library of standard functions. Open-
ing GHCi or Stack GHCi automatically loads those functions so
they can be used without needing to do anything special.

# Expressions
Everything in Haskell is an expression or declaration. Expressions may be values, combinations of values, and/or functions applied to values. Expressions evaluate to a result.

# Values
Values are Expressions but cannot be reduced further.

# Operators
Functions in Haskell default to prefix syntax.
## Convention
If the function name is alphanumeric, it is a prefix function by default. Not all prefix functions can be made infix. If the name is a symbol, it is infix by default but can be made prefix by wrapping it in parentheses.

# Associativity and precedence
Provided by :info

# difference let & where
let introduces an expression
where is a declaration and is bound to a surrounding syntactic construct
