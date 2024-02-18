import Control.Concurrent.STM (check)
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

-- This function checks if the Eq parameters we supplied to it
-- are equals and it return a bool
isEqualToAnotherValue :: (Eq number) => number -> number -> Bool
isEqualToAnotherValue x y = x == y

-- This function return the maximun between three numbers
maxOfThreeValues :: (Ord number) => number -> number -> number -> number
maxOfThreeValues x y z = max (max x y) z

-- This function check if a list is empty
isEmptyList :: [a] -> Bool
isEmptyList [] = True
isEmptyList _ = False

-- Patter Matching with tuple
getFirstElementFrom :: (a, b) -> a
getFirstElementFrom (x, _) = x

-- Function to check whether a number is positive, negative or zero
checkGivenNumber :: (Num a, Ord a) => a -> String
checkGivenNumber 0 = "Zero"
checkGivenNumber x
    | x > 0     = "Positive"
    | otherwise = "Negative"

-- Function to check whether a string starts with a certain character
startsWithLetter :: String -> Char -> Bool
startsWithLetter (x:_) c | x == c = True
startsWithLetter _ _ = False

-- This function indicates whether a number is between 1 and 5
sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

-- Calculate the Factorial
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial(n - 1)

-- Add vectors in R2
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Function that get the first element from a list
getTheFirstElementFromList :: [a] -> a
getTheFirstElementFromList [] = error "Can't call head on an empty list, dummy!"
getTheFirstElementFromList (firstElement:_) = firstElement

-- Function show the first, second and third element from a list
tellElement :: (Show a) => [a] -> String
tellElement [] = "The list is empty"
tellElement [x] = "The list has one element: " ++ show x
tellElement [x,y] = "The list has two elements: " ++ show x ++ " and " ++ show y
tellElement (x:y:z:_) = " This list is long . The elements are : " ++ show x ++ " and " ++ show y ++ " and " ++ show z
