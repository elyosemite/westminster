module Domain.ValueObject.PhoneSpec where

import Domain.ValueObject.Phone
import Test.Hspec

spec :: Spec
spec = describe "formatPhone" $ do
  it "format phone with extension" $ do
    let phone = Phone "55" "11" "999998888" (Just "1234") Work
    formatPhone phone `shouldBe` "+55 (11) 999998888 ext. 1234 [Work]"

  it "deve parsear número com extensão usando 'x'" $ do
    parsePhone "5511999998888x1234"
      `shouldBe` Right (Phone "55" "11" "999998888" (Just "1234") Mobile)