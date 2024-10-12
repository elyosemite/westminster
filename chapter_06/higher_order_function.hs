import Data.Char (toUpper, isSpace, isUpper)
applytwice :: (a -> a) -> a -> a
applytwice f x = f (f x)

-- Usage:
-- app (\x -> x * x) 10
app :: (a -> b) -> a -> b
app f x = f x

-- Usage:
-- describeMe (\x -> "My name is " ++ x) "Yuri Melo"
describeMe :: (String -> String) -> String -> String
describeMe func name = func name

-- transferBitcoinToWallet from("Yuri Melo") to("Igor Melo") BTC Quantity (10)
transferBitcoinToWallet :: (String -> String -> Int -> String) -> String -> String -> Int -> String
transferBitcoinToWallet func from to quantity = func from to quantity

doneTransfer :: String
doneTransfer = transferBitcoinToWallet (\from to quantity -> "From: " ++ from ++ " To: " ++ to ++ " Quantity: " ++ show quantity) "Yuri" "Igor" 100 ++ " BTC"

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter p (x:xs)
    | p x = x : myFilter p xs
    | otherwise = myFilter p xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)
    in smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible = head (filter calculateTheMod [100000, 99999..])
    where calculateTheMod x = x `mod` 3892 == 0

doubleList :: [Int] -> [Int]
doubleList = map (* 2)

capitalizeWords :: [String] -> [String]
capitalizeWords = map (map toUpper)

filterEvenNumbers :: [Int] -> [Int]
filterEvenNumbers = filter even

removeVowels :: [String] -> [String]
removeVowels = map (filter (`notElem` "aeiouAEIOU"))

negateList :: [Int] -> [Int]
negateList = map negate

filterLongWords :: [String] -> [String]
filterLongWords = filter (\word -> length word > 3)

doubleOddNumbers :: [Int] -> [Int]
doubleOddNumbers = map (\x -> if odd x then x * 2 else x)

filterPositiveNumbers :: [Int] -> [Int]
filterPositiveNumbers = filter (> 0)

trimWhitespace :: [String] -> [String]
trimWhitespace = map (dropWhile isSpace . reverse . dropWhile isSpace . reverse)

filterUppercaseWords :: [String] -> [String]
filterUppercaseWords = filter (all isUpper)

-- Collatz Sequence
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd  n  = n:chain (n*3 + 1)

chain2 :: (Integral a) => a -> [a]
chain2 1 = [1]
chain2 n
    | even n = n:chain2 (n `div` 2)
    | odd  n = n:chain2 (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15

crazy :: (Integral a) => a -> [a]
crazy a
    | a <= 1 = [1]
    | maxLength <= 10 && even a = a:chain (a `div` 2)
    | maxLength <= 10 && odd  a = a:chain (a * 3 + 1)
    | otherwise = [1]
    where maxLength = 10
