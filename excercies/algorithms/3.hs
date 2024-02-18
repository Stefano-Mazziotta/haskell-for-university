{-
Escriba una función:
  Qsort :: (Ord a) => [a] -> [a] - Sin utilizar compresión.

Observación:
  Escriba una función "partición", que reciba como argumento:
    - Un valor de referencia pivot
    - Una lista de valores del mismo tipo que el pivot.

  Esta funcion da como resultado una tupla de dos listas (l1, l2)
    - En l1 están todos los valores de la lista original que son menores o iguales que el pivot
    - En l2 todos los mayores que el pivot. 
-}

particion :: (Ord a) => a -> [a] -> ([a], [a])
particion p [] = ([],[])
particion p (x:xs) = 
    if x <= p
        then (x:l1, l2)
        else (l1, x:l2)
    where (l1,l2) = particion p xs

-- use case
-- ([1,2],[8,9]) = particion 6 [1,2,8,9]

-- where:
--  ([2],[8,9]) = particion 6 [2,8,9]
--      ([],[8,9]) = particion 6 [8,9]
--          ([],[9]) = particion 6 [9]
--              ([],[]) = particion 6 [] 

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort [a] = [a]
qsort (x:xs) = 
    qsort zs ++ [x] ++ qsort ys
    where (zs,ys) = particion x xs

