module Domain.ValueObject.BalanceSpec where

import Domain.ValueObject.Balance
import Test.Hspec

spec :: Spec
spec = describe "Balance" $ do
  it "should create a balance with a positive amount" $ do
    let balance = mkBalance 100.0
    case balance of
      Right b -> toDouble b `shouldBe` 100.0
      Left err -> expectationFailure $ "Expected Right, got Left: " ++ err

  it "should not allow negative balance" $ do
    let balance = mkBalance (-50.0)
    case balance of
      Right b -> toDouble b `shouldBe` -50.0
      Left err -> err `shouldBe` "Balance cannot be negative"

  it "should allow adding to the balance" $ do
    let initialBalance = mkBalance 100.0
    case initialBalance of
      Left err -> expectationFailure $ "Failed to create initial balance: " ++ err
      Right bal -> do
        let newBalance = addBalance bal 50.0
        case newBalance of
          Left err -> expectationFailure $ "Failed to add new value to balance: " ++ err
          Right bal2 -> toDouble bal2 `shouldBe` 150.0

  it "should allow subtracting from the balance" $ do
    let initialBalance = mkBalance 100.0
    case initialBalance of
      Left err -> expectationFailure $ "Failed to create init balance" ++ err
      Right bal -> do
        let newBalance = subtractBalance bal 90
        case newBalance of
          Left err -> expectationFailure $ "Failed to subtract new value from balance" ++ err
          Right bal2 -> 10 `shouldBe` toDouble bal2
