multThree :: (Num a) => a -> (a -> (a -> a))
multThree x y z = x * y * z

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

addNumbers :: Int -> Int -> Int
addNumbers x y = x + y

-- Aplicando Curring
curryingAddNumbers :: Int -> (Int -> Int)
curryingAddNumbers x y = x + y


-- Aplicando Partial Application
addOne :: Int -> Int
addOne = curryingAddNumbers 1

addOneV2 :: RealFloat -> RealFloat
addOneV2 x y = x + y