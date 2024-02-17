-- This function checks if the number we supplied to it is a seven or not.
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

-- This function checks if the string we supplied to it
-- is a "Yuri Melo" or "Thamirys Melo" or not.
whoAmI :: String -> String
whoAmI "Yuri Melo" = "I'm Yuri Melo"
whoAmI "Thamirys Melo" = "I'm Thamirys Melo"
whoAmI _ = "I don't know it"

-- This function checks if the Ord we supplied to it
-- is more than 7 or not
isGreaterThanSeven :: (Ord a, Num a) => a -> Bool
isGreaterThanSeven x = x == 7

isEqualToAnotherValue :: (Eq number) => number -> number -> Bool
isEqualToAnotherValue x y = x == y

maxOfThreeValues :: (Ord number) => number -> number -> number -> number
maxOfThreeValues x y z = max (max x y) z