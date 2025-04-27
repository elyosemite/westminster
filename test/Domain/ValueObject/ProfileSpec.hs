module Domain.ValueObject.ProfileSpec where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.Profile
import Domain.ValueObject.UserId
import Test.Hspec

dummyUserId :: UserId
dummyUserId = UserId "john doe"

dummyName :: String
dummyName = "John Doe"

dummyEmail :: String
dummyEmail = "yuri@gmail.com"

dummyTime :: UTCTime
dummyTime = read "1998-01-12 23:00:00 UTC"

spec :: Spec
spec = describe "Profile" $ do
    it "should create a profile with valid data" $ do
      let profile = createProfile dummyUserId dummyName dummyEmail dummyTime
      userId profile `shouldBe` dummyUserId
      profileCreatedAt profile `shouldBe` dummyTime
