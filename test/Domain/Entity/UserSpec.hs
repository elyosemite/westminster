module Domain.Entity.UserSpec where

import Domain.Entity.User
import Domain.ValueObject.UserId
import Domain.ValueObject.Name
import Domain.ValueObject.Email
import Domain.Event.UserEvent
import Test.Hspec

spec :: Spec
spec = describe "User" $ do
  let user = createUser "John Doe" "john@mail.com" (read "2023-10-01 12:00:00 UTC")

  it "Register a valid user" $ do
    user `shouldBe` User
      { userId = UserId "2023-10-01 12:00:00 UTC",
        userName = Name "John Doe",
        active = True,
        userEmail = Email "john@mail.com",
        userCreatedAt = read "2023-10-01 12:00:00 UTC",
        domainEvents = []
      }
    userCreatedAt user `shouldBe` (read "2023-10-01 12:00:00 UTC")
    domainEvents user `shouldBe` []

  it "Deactivate a user" $ do
    let deactivatedUser = deactiveUser user
    active deactivatedUser `shouldBe` False
    domainEvents deactivatedUser `shouldBe` [UserDeactivated (userId user)]
    userId deactivatedUser `shouldBe` userId user
    userName deactivatedUser `shouldBe` userName user
    userEmail deactivatedUser `shouldBe` userEmail user
    userCreatedAt deactivatedUser `shouldBe` userCreatedAt user