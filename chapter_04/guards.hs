bmiTell :: (RealFloat a) => a  -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal . Pffft, I bet you're ugly !"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"

-- BMI Function version 2
bmiTellV2 :: (RealFloat a) => a -> a -> String
bmiTellV2 weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal . Pffft, I bet you're ugly !"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"

-- My own Max function
myOwnMax :: (Ord a) => a -> a -> a
myOwnMax a b
    | a > b     = a
    | otherwise = b

-- My own Compare function
myOwnCompare :: (Ord a) => a -> a -> Ordering
a `myOwnCompare` b
    | a > b = GT
    | a ==b = EQ
    | otherwise = LT

-- Positive Function
isPositiveNumber :: Int -> String
isPositiveNumber number
    | number > 0 = "Is Positive"
    | number == 0 = "Zero"
    | otherwise = "Is negative"

-- Check order of two numbers
checkOrder :: Int -> Int -> String
checkOrder a b
    | a > b = "Decrescente"
    | a == b = "Iguais"
    | otherwise = "Crescente"