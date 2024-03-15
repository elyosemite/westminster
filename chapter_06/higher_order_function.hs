applytwice :: (a -> a) -> a -> a
applytwice f x = f (f x)
