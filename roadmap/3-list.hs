{-
In Haskell, lists are a homogenous data structure. 
They store several elements of the same type.
That means that we can have a list of integers or a list of characters but we can't have a list that has a few integers and then a few characters.
And now, a list!
-}

lostNumbers = [4,8,15,16,23,42]
-- lostNumbers

concatLists xs ys = xs ++ ys

pushToListBeginning xs x = x:xs

{-

- Note: [], [[]] and[[],[],[]] are all different things. 
    The first one is an empty list.
    The seconds one is a list that contains one empty list.
    The third one is a list that contains three empty lists.
 
- Here are some basic functions that operate on lists:

    [Head] takes a list and returns its head. The head of a list is basically its first element.
    head [5,4,3,2,1] => 5

    [tail] takes a list and returns its tail. In other words, it chops off a list's head.
    tail [5,4,3,2,1] => [4,3,2,1] 

    [last] takes a list and returns its last element.
    last [5,4,3,2,1] => 1

    [init] takes a list and returns everything except its last element.
    init [5,4,3,2,1] => [5,4,3,2]   

    When using head, tail, last and init, be careful not to use them on empty lists.

    [length] takes a list and returns its length, obviously.
    length [5,4,3,2,1] => 5 

    [null] checks if a list is empty.
    If it is, it returns True, otherwise it returns False.
    Use this function instead of xs == [] (if you have a list called xs).
    null [] => True   

    [reverse] reverses a list.
    reverse [5,4,3,2,1] => [1,2,3,4,5]  

    [take] takes a number and a list.
    It extracts that many elements from the beginning of the list. Watch.
    take 3 [5,4,3,2,1]  => [5,4,3] 
    take 1 [3,9,3] => [3] 

    [drop] works in a similar way, 
    only it drops the number of elements from the beginning of a list.
    drop 3 [8,4,2,1,5,6] => [1,5,6]  
    drop 0 [1,2,3,4] => [1,2,3,4]  

    [maximum] takes a list of stuff that can be put in some kind of order and returns the biggest element.
    [minimum] returns the smallest.
    minimum [8,4,2,1,5,6] => 1
    maximum [1,9,2,3,4]  => 9

    [sum] takes a list of numbers and returns their sum.
    [product] takes a list of numbers and returns their product.
    sum [5,2,1,6,3,2,5,7]  => 31  
    product [6,2,1,2] => 24  

    [elem] takes a thing and a list of things and tells us if that thing is an element of the list.
    It's usually called as an infix function because it's easier to read that way.
    4 `elem` [3,4,5,6]  => True  
    10 `elem` [3,4,5,6] => False 

[1..20] === [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

['a'..'z'] ===" abcdefghijklmnopqrstuvwxyz" 
[2,4..20] === [2,4,6,8,10,12,14,16,18,20]  
[3,6..20] === [3,6,9,12,15,18] 
-}



-- I'm a list comprehension
fn = [x*2 | x <- [1..10]] 
fn2 = [x*2 | x <- [1..10], x*2 >= 12]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]  
-- boomBangs [7..13] => ["BOOM!","BOOM!","BANG!","BANG!"]  