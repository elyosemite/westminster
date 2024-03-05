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
        slantHeight = sqrt(r * r + h * h)
    in pi * r * (r + slantHeight)
