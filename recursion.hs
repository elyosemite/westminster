maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

-- [1, 3, 9, 4, 2]

-- maxTail = 1  | maximum' = 9

-- maxTail = 3  | maximum' = 9

-- maxTail = 9  | maximum' = 9

-- maxTail = 4  | maximum' = 4

-- maxTail = 2  | maximum' = 2
