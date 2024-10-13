-- Collatz Sequence
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd  n  = n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- Não é recomendado que você utilize lambdas neste caso.
-- Use Partial Application pois aumenta a ligibilidade.
sumTwoNumbers :: [Int] -> Int -> [Int]
sumTwoNumbers xs y = map (\x -> x + y) xs

-- Fica bem mais legível
sumTwoNumbersWithoutLambda :: [Int] -> Int -> [Int]
sumTwoNumbersWithoutLambda xs y = map (+ y) xs

-- addThree :: (Num a) => a -> a -> a -> a
-- addThree x y z = x + y + z

-- Similar a esta função abaixo com lambdas
addThree :: (Num a) => a -> a -> a -> a
addThree = \x -> \y -> \z -> x + y + z

sum' :: (Num a) => [a] -> a
sum' = foldl (\acc x -> acc + x) 0

-- Exercícios Básicos

-- 1. Soma de uma lista:
sumElementsInArray :: (Num a) => [a] -> a
sumElementsInArray = foldl (+) 0

-- 2. Produto de uma lista
productElementsInArray :: (Num a) => [a] -> a
productElementsInArray = foldl (*) 1

-- 3. Verificação de todos verdadeiros:
allTrue :: [Bool] -> Bool
allTrue = foldl (&&) True -- Você pode substituir por apenas allTrue = and

-- 4. Concatenar strings:
concatenar :: [String] -> String
concatenar = foldl (++) ""

-- 5. Maior número:
maxNumber :: [Int] -> Int
maxNumber = foldl max (minBound :: Int)

-- 6. Menor número:
minNumber :: [Int] -> Int
minNumber = foldl min (maxBound :: Int)

-- 7. Conta elementos:
countElements :: [a] -> Int
countElements = foldl (\acc _ -> acc + 1) 0

-- 8. Verificar se contém zero:
countZero :: [Int] -> Bool
countZero = foldr (\x acc -> x == 0 || acc) False

-- 9. Reverter lista:
revert :: [a] -> [a]
revert = foldl (flip (:)) []

-- 10. Aplicar operação condicional:
sumPositivies :: [Int] -> Int
sumPositivies = foldr (\x acc -> if x > 0 then x + acc else acc) 0

-- Exercícios de Medianos

-- 1. Filtrar números pares:
filterPairs :: [Int] -> [Int]
filterPairs = foldl (\acc x -> if even x then acc ++ [x] else acc) []

filterFoo :: (Integral a) => [a] -> [a]
filterFoo = foldl (\acc x -> if even x then acc ++ [x] else acc) []

filterMoreThemX :: (Integral a) => [a] -> a -> [a]
filterMoreThemX _ x
    | x < 0  = [-1]
    | x == 0 = [0]
filterMoreThemX arr maxValue = foldl (\acc x -> if x > maxValue then acc ++ [x] else acc) [] arr
