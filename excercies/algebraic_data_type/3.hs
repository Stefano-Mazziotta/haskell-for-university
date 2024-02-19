-- CONJUNTO o SET
{-
  Es una colección de items del mismo tipo,
  distingibles entre si por su clave o valor.

  Un ítem puede ser: 
    - Testeado si es miembro.
    - Insertado en la colección
    - Borrado de la colección
  
  El "tamanio del conjunto" es la cantidad de elementos distintos.

  Defina el tipo de dato e implemente los métodos del nuevo tipo de dato.
 
  Utiliza lista no ordenadas y sin duplicados.
 
  El metodo unionSet (unión de dos conjuntos) se escribirá haciendo uso de los métodos ya definidos.
  Es decir, no se operará directamente la lista sino se operará el SET.
-}
module Set(Set, emptySet, setEmpty, inSet, addSet, delSet) where 
newtype Set a = Set [a] deriving Show


emptySet :: Set a
emptySet = Set []

setEmpty :: Set a -> Bool
setEmpty (Set []) = True
setEmpty (Set [x]) = False

inSet :: (Eq a) => a -> Set a -> Bool
inSet x (Set []) = False
inSet x (Set (y:ys)) = x == y || inSet x (Set (ys))

addSet :: (Eq a) => a -> Set a -> Set a
addSet x (Set xs) = 
  if inSet x (Set (xs)) 
    then Set (xs) 
    else Set (x:xs)

delSet :: (Eq a) => a -> Set a -> Set a
delSet x (Set []) = Set []
delSet x (Set (y:ys)) = 
  if x /= y
    then addSet y (delSet x (Set ys))
    else delSet x (Set ys)

unionSet :: (Eq a) => Set a -> Set a -> Set a
unionSet (Set []) (Set (ys)) = Set (ys)
unionSet (Set (xs)) (Set []) = Set (xs)
unionSet (Set (x:xs)) (Set ys) = 
  if inSet x (Set ys)
    then unionSet (Set (xs)) (Set (ys))
    else unionSet (Set (xs)) (Set (x:ys))