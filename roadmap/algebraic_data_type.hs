--    [1]     [2]       [3]
data Point = Point Double Double
  deriving (Show, Eq)

-- [1]: Type constructor.
-- [2]: Data constructor.
-- [3]: Types wrapped.

-- Polymorphic data types
data PPoint a = PPoint a a
  deriving (Show, Eq)

-- Records
data PointRecord = PointRecord
  { x :: Double
  , y :: Double
  }
  deriving (Show, Eq)

{-
Records also provide us with getter functions for free.
The names of those getters are the same as the field names.

*Main> a = Point 3 4
*Main> a
Point {x = 3.0, y = 4.0}

Records also provide us with getter functions for free. The names of those getters are the same as the field names.
*Main> x a
3.0
*Main> y a
4.0

You can update a record by providing the fields you want to update (rest will stay the same).
*Main> b = a {x = 4}
*Main> b
Point {x = 4.0, y = 4.0}

*Main> moveUp point = point {y = y point + 1}
*Main> c = moveUp a
*Main> c
Point {x = 3.0, y = 5.0}


Of course, you can also work with records via pattern matching as with basic product types.
*Main> getX (Point x _) = x
*Main> getX a
3.0
-}

--- Sum types

data PointSum = Point2D Double Double | Point3D Double Double Double
  deriving (Show, Eq)

pointToList :: Point -> [Double]
pointToList (Point2D x y) = [x, y]
pointToList (Point3D x y z) = [x, y, z]

{-
In other words, using a sum type is like saying that you need type a or type b:
 “I need True or False”, “I need a 2D point or a 3D point”, etc.
-}

--- Algebraic data types
-- Summing types
-- Multiplying types

data CheckedInStatus = CheckedInStatus Bool Bool
{-
Possible values of CheckedInStatus:
  True True 
  True False 
  False True
  False False
-}

-- Definition of an algebraic data type
--                  [1]           [2]             [3]
data Point = Point2D Double Double | Point3D Double Double Double
-- The Point data type is a sum ([2]) of products ([1], [3]).


-- Common ADTs
-- Now, let’s look at two commonly used ADTs in Haskell: Maybe and Either.

-- Maybe

{-
Sometimes, a function might not be able to return a value for a certain input.
In that case, we can use the Maybe type. It has two possible data constructors: Just or Nothing.
If the function succeeds, we wrap the result in Just.
Otherwise, we return Nothing, which symbolizes something similar to null.
-}

-- In case we call it with an empty list, we’ll get an exception:

{-
*Main> head []
*** Exception: Prelude.head: empty list
We can make it give a result for each input by pattern matching on the contents of the list and returning Nothing in the case of an empty list.
-}

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x : _) = Just x

{-
*Main> safeHead []
  Nothing
*Main> safeHead [1, 2, 3]
  Just 1
-}

-- Either
-- In contrast to Maybe, it can store something on the left side, such as an error message.
-- Let’s rewrite our safeHead function with Either.

safeHead :: [a] -> Either String a
safeHead [] = Left "I have no head."
safeHead (x : _) = Right x

{-
*Main> safeHead []
  Left "I have no head."
*Main> safeHead [1, 2, 3]
  Right 1
-}

-- Exponential types (functions)



