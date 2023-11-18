-- Case expressions
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
