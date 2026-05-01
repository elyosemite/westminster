module Chapter04.Where where

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
    where bmi = weight / height ** 2
          (skinny, normal) = (18.5, 25.0)

getInitialFromName :: String -> String -> String
getInitialFromName (f:_) (l:_) = [f] ++ ". " ++ [l] ++ "."
getInitialFromName _ _         = ""

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [ bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ** 2

-- Dados uma lista de pares de números reais
-- some a diferença entre os dois pare com a sopa dos dois pares dados
fooCalculate :: (RealFloat a) => [(a, a)] -> [a]
fooCalculate xs = [bar x y + diff x y| (x, y) <- xs]
    where bar coordenateX coordenateY = coordenateX + coordenateY
          diff coordenateX coordenateY = coordenateX - coordenateY

baz :: (RealFloat a) => (a, a, a) -> String
baz (0, 0, 0) = "Origem"
baz _ = "Soma de Y e Z"
