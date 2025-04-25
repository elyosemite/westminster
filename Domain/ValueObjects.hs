module Domain.ValueObjects where

newtype UserId = UserId String deriving (Show, Eq)
newtype AccountNumber = AccountNumber String deriving (Show, Eq)
newtype Name = Name String deriving (Show, Eq)
