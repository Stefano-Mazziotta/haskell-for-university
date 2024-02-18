{-
default ZIP recibe como argumento dos listas 
  - (x:xs)
  - (y:ys)
El resultado es una lista de tuplas (i,j)
  - Los i provienen de la primera lista
  - Los j provienen de la segunda lista.

Cuando una lista es mas larga que la otra, el resultado contempla solo los pares hasta donde pudieron formarse...
Ej: zip [1,2,3][10..] = [(1,10), (2,11), (3,12)]
Ej: zip [10...][1,2,3] = [(10,1), (11,2), (12,3)]

a) Escriba una versión personal de la funcion zip, llamada miZip
miZip:: [a] -> [b] -> [(a,b)]
-}

miZip :: [a] -> [b] -> [(a, b)]
miZip _ [] = []
miZip [] _ = []
miZip (x:xs) (y:ys) = (x,y) : miZip xs ys

{-
b) Utilizando miZip y listas por comprension.
Escriba una función que realice el producto escalar de dos listas.

Donde producto escalar estaría definido como la suma de los productos uno a uno, componente a componente de cada lista.
Si una lista tuviera más elementos que la otra, al agotarse uno de los operandos se detiene la suma

a1*b1 + a2*b2 + a3*b3 + ... + an*bn 
-}

prodEscalar :: [Int] -> [Int] -> Int
prodEscalar (x:xs) (y:ys) = sum [x * y | (x, y) <- miZip xs ys]

{-
c) Utilizando solo la función miZip escriba la función "indexado"
Dada una lista produce una lista de pares
  - Donde cada elemento de la lista tiene su posición dentro de la misma, la indexación comienza en 1.

Ej: indexado ["Juan", "Pedro", "Luis"] => [("Juan", 1),("Pedro", 2),("Luis", 3)]
-}

indexado :: [a] -> [(a, Int)]
indexado xs = miZip xs [1..]

