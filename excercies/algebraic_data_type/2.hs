{-
Una cola de prioridad
 Estructura de datos que almacena elementos "clasificables"
 Cuando se saca uno de ella siempre se extra el elemento con menor clave
 Clasifica los elementos en función de su prioridad.
 La prioridad más baja primero.

Las funciones que manipulan a la cola de prioridad son:

mkqpr: Instancia una nueva cola de prioridad vacia.
addqpr: Agrega un nuevo elemento a la cola de prioridad.
nextqpr: Devuelve el elemento con clave más baja de la Cola de prioridad.
popqpr: Devuelve una cola de prioridad donde se ha quitado el nextqpr.

Defina el TAD ColaPrioridad.
Implemenete el mismo utilizando un árbol binario de búsqueda como estructura de almacenamiento.
Escribir todas las funciones necesarias para la manipulación de la estructura subyascente, es decir para manipular el arbol.
Sugerencia: Recordar como extraer el elemento con clave más pequena de un árbol.
-}

newtype ColaPrio a = CP[a] deriving Show

mkqpr :: ColaPrio a
mkqpr = CP []

addqpr :: a -> ColaPrio a -> ColaPrio a
addqpr a (CP cp) = CP (cp ++ [a])

nextqpr :: ColaPrio a -> a
nextqpr (CP []) = error "Cola vacia"
nextqpr (CP (x:xs)) = x

popqpr :: ColaPrio a -> ColaPrio a
popqpr (CP []) = error "Cola vacia"
popqpr (CP (x:xs)) = CP xs

-- Implementado con la estructura de almacenamiento como arbol binario

data PriorityQueue a = NodoVacio | Nodo a (PriorityQueue a)
    deriving Show

mkqpr' :: PriorityQueue a 
mkqpr' = NodoVacio

addqpr' :: (Ord a) => a -> PriorityQueue a -> PriorityQueue a
addqpr' value NodoVacio = Nodo value NodoVacio
addqpr' value (Nodo n nextNodo) 
    | value > n = Nodo n (addqpr' value nextNodo)
    | value < n = Nodo value (Nodo n nextNodo)
    | value == n = Nodo value nextNodo

nextqpr' :: PriorityQueue a -> a
nextqpr' NodoVacio = error "Empty queue"
nextqpr' (Nodo n NodoVacio) = n
nextqpr' (Nodo n nextNodo) = n

popqpr' :: PriorityQueue a -> PriorityQueue a
popqpr' (Nodo n NodoVacio) = NodoVacio
popqpr' (Nodo n nextNodo) = nextNodo

