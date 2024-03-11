multThree :: (Num a) => a -> (a -> (a -> a))
multThree x y z = x * y * z

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

addNumbers :: Int -> Int -> Int
addNumbers x y = x + y

-- Aplicando Currying
curryingAddNumbers :: Int -> (Int -> Int)
curryingAddNumbers x y = x + y

curryingAddTwo :: Int -> Int
curryingAddTwo = (+ 2)

curryingMultipleBy :: Int -> (Int -> Int)
curryingMultipleBy x = (* x)

partialMult :: Int -> Int
partialMult = curryingMultipleBy 5