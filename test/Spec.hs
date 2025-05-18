module Main where

import Test.Hspec
import Data.Time.Clock (UTCTime)
import Domain.ValueObject.UserId
import qualified Domain.ValueObject.ProfileSpec as ProfileSpec
import qualified Domain.ValueObject.BalanceSpec as BalanceSpec
import qualified Domain.ValueObject.PhoneSpec as PhoneSpec

dummyUserId :: UserId
dummyUserId = UserId "john dow"

dummyTime :: UTCTime
dummyTime = read "1998-01-12 23:00:00 UTC"

main :: IO ()
main = hspec $ do
  ProfileSpec.spec
  BalanceSpec.spec
  PhoneSpec.spec
  -- describe "Account.deposit" $ do
  --   it "should deposit a positive amount" $ do
  --     let account = createAccount dummyUserId dummyTime
  --     let depositResult = deposit account 100.0 dummyTime
  --     case depositResult of
  --       Left err -> expectationFailure ("Expected success, but got: " ++ show err)
  --       Right (acc, event) -> do
  --         getBalance (accountBalance acc) `shouldBe` 100.0
  --         case event of
  --           DepositOccurred (AccountNumber n) amt _ -> do
  --             amt `shouldBe` 100.0
  --             n `shouldContain` "1998-01-12 23:00:00 UTC"
  --           _ -> expectationFailure "Unexpected event type"
  --     case account of
  --       Account { domainEvents = events } -> do
  --         length events `shouldBe` 2
  --         isEventInAccount account (AccountCreated (AccountNumber $ show dummyTime) dummyTime) `shouldBe` True
  --         isEventInAccount account (AccountActivated (AccountNumber $ show dummyTime) dummyTime) `shouldBe` True
    
  --   it "should not deposit a negative amount" $ do
  --     let account = createAccount dummyUserId dummyTime
  --     let depositResult = deposit account (-50.0) dummyTime
  --     case depositResult of
  --       Left (InvalidDepositAmount amt) -> amt `shouldBe` (-50.0)
  --       _ -> expectationFailure "Expected InvalidDepositAmount error"
    
  --   it "should not deposit zero amount" $ do
  --     let account = createAccount dummyUserId dummyTime
  --     let depositResult = deposit account 0.0 dummyTime
  --     case depositResult of
  --       Left (InvalidDepositAmount amt) -> amt `shouldBe` 0.0
  --       _ -> expectationFailure "Expected InvalidDepositAmount error"
