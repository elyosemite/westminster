module Domain.ValueObject.AccountNumber where

newtype AccountNumber = AccountNumber String deriving (Show, Eq)

mkAccountNumber :: String -> Either String AccountNumber
mkAccountNumber value
  | not (all (`elem` ['0'..'9']) value) = Left "Account number must be numeric"
  | length value /= 10 = Left "Account number must be exactly 10 digits"
  | otherwise = Right (AccountNumber value)
  