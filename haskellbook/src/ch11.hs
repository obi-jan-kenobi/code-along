data FictionType = FictionData deriving Show
data NonFictionType = NonFictionData deriving Show

data BookType = FictionBook FictionType | NonFictionBook NonFictionType
