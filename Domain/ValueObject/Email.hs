module Domain.ValueObject.Email where

import Data.Char (isSpace)

newtype Email = Email String deriving (Show, Eq)

mkEmail :: String -> Either String Email
mkEmail email
    | null email = Left "Email cannot be empty"
    | any isSpace email = Left "Email cannot contain whitespace"
    | not ('@' `elem` email) = Left "Email must contain '@'"
    | otherwise = Right (Email email)

getEmailString :: Email -> String
getEmailString (Email email) = email
