module Domain.Entity.Account 
(
  Account (..),
  createAccount,
  deposit,
  withdraw,
  getBalance,
  getActive,
  addAccountDomainEvent,
  isEventInAccount,
  DomainError (..),
)
where

import Data.Time.Calendar (Day)
import Data.Time.Clock (UTCTime, utctDay)
import Domain.Event.AccountEvent (AccountEvent (AccountActivated, AccountCreated, DepositOccurred, WithdrawalOccurred))
import Domain.ValueObject.AccountNumber
import Domain.ValueObject.Balance
import Domain.ValueObject.UserId

data Account = Account
  { accountId :: String,
    accountNumber :: AccountNumber,
    accountOwner :: UserId,
    accountBalance :: Balance,
    accountCreatedAt :: Day,
    active :: Bool,
    domainEvents :: [AccountEvent]
  }
  deriving (Show, Eq)

createAccount :: UserId -> UTCTime -> Account
createAccount owner createdAt =
  let identifier = "identifier"
      number = AccountNumber $ show createdAt
      balance = Balance 0.0
      createdAtDay = utctDay createdAt
      accountCreatedEvent = AccountCreated number createdAt
      accountActivedEvent = AccountActivated number createdAt
   in Account identifier number owner balance createdAtDay True [accountCreatedEvent, accountActivedEvent]

data DomainError
  = UserNotFound UserId
  | AccountNotFound AccountNumber
  | AccountNotActive AccountNumber
  | InsufficientFunds AccountNumber Double Balance
  | InvalidDepositAmount Double
  | InvalidWithdrawalAmount Double
  deriving (Show, Eq)

deposit :: Account -> Double -> UTCTime -> Either DomainError (Account, AccountEvent)
deposit account amount time
  | amount <= 0 = Left $ InvalidDepositAmount amount
  | otherwise =
      let newBalance = Balance $ getBalance (accountBalance account) + amount
      in Right (account {accountBalance = newBalance}, DepositOccurred (accountNumber account) amount time)

withdraw :: Account -> Double -> UTCTime -> Either DomainError (Account, AccountEvent)
withdraw account amount time
  | not (getActive account) = Left $ AccountNotActive (accountNumber account)
  | amount <= 0 = Left $ InvalidWithdrawalAmount amount
  | amount > getBalance (accountBalance account) = Left $ InsufficientFunds (accountNumber account) amount (accountBalance account)
  | otherwise =
      let newBalance = Balance $ getBalance (accountBalance account) - amount
       in Right (account {accountBalance = newBalance}, WithdrawalOccurred (accountNumber account) amount time)

getBalance :: Balance -> Double
getBalance (Balance b) = b

getActive :: Account -> Bool
getActive Account {active = isActive} = isActive

addAccountDomainEvent :: Account -> AccountEvent -> Account
addAccountDomainEvent account event =
  account {domainEvents = event : domainEvents account}

isEventInAccount :: Account -> AccountEvent -> Bool
isEventInAccount account event =
  event `elem` domainEvents account
