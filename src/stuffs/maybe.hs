succMaybe :: Maybe Int -> Maybe Int
succMaybe (Just x) = Just (x+1)
succMaybe _ = Nothing

unWrappedMaybe :: Maybe Int -> [Char]
unWrappedMaybe = maybe "I don't have nothing" show

divideTwoNumber :: Maybe Int -> Maybe Int -> Maybe Int
divideTwoNumber _ Nothing = Nothing
divideTwoNumber Nothing _ = Nothing
divideTwoNumber (Just a) (Just b) = 
    case b of
        0 -> Just 0
        b -> Just (a `div` b)
