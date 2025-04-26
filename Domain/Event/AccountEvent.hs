module Domain.Event.AccountEvent 
(
  AccountEvent (..),
)
where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.AccountNumber

data AccountEvent
  = DepositOccurred AccountNumber Double UTCTime
  | WithdrawalOccurred AccountNumber Double UTCTime
  | AccountCreated AccountNumber UTCTime
  | AccountClosed AccountNumber UTCTime
  | TransferOccurred AccountNumber AccountNumber Double UTCTime
  | FeeChanged AccountNumber Double UTCTime
  | AccountDetailsUpdated AccountNumber String UTCTime
  | AccountSuspended AccountNumber UTCTime String -- the last argumento is for reason
  | AccountActivated AccountNumber UTCTime
  deriving (Show, Eq)
