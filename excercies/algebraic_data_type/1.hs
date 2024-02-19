{-
Defina un tipo de dato árbol binario de búsqueda (ArbolBin)

Escriba el método addTree e inOrderTree

addTree: inserta un elemento del tipo a en un arbol binario.
addTree :: (Ord a) => a -> ArbolBin a -> ArbolBin a

inOrderTree: produce in listado "En Orden" del árbol binario.
inOrderTree :: (Ord a) => ArbolBin a -> [a]

El listado en orden del árbol se define de la siguiente manera,
primero se lista en orden el árbol izquierdo, 
luego la raíz
y finalmente se lista en orden el árbol derecho.
-}

data ArbolBin a = VacioAB | NodoAB a (ArbolBin a) (ArbolBin a)
    deriving Show

mkNewTree :: (Ord a) => ArbolBin a
mkNewTree = VacioAB

addTree :: (Ord a) => a -> ArbolBin a -> ArbolBin a
addTree a VacioAB = NodoAB a VacioAB VacioAB
addTree a (NodoAB n izq der) 
    | a == n = NodoAB n izq der
    | a < n = NodoAB n (addTree a izq) der
    | a > n = NodoAB n izq (addTree a der)

surfTree :: (Ord a) => a -> ArbolBin a -> Bool
surfTree a VacioAB = False
surfTree a (NodoAB n izq der)
    | a == n = True
    | a < n = surfTree a izq
    | a > n = surfTree a der

inOrderTree :: (Ord a) => ArbolBin a -> [a]
inOrderTree VacioAB = []
inOrderTree (NodoAB n izq der) = inOrderTree izq ++ [n] ++ inOrderTree der 
