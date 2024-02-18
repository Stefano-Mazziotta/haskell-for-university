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
    else (y : merge ys (x:xs)) 



