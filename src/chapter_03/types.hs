removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z'] ]

-- Multiple parameters in function

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
