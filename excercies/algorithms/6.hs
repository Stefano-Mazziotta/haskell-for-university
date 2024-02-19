--- Consideremos la siguiente función
--- split :: (Ord a) => a -> [a] -> ([a], [a])
--- split x zs = ([y | y <- zs, y <= x], [y | y <- zs, y > x])
--- defina una versión de esta función que trabaje en exactamente una sola pasada a la lista "zs"

split :: (Ord a) => a -> [a] -> ([a], [a])
split _ [] = ([], [])
split x (y:ys)
    | y <= x    = (y:left, right)
    | otherwise = (left, y:right)
  where
    (left, right) = split x ys

