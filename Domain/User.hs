module Domain.User where

import Data.Time.Clock (UTCTime)
import Domain.ValueObjects
import Domain.ValueObject.Email

data User = User
  { userId :: UserId,
    userName :: Name,
    userEmail :: Email,
    userCreatedAt :: UTCTime
  }
  deriving (Show, Eq)

createUser :: String -> String -> UTCTime -> User
createUser name email createdAt =
  let userIdentifier = UserId $ show createdAt
      username = Name name
      username_email = Email email
   in User userIdentifier username username_email createdAt
