added :: Maybe Integer
added = (+3) <$> (lookup 3 $ zip [1,2,3] [4,5,6])

y :: Maybe Integer
y = lookup 3 $ zip [1,2,3] [4,5,6]

z :: Maybe Integer
z = lookup 2 $ zip [1,2,3] [4,5,6]

sidestep :: Maybe (b -> (Integer, b))
sidestep = (,) <$> y

tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y <*> z

xs = [1,2,3]
ys = [4,5,6]

xss :: Maybe Integer
xss = lookup 3 $ zip xs ys

yss :: Maybe Integer
yss = lookup 2 $ zip xs ys

summed :: Maybe Integer
summed = fmap sum $ (,) <$> xss <*> yss
