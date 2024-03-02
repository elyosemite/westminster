-- Global where binding
-- Pode ser usados por mais de uma função.
-- Eu poderia ter declarado todos tanto Skinny
--  quanto Normal globalmente; porém decidi colocar
--  apenas o Fat
fat :: (RealFloat a) => a
fat = 30.0

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi < skinny = "You're underweight, you emo, you!"
    | bmi < normal = "You're supposedly normal . Pffft, I bet you're ugly !"
    | bmi < fat    = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal) = (18.5, 25.0)

getInitialFromName :: String -> String ->String
getInitialFromName firstName lastName = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstName
          (l:_) = lastName

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [ bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

-- Dados uma lista de pares de números reais
-- some a diferença entre os dois pare com a sopa dos dois pares dados
fooCalculate :: (RealFloat a) => [(a, a)] -> [a]
fooCalculate xs = [bar x y + baz x y| (x, y) <- xs]
    where bar coordenateX coordenateY = coordenateX + coordenateY
          baz coordenateX coordenateY = coordenateX - coordenateY
