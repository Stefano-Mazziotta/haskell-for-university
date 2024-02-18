{-
Escribir una función que inserta elementos en una lista de manera de mantenerla odenada de menor a mayor.
De esta forma cada operacion Head sobre la lista devuelve el elemento más chico almacenado en ella.

inserta :: (Ord a) => a -> [a] -> [a]
-}

inserta :: (Ord a) => a -> [a] -> [a]
inserta a [] = [a]
inserta a (x:xs) = 
    if a < x
        then (a:x:xs)
        else (x: inserta a xs)        