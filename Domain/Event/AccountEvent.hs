module Domain.Event.AccountEvent where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.AccountNumber

data AccountEvent
  = DepositOccurred AccountNumber Double UTCTime
  | WithdrawalOccurred AccountNumber Double UTCTime
  deriving (Show, Eq)
