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

-- Create readme with parameters:
-- * title, description, tech
createGeneralReadme :: String -> (String -> (String -> String))
createGeneralReadme title description tech = generalDescription
    where generalDescription = "Title: " ++ title ++ "; Description: " ++ description ++ "; Techs: " ++ tech

createReadmeWithTitle :: String -> (String -> (String -> String))
createReadmeWithTitle = createGeneralReadme

createReadmeWithDescription :: String -> (String -> String)
createReadmeWithDescription = createReadmeWithTitle "Empty Title"

createReadmeWithTech :: String -> String
createReadmeWithTech = createReadmeWithDescription ""

createReadmePythonProject :: String -> (String -> String)
createReadmePythonProject = createReadmeWithTitle title
    where title = "Python Project"

uncurriedAddition :: Num a => (a, a) -> a
uncurriedAddition nums =
    let
        a = fst nums
        b = snd nums
    in a + b

sum' :: (Num a) => a -> (a -> a)
sum' x y = x + y

sumFive :: Int -> (Int -> (Int -> (Int -> (Int -> Int))))
sumFive x y z t k = ownSum
    where ownSum = x + y + z + t + k
