module TestFunctions where

divide :: Int -> Int -> Int
divide x y = x `div` y

square :: Int -> Int
square x = x * x

-- Prefija
-- -(-2) | div 3 2

-- Infijas
-- 2 + 2 | 3 `div` 2

-- Posfija
-- 2 cuadrado

-- function composition
-- 
-- f(g(x)) == f (g x) <==> [maths || haskell] 