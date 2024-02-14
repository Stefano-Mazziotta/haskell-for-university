module TestFunctions where

divide :: Int -> Int -> Int
divide x y = x `div` y

square :: Int -> Int
square x = x * x

-- prefix
-- -(-2) | div 3 2

-- infix
-- 2 + 2 | 3 `div` 2

-- postfix
-- 2 square

-- function composition
-- 
-- f(g(x)) == f (g x) <==> [maths || haskell] 