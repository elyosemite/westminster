module Domain.Entity.AccountSpec where

import Domain.Entity.Account
    ( Account(domainEvents, accountCreatedAt, active), createAccount )
import Domain.ValueObject.UserId
import Domain.ValueObject.AccountNumber
import Domain.Event.AccountEvent
import Test.Hspec ( Spec, describe, it, shouldBe )

spec :: Spec
spec = describe "Account" $ do
  let account = createAccount (UserId "user-12345") (read "2023-10-01 12:00:00 UTC")

  it "Create a valid account" $ do
    accountCreatedAt account `shouldBe` read "2023-10-01"
    active account `shouldBe` True
    domainEvents account `shouldBe` [AccountCreated (AccountNumber "2023-10-01 12:00:00 UTC") (read "2023-10-01 12:00:00 UTC"), AccountActivated (AccountNumber "2023-10-01 12:00:00 UTC") (read "2023-10-01 12:00:00 UTC")]
    length (domainEvents account) `shouldBe` 2
    