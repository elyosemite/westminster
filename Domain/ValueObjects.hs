module Domain.ValueObjects where

newtype UserId = UserId String deriving (Show, Eq)
newtype AccountNumber = AccountNumber String deriving (Show, Eq)
newtype Email = Email String deriving (Show, Eq)
newtype Name = Name String deriving (Show, Eq)
newtype Balance = Balance Double deriving (Show, Eq, Ord)
