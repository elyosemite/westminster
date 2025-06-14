module Domain.ValueObject.PhoneSpec where

import Domain.ValueObject.Phone
import Test.Hspec

spec :: Spec
spec = describe "Phone" $ do
  it "format phone with extension" $ do
    let phone = Phone "55" "11" "999998888" (Just "1234") Work
    formatPhone phone `shouldBe` "+55 (11) 999998888 ext. 1234 [Work]"

  it "it must parse number with extension 'x'" $ do
    parsePhone "5511999998888x1234"
      `shouldBe` Right (Phone "55" "11" "999998888" (Just "1234") Mobile)
      