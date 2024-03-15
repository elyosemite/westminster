applytwice :: (a -> a) -> a -> a
applytwice f x = f (f x)

app :: (a -> b) -> a -> b
app f x = f x

add1 :: Int -> Int
add1 x = x + 1
