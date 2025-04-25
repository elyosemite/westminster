module Domain.Event.AccountEvent where

import Domain.ValueObjects (AccountNumber)

data AccountEvent
  = DepositOccurred AccountNumber Double UTCTime
  | WithdrawalOccurred AccountNumber Double UTCTime
  deriving (Show, Eq)
