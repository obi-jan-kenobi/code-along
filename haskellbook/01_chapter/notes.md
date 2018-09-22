# Haskellbook-Notes

## Chapter 1
The essence of functional programming is that *programs are a combination of expressions*. Expressions include concrete values, variables, and also functions. Functions have a more specific definition: they are expressions that are applied to an argument or input, and once applied, can be reduced or evaluated.

*Input set* is known as the **domain**. A set of unique values that are *possible outputs* for the function is called the **codomain**. The *set of all possible outputs* related to different inputs is the **range**.

The lambda calculus has three basic components, or lambda terms: expressions, variables, and abstractions.

* λ x . x
    * λ bis . ist der head.
    * dazwischen sind die Parameter
    * nach dem . kommt der body

### alpha equivalenz
besagt, dass die 'x'-e in der Lambda expression keine semantische Bedeutung haben

### beta equivalenz
ist der prozess bei dem argumente an eine funktion gebunden werden.

The process of beta reduction stops when there are either no more heads, or lambdas, left to apply or no more arguments to apply functions to.

### free variables
sind variablen aus dem body, die nicht im head der expression vorkommen

### multiple arguments
Each lambda can only bind one parameter and can only accept one argument. Functions that require multiple arguments have multiple, nested heads.

**λxy.xy = λx.(λy.xy)**

### beta normal form
ist wenn keine weitere beta reduction(lambdas auf argumenten anweden) vorgenommen werden kann

### combinators
sind lambdas die keine freien variablen haben
bsp: 
* λxy.x
* λx.x
* λxyz.xz(yz)
