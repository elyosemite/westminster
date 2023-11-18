bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- Yuri Melo has created this function by your own
whatMyName :: String -> String
whatMyName name
    | name == "Brasil" = "Yuri Melo"
    | name == "USA" = "Melo"
    | otherwise      = "I dont know!"

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

-- Implementing our own compare function
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b       = GT
    | a == b      = EQ
    | otherwise   = LT

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^2

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

myDogsNames = [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]

myCustomSquares = [let square x = x * x in (square 5, square 3, square 25)]

myFoo = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "There" in foo ++ bar)

calcBmisV2 :: (RealFloat a) => [(a, a)] -> [a]
calcBmisV2 xs = [ bmi | (w, h) <- xs, let bmi = w / h ^2]

-- We could make our function return only the BMIs of fat people
calcBmisV3 :: (RealFloat a) => [(a, a)] -> [a]
calcBmisV3 xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]
