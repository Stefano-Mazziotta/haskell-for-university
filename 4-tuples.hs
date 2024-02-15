{-
    In some ways, tuples are like lists — they are a way to store several values into a single value.
    However, there are a few fundamental differences. A list of numbers is a list of numbers.
    That's its type and it doesn't matter if it has only one number in it or an infinite amount of numbers.
    Tuples, however, are used when you know exactly how many values you want to combine and its type depends on how many components it has and the types of the components.
    They are denoted with parentheses and their components are separated by commas.

    Another key difference is that they don't have to be homogenous.
    Unlike a list, a tuple can contain a combination of several types.

    Like lists, tuples can be compared with each other if their components can be compared. 
    Only you can't compare two tuples of different sizes, whereas you can compare two lists of different sizes.

    Two useful functions that operate on pairs:
-}

-- [fst] takes a pair and returns its first component.
fn = fst (8,11) -- result: 8
-- [snd] takes a pair and returns its second component.
fn2 = snd ("Wow", False) -- result: False

{-
    Note: these functions operate only on pairs. 
    They won't work on triples, 4-tuples, 5-tuples, etc. 
    We'll go over extracting data from tuples in different ways a bit later.
-}

{-
    A cool function that produces a list of pairs: [zip].
    It takes two lists and then zips them together into one list by joining the matching elements into pairs.
    It's a really simple function but it has loads of uses.
    It's especially useful for when you want to combine two lists in a way or traverse two lists simultaneously.
    Here's a demonstration
-}
fn3 =  zip [1,2,3,4,5] [5,5,5,5,5] -- result: [(1,5),(2,5),(3,5),(4,5),(5,5)] 

-- Here's a problem that combines tuples and list comprehensions: 
-- which right triangle that has integers for all sides and all sides equal to or smaller than 10 has a perimeter of 24?
rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]  



