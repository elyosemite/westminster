module Domain.Entity.Account where

import Data.Time.Clock (UTCTime, utctDay)
import Data.Time.Calendar (Day)
import Domain.ValueObject.Balance
import Domain.ValueObject.UserId
import Domain.ValueObject.AccountNumber
import Domain.Event.AccountEvent (AccountEvent (DepositOccurred))

data Account = Account
  {  accountId        :: String
  ,  accountNumber    :: AccountNumber
  ,  accountOwner     :: UserId
  ,  accountBalance   :: Balance
  ,  accountCreatedAt :: Day
  } deriving (Show, Eq)

createAccount :: UserId -> UTCTime -> Account
createAccount owner createdAt =
    let identifier =  "identifier"
        number = AccountNumber $ show createdAt
        balance = Balance 0.0
        createdAtDay = utctDay createdAt
    in Account identifier number owner balance createdAtDay 

data DomainError
  = UserNotFound UserId
  | AccountNotFound AccountNumber
  | InsufficientFunds AccountNumber Double Balance
  | InvalidDepositAmount Double
  | InvalidWithdrawalAmount Double
  deriving (Show, Eq)

deposit :: Account -> Double -> UTCTime -> Either DomainError (Account, AccountEvent)
deposit account amount time
  | amount <= 0 = Left $ InvalidDepositAmount amount
  | otherwise =
      let newBalance = Balance $ getBalance(accountBalance account) + amount
      in Right (account { accountBalance = newBalance }, DepositOccurred (accountNumber account) amount time)

getBalance :: Balance -> Double
getBalance (Balance b) = b
