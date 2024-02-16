{-

Now we'll use GHCI to examine the types of some expressions.
We'll do that by using the :t command which, followed by any valid expression, tells us its type.
Let's give it a whirl.

ghci> :t 'a'  
    'a' :: Char  
ghci> :t True  
    True :: Bool  
ghci> :t "HELLO!"  
    "HELLO!" :: [Char]  
ghci> :t (True, 'a')  
    (True, 'a') :: (Bool, Char)  
ghci> :t 4 == 5  
    4 == 5 :: Bool  
-}

{-
Functions also have types.
When writing our own functions, we can choose to give them an explicit type declaration.
This is generally considered to be good practice except when writing very short functions.
From here on, we'll give all the functions that we make type declarations.
Here's how it looks like with a type declaration.
-}

removeNonUppercase :: [Char] -> [Char]  -- [Char] === String
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]  

{-
But how do we write out the type of a function that takes several parameters? 
Here's a simple function that takes three integers and adds them together:
-}

addThreeIntegers :: Int -> Int -> Int -> Int  
addThreeIntegers x y z = x + y + z

-- complete... https://learnyouahaskell.github.io/types-and-typeclasses.html


