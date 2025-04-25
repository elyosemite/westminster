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

addBalance :: Balance -> Balance -> Either String Balance
addBalance (Balance a) (Balance b) = mkBalance (a + b)

subtractBalance :: Balance -> Balance -> Either String Balance
subtractBalance (Balance a) (Balance b)
    | a < b = Left "Insufficient balance"
    | otherwise = mkBalance (a - b)
