module Domain.ValueObject.Balance where

newtype Balance = Balance Double deriving (Show, Eq, Ord)

mkBalance :: Double -> Either String Balance
mkBalance value
    | value < 0 = Left "Balance cannot be negative"
    | value > maximumBalance = Left "Balance exceeds maximum limit"
    | otherwise = Right (Balance value)

maximumBalance :: Double
maximumBalance = 1000000

toDouble :: Balance -> Double
toDouble (Balance value) = value

addBalance :: Balance -> Double -> Either String Balance
addBalance (Balance b) value
    | value <= 0 = Left "Cannot insert this value"
    | otherwise = mkBalance (b + value)

subtractBalance :: Balance -> Double -> Either String Balance
subtractBalance (Balance a) b
    | a < b = Left "Insufficient balance"
    | otherwise = mkBalance (a - b)
