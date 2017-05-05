# Chapter 1
1. λxy.xz
* * λxz.xz
* * **λmn.mz** alpha equivalenz: (x:m n:y)
* * λz(λx.xz)

2. λxy.xxy
* * λmn.mnp
* * λx(λy.xy)
* * **λa(λb.aab)** beta equivalenz: λx.λy.xxy

3. λxyz.zx
* * λx.(λy.(λz.z))
* * **λtos.st** alpha equivalenz
* * λmnp.mn

**Combinators** Determine if each of the following are combinators or not.
1. λx.xxx
2. λxy.zx
3. λxyz.xy(zx)
4. λxyz.xy(zxy)
5. λxy.xy(zxy)

**Normal form or diverge?**
Determine if each of the following can be reduced to a normal form or if they diverge.
1. λx.xxx
2. (λz.zz)(λy.yy)
3. (λx.xxx)z

**Beta reduce** 
Evaluate (that is, beta reduce) each of the following expressions to normal form. We strongly recommend writing out
the steps on paper with a pencil or pen.

1. (λabc.cba)zz(λwv.w)
* (λa.λb.λc.cba)zz(λw.λv.w)
* (λb.λc.cbz)z(λw.λv.w)
* (λc.czz)(λw.λv.w)
* (λw.λv.w)zz
* (λv.z)z
2. (λx.λy.xyy)(λa.a)b
* (λy.(λa.a)y)b
* (λy.y)b
* b
3. (λy.y)(λx.xx)(λz.zq)
* (λx.xx)(λz.zq)
* (λz.zq)(λz.zq)
4. (λz.z)(λz.zz)(λz.zy)
* (λz.zz)(λz.zy)
* (λz.zy)(λz.zy)
5. (λx.λy.xyy)(λy.y)y
* (λy.(λy.y)yy)y
* (λy.yy)y
* yy
6. (λa.aa)(λb.ba)c
* (λb.ba)(λb.ba)c


