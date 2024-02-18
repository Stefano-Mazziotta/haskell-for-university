--- Consideremos la siguiente función
--- split :: (Ord a) => a -> [a] -> ([a], [a])
--- split x zs = ([y | y <- zs, y <= x], [y | y <- zs, y > x])
--- defina una versión de esta función que trabaje en exactamente una sola pasada a la lista "zs"

split [] = ([],[])
split [x] = ([x], [])
split (x:xs:t) = 
    (x:m1, xs:m2)
    where (m1, m2) = split t