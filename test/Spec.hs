module Main where

import Data.Time.Clock (UTCTime)
import Domain.Entity.Account
import Domain.Event.AccountEvent (AccountEvent (..))
import Domain.ValueObject.AccountNumber (AccountNumber (..))
import Domain.ValueObject.UserId (UserId (..))
import Test.Hspec

-- Dummy UserId for testing
dummyUserId :: UserId
dummyUserId = UserId "john dow"

-- A fixed UTCTime for testing; in real cases use a constant value.
dummyTime :: UTCTime
dummyTime = read "1998-01-12 23:00:00 UTC"

main :: IO ()
main = hspec $ do
  describe "Account.deposit" $ do
    it "should deposit a positive amount" $ do
      let account = createAccount dummyUserId dummyTime
      let depositResult = deposit account 100.0 dummyTime
      case depositResult of
        Left err -> expectationFailure ("Expected success, but got: " ++ show err)
        Right (acc, event) -> do
          getBalance (accountBalance acc) `shouldBe` 100.0
          case event of
            DepositOccurred (AccountNumber n) amt _ -> do
              amt `shouldBe` 100.0
              n `shouldContain` "1998-01-12 23:00:00 UTC"
            _ -> expectationFailure "Unexpected event type"
