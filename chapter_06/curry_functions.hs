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

multiply :: Int -> (Int -> Int)
multiply x y = x * y

-- description about me.
-- You pass firstname and lastname and afterwards
-- in another function you can pass age parameter
myDescription :: String -> String -> (Int -> String)
myDescription firstName lastName age = description
    where description = "FirstName: " ++ firstName ++ " LastName: " ++ lastName ++ " Age: " ++ show age

myDescriptionWithAge :: Int -> String
myDescriptionWithAge = myDescription firstName lastName
    where firstName = "Yuri"
          lastName = "Melo"