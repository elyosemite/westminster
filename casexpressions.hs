-- Case expressions

-- case expression of pattern -> result
--                    pattern -> result
--                    pattern -> result
--                    pattern -> result
--                    ...

head' :: [a] -> a
head' [] = error "No head for empty lists!"
head' (x:_) = x

headV2 :: [a] -> a
headV2 xs = case xs of [] -> error "No head for empty lists!"
                       (x:_) -> x

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of []  -> "empty."
                                               [x] -> "a singleton list."
                                               xs  -> "a longer list."

describeListV2 :: [a] -> String
describeListV2 xs = "The list is " ++ what xs
    where what []  = "empty."
          what [x] = "a singleton list."
          what xs  = "a longer list."

describeMaybe :: Maybe Int -> String
describeMaybe m = case m of Nothing -> "Nada"
                            Just x  -> "Just" ++ show x

describeEither :: Either String Int -> String
describeEither e = 
    case e of Left s -> s
              Right i -> show i

firstElement :: (Show a) => [a] -> String
firstElement xs =
    case xs of []    -> "Vazia"
               (x:_) -> show x

describeBool :: Bool -> String
describeBool b = 
    case b of True  -> "Verdadeiro"
              False -> "Falso"