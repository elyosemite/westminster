module Domain.Entity.Account where

import Data.Time.Clock (UTCTime)
import Data.Time.Calendar (Day)
import Domain.ValueObject.Balance
import Domain.ValueObjects (UserId, AccountNumber)

data Account = Account
{ accountId :: String,
  accountNumber :: AccountNumber,
  accountOwner :: UserId,
  accountBalance :: Balance,
  accountCreatedAt :: Day
} deriving (Show, Eq)

createAccount :: UserId -> UTCTime -> Account
createAccount owner createdAt = Account (AccountNumber $ show createdAt) owner (Balance 0.0) (utcDay createdAt)
