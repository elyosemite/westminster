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
largestDivisible = head (filter p [100000, 99999..])
    where p x = x `mod` 3892 == 0