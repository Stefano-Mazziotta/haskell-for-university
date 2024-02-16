----- Pattern Matching
lucky :: (Int a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!"   
{-
    We defined the factorial of a number n as product [1..n].
    We can also define a factorial function recursively, the way it is usually defined in mathematics.
    We start by saying that the factorial of 0 is 1.
    Then we state that the factorial of any positive integer is that integer multiplied by the factorial of its predecessor.
    Here's how that looks like translated in Haskell terms.
-}
factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1) 

{-
It complains that we have non-exhaustive patterns, and rightfully so.
When making patterns, we should always include a catch-all pattern so that our program doesn't crash if we get some unexpected input.
-}


-- What if we wanted to make a function that takes two vectors in a 2D space (that are in the form of pairs) and adds them together?
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

{-
fst and snd extract the components of pairs. But what about triples?
Well, there are no provided functions that do that but we can make our own.
-}
first :: (a, b, c) -> a  
first (x, _, _) = x  
  
second :: (a, b, c) -> b  
second (_, y, _) = y  
  
third :: (a, b, c) -> c  
third (_, _, z) = z  

{-
The _ means the same thing as it does in list comprehensions.
It means that we really don't care what that part is, so we just write a _.

-}


let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
fn = [a+b | (a,b) <- xs]  

{-
We already implemented our own length function using list comprehension.
Now we'll do it by using pattern matching and a little recursion:
-}

length' :: (Num b) => [a] -> b  
length' [] = 0  
length' (_:xs) = 1 + length' xs  

{-
Let's implement sum. We know that the sum of an empty list is 0.
We write that down as a pattern. And we also know that the sum of a list is the head plus the sum of the rest of the list.
So if we write that down, we get:
-}

sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs  

{-
There's also a thing called as patterns.
Those are a handy way of breaking something up according to a pattern and binding it to names whilst still keeping a reference to the whole thing
You do that by putting a name and an @ in front of a pattern.
For instance, the pattern xs@(x:y:ys).
This pattern will match exactly the same thing as x:y:ys but you can easily get the whole list via xs instead of repeating yourself by typing out x:y:ys in the function body again.
Here's a quick and dirty example:
-}


capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  
-- ghci> capital "Dracula" result: "The first letter of Dracula is D"

------ Guards
{-

-}

densityTell :: (RealFloat a) => a -> String  
densityTell density  
    | density < 1.2 = "Wow! You're going for a ride in the sky!"  
    | density <= 1000.0 = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink." 

{-
Of course we can use guards with functions that take as many parameters as we want. 
Instead of having the user calculate the density of the substance on their own before calling the function,
let's modify this function so that it takes a mass (in grams) and volume (in liters).
-}
densityTell :: (RealFloat a) => a -> a -> String  
densityTell mass volume  
    | mass / volume < 1.2 = "Wow! You're going for a ride in the sky!"  
    | mass / volume <= 1000.0 = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  

{-
Another very simple example: let's implement our own max function. 
If you remember, it takes two things that can be compared and returns the larger of them.
-}
max' :: (Ord a) => a -> a -> a  
max' a b  
    | a > b     = a  
    | otherwise = b  

-- et's implement our own compare by using GUARDS.
myCompare :: (Ord a) => a -> a -> Ordering  
a `myCompare` b  
    | a > b     = GT  
    | a == b    = EQ  
    | otherwise = LT 

------ Where!?

sensityTellwh :: (RealFloat a) => a -> a -> String  
densityTellwh mass volume  
    | density < 1.2 = "Wow! You're going for a ride in the sky!"  
    | density <= 1000.0 = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  
    where density = mass / volume  

{-
It also improves readability by giving names to things and can make our programs faster since stuff like our density variable here is calculated only once.
We could go a bit overboard and present our function like this:
-}

densityTell2 :: (RealFloat a) => a -> a -> String  
densityTell2 mass volume  
    | density < air = "Wow! You're going for a ride in the sky!"  
    | density <= water = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  
    where density = mass / volume  
          air = 1.2  
          water = 1000.0 

densityTell3 :: (RealFloat a) => a -> a -> String  
densityTell3 mass volume  
    | density < air = "Wow! You're going for a ride in the sky!"  
    | density <= water = "Have fun swimming, but watch out for sharks!"  
    | otherwise   = "If it's sink or swim, you're going to sink."  
    where density = mass / volume  
          (air, water) = (1.2, 1000.0)

-- Let's make another fairly trivial function where we get a first and a last name and give someone back their initials.

initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname

{-
Just like we've defined constants in where blocks, you can also define functions.
Staying true to our solids programming theme,
let's make a function that takes a list of mass-volume pairs and returns a list of densities.
-} 
calcDensities :: (RealFloat a) => [(a, a)] -> [a]  
calcDensities xs = [density m v | (m, v) <- xs]  
    where density mass volume = mass / volume 


----- LET IT BE
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  

{-
The form is let <bindings> in <expression>.
The names that you define in the let part are accessible to the expression after the in part.
-}

------ CASE EXPRESSION

head' :: [a] -> a  
head' [] = error "No head for empty lists!"  
head' (x:_) = x  

head' :: [a] -> a  
head' xs = case xs of [] -> error "No head for empty lists!"  
                      (x:_) -> x 

{-
Whereas pattern matching on function parameters can only be done when defining functions,
case expressions can be used pretty much anywhere. For instance:
-}

describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."  
                                               xs -> "a longer list."

describeList' :: [a] -> String  
describeList' xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  