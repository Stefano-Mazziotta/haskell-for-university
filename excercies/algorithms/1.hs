{-
Un número perfecto es aquel que:
- Es igual a la suma de sus divisores menores que él.

n == (dn1 + dn2 + ... + dny) --> cómo obtener los divisores de un número (el modulo == 0)

Ejemplo: 6: 3,2,1

Utilizando lista por comprensión escribir la función "perfectosn"
Que dé como resultado la lista de números perfectos comprendidos en el intervalo [1,n]

perfectosn 0 ==> []
perfectosn 1 ==> [1]
perfectosn 6 ==> [6]
perfectosn 28 ==> [6,28]


[1,2,3,4,5,6]

getDivisiores 6 ==> [1,2,3]



-}

----- Mi resolución - poco óptima cuando se expande la lista
getDivisores:: Int -> [Int]
getDivisores 0 = []
getDivisores 1 = [1]
getDivisores n = [x | x <- [1..n], n `mod` x == 0 && x < n]

perfectosn:: Int -> [Int]
perfectosn 0 = []
perfectosn 1 = [1];
perfectosn n = [x | x <- [1..n], x == (sum (getDivisores x))]

------ Optimizado by chatGPT
getDivisores' :: Int -> [Int]
getDivisores' n = filter (\x -> n `mod` x == 0) [1..isqrt n]
  where isqrt = floor . sqrt . fromIntegral

sumDivisores' :: Int -> Int
sumDivisores' n = sum [x + (n `div` x) | x <- [1..isqrt n], n `mod` x == 0] - n
  where isqrt = floor . sqrt . fromIntegral

perfectosn' :: Int -> [Int]
perfectosn' n = [x | x <- [1..n], x == sumDivisores' x]
