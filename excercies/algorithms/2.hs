{-
Escribir una función que:
- recibe como argumento dos listas ordenadas
- devuelve una lista ordenada fusión de las listas argumentos

merge :: (Ord a) => [a] -> [a] -> [a]
(No se debe usar ningún metodo de clasificación)

use cases:

    fusion [1,2,3] [1,2,3] 
    > [1,1,2,2,3,3]

    fusion [1,2] [1,2,3]
    > [1,1,2,2,3]

    fusion [1,2,3] [1,2]
    > [1,1,2,2,3]
-}

-- merge
merge::(Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = 
    if x < y 
    then (x : merge xs (y:ys))
    else (y : merge (x:xs) ys) 

{-
merge [1,5,6] [2,3,7]
    1 < 3
    1 : merge [5,6] [2,3,7]
        5 < 2
        2 : merge [5,6] [3,7]
            5 < 3
            3 : merge [5,6] [7]
                5 < 7      
                5 : merge [6] [7]
                    6 < 7
                    6 : merge [] [7]
                        [7]
[1,2,3,5,6,7]
    1 : [2,3,5,6,7]
        2 : [3,5,6,7]
            3 : [5,6,7]   
                5 : [6,7]
                    6 : [7]


-}



