cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

circleArea :: Float -> Float
circleArea r =
    let pi = 3.14
    in pi * r * r

hypotenuse :: Float -> Float -> Float
hypotenuse a b =
    let square x = x * x
    in sqrt (square a + square b)

trapezoidArea :: Float -> Float -> Float -> Float
trapezoidArea a b h =
    let sumBase = a + b
    in (sumBase / 2) * h

cylinderArea :: Float -> Float -> Float
cylinderArea r h =
    let pi = 3.14
        baseArea = pi * r * r
    in 2 * baseArea + 2 * pi * r * h

coneArea :: Float -> Float -> Float
coneArea r h =
    let pi = 3.14
        slantHeight = sqrt (r * r + h * h)
    in pi * r * (r + slantHeight)

sphereArea :: Float -> Float
sphereArea r =
    let pi = 3.14
    in 4 * pi * r * r

parallelepipedArea :: Float -> Float -> Float -> Float
parallelepipedArea a b c = let face1 = a * b; face2 = b * c; face3 = a * c in 2 * (face1 + face2 + face3)

cubeArea :: Float -> Float
cubeArea a = let face = a * a in 6 * face

prismArea :: Float -> Float -> Float -> Float
prismArea b h l = let baseArea = b * b; lateralArea = 2 * b * l in 2 * baseArea + lateralArea

pyramidArea :: Float -> Float -> Float -> Float
pyramidArea b h l = let baseArea = b * b; lateralArea = 2 * b * l in baseArea + lateralArea

numberType :: (Ord a, Num a) => a -> String
numberType n
    | n > 0     = let result = "Positivo" in result
    | n < 0     = let result = "Negativo" in result
    | otherwise = let result = "Zero" in result

maxNumber :: (Ord a, Num a) => a -> a -> a -> a
maxNumber x y z
    | x >= y && z >= z =
        let result = x
        in result
    | y >= x && y >= z =
        let result = y
        in result
    | otherwise =
        let result = z
        in result

parity :: Integral a => a -> String
parity n
    | even n = let result = "Par" in result
    | otherwise = let result = "Ímpar" in result

isPrime :: Integral a => a -> String
isPrime n
    | n <= 1 = let result = "não primo" in result
    | length [x | x <- [2..n - 1], n `mod` x == 0 ] > 0 = let result = "não primo" in result
    | otherwise = let result = "primo" in result

factorial :: (Eq a, Num a) => a -> a
factorial n
  | n == 0    = let result = 1 in result
  | otherwise = let result = n * factorial (n-1) in result

sendMessageToApp :: String -> String
sendMessageToApp msg
    | msg == "" = error "You must have provide a channel to sending message"
    | msg == "WhatsApp" =
        let pre_message = "Sending message to"
            app_name = "WhatsApp"
            message = "Hello, I'm a message written in Haskell to you!"
        in pre_message ++ " " ++ app_name ++ " : " ++ message
    | otherwise = let result = "Without app" in result
    where
        error = errorWithoutStackTrace