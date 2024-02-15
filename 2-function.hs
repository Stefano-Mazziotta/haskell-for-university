module TestFunctions where

divide :: Int -> Int -> Int
divide x y = x `div` y

square :: Int -> Int
square x = x * x
 

{-
We usually use ' to either denote a strict version of a function (one that isn't lazy) or a slightly modified version of a function or a variable.
Because ' is a valid character in functions.
-}
doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2   

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  

--  we can make a function like this
conanO'Brien = "It's a-me, Conan O'Brien!"   



