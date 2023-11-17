bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2

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
