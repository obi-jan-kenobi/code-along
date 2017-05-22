# Data Declaration

are how datatypes are defined.
- *Type constructor* is the name of the type and capitalized.
- *Data constructors* are the values that inhabit the type they are defined in.


Data declaration:

      -- the definition of Bool  
      data Bool = False | True  
      --   [1]     [2] [3] [4] 

1. *type constructor* for datatype bool.
    * name of the type
    * shows up in type signatures
2. *data constructor* for the value False
3. Pipe | indicates a sum type or logical disjunction: "or"
4. *data constructor* for the value True

# Numeric types

All of them have typeclass *Num*

**Integral numbers**: whole numbers, positive, negative
* *Int*: fixed-precision integer
    * has range, max, min
* *Integer*: integers too, 

**Fractional**: 
* *Float*: single-precision floating point
* *Double*: double-precision floating point (twice as many bits as Float)
* *Rational*: fractional number that represents a ratio of two integers
* *Scientific*: represents number with coefficient as an Integer and exponent as an Int


# Fixed vs. floating point
*Fixed-point* have immutable numbers of digits assigned for the parts of the number before and after the decimal point.  
*Floating-point* can shift how many bits it uses to represent numbers before or after the decimal point.

# Tuples
To store multiple values in a single value. Have a fixed number of constituents. This number is known as arity. Tuple of arity 0 is called *unit*. Values inside a tuple dont have to be of the same type.

        :info (,)
        data (,) a b = (,) a b

This is a *product* type. Both arguments have to be supplied to produce a value.

# List
Everything in a list has to be of the **same** type. Lists are build are the []-syntax. Number of constituents can change.

# Typeclass
