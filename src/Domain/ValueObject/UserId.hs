module Domain.ValueObject.UserId where

newtype UserId = UserId String deriving (Show, Eq)
