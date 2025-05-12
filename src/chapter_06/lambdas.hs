import Distribution.Compat.CharParsing (integral)
import System.Win32 (xBUTTON1)
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

-- EXERCÍCIOS BÁSICOS

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

-- EXERCÍCIOS MÉDIOS

-- 1. Filtrar números pares:
filterPairs :: [Int] -> [Int]
filterPairs = foldl (\acc x -> if even x then acc ++ [x] else acc) []

filterFoo :: (Integral a) => [a] -> [a]
filterFoo = foldl (\acc x -> if even x then acc ++ [x] else acc) []

filterMoreThemX :: (Integral a) => [a] -> a -> [a]
filterMoreThemX _ x
    | x < 0  = [-1]
    | x == 0 = [0]
filterMoreThemX xs maxValue = foldl (\acc x -> if x > maxValue then acc ++ [x] else acc) [] xs

filterLessThem :: (Integral a) => [a] -> a -> [a]
filterLessThem _ x
    | x < 0 = [-1]
    | x == 0 = [0]
filterLessThem xs minValue = foldl (\acc x -> if x < minValue then acc ++ [x] else acc) [] xs

processList :: [Int] -> Int -> Int -> String -> [String]
processList nums low high suffix = foldl (\acc x -> if x >= low && x <= high
                                                    then acc ++ [show x ++ suffix]
                                                    else acc) [] nums

-- 2. Palíndromo:
palindromo :: String -> Bool
palindromo str = str == foldr(:) [] str

-- 3. Agrupar elementos:
agrupar :: Eq a => [a] -> [[a]]
agrupar = foldr (\x acc -> if not (null acc) && x == head (head acc) 
                           then (x : head acc) : tail acc
                           else [x] : acc) []

-- 4. Produto escalar:
produtoEscalar :: [Int] -> [Int] -> Int
produtoEscalar xs ys = foldl (+) 0 (zipWith (*) xs ys)

-- 5. Remover duplicatas:
removerDuplicatas :: Eq a => [a] -> [a]
removerDuplicatas = foldr (\x acc -> if x `elem` acc then acc else x : acc) []

-- 6. Contar palavras:
countWords :: String -> Int
countWords = foldl (\acc _ -> acc + 1) 0 . words

-- 7. Fatorial com foldr:
factorial :: Int -> Int
factorial n = foldr (*) 1 [1..n]

-- 8. Aplicar função em pares:
aplicarEmPares :: (a -> a -> a) -> [a] -> [a]
aplicarEmPares f xs = foldl (\acc (x,y) -> acc ++ [f x y]) [] (zip xs (tail xs))

-- 9. Soma de prefixos:
somaPrefixos :: [Int] -> [Int]
somaPrefixos = scanl1 (+)

-- 10. Calcular média:
media :: [Int] -> Double
media xs = fromIntegral (foldl (+) 0 xs) / fromIntegral (length xs)

-- EXERCÍCIOS COMPLEXOS

-- 1. Transformar uma árvore binária:
-- Pesquisar depois como funciona os data types e funções : dir & esq
data Arvore a = Vazia | Nodo a (Arvore a) (Arvore a)

percursoEmOrdem :: Arvore a -> [a]
percursoEmOrdem Vazia = []
percursoEmOrdem (Nodo v esq dir) = foldr (:) [] (percursoEmOrdem esq ++ [v] ++ percursoEmOrdem dir)


-- 2. Compressão de lista:
comprimirLista :: [Int] -> [(Int, Int)]
comprimirLista = foldl (\acc x -> case acc of
                        [] -> [(x, x)]
                        (start, end):rest -> if end + 1 == x then (start, x):rest else (x, x):acc) []

-- 3. Desenrolar uma lista de listas:
combinacoes :: [[a]] -> [[a]]
combinacoes = foldr (\xs acc -> [x:y | x <- xs, y <- acc]) [[]]

-- 4. Implementar map usando fold:
mapFoldr :: (a -> b) -> [a] -> [b]
mapFoldr f = foldr (\x acc -> f x : acc) []
