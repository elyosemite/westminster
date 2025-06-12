module Domain.Entity.AccountSpec where

import Domain.Entity.Account
  ( Account (accountBalance, accountCreatedAt, active, domainEvents),
    DomainError (InvalidDepositAmount),
    createAccount,
    deposit,
  )
import Domain.Event.AccountEvent
import Domain.ValueObject.AccountNumber
  ( AccountNumber (AccountNumber),
  )
import Domain.ValueObject.Balance
import Domain.ValueObject.UserId
import Test.Hspec (Spec, describe, it, shouldBe)

spec :: Spec
spec = describe "Account" $ do
  let account = createAccount (UserId "user-12345") (read "2023-10-01 12:00:00 UTC")

  it "Create a valid account" $ do
    accountCreatedAt account `shouldBe` read "2023-10-01"
    active account `shouldBe` True
    domainEvents account `shouldBe` [AccountCreated (AccountNumber "2023-10-01 12:00:00 UTC") (read "2023-10-01 12:00:00 UTC"), AccountActivated (AccountNumber "2023-10-01 12:00:00 UTC") (read "2023-10-01 12:00:00 UTC")]
    length (domainEvents account) `shouldBe` 2
    accountBalance account `shouldBe` Balance 0.0

  it "Account can not deposit zero value to the balance" $ do
    let depositZeroDollar = deposit account 0.0 (read "2023-10-01 12:00:00 UTC")
    depositZeroDollar `shouldBe` Left (InvalidDepositAmount 0.0)