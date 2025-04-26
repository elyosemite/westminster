module Domain.Entity.User
(
  User (..),
  createUser,
)
where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.UserId
import Domain.ValueObject.Email
import Domain.ValueObject.Name
import Domain.Event.UserEvent (UserEvent (..))

data User = User
  { userId :: UserId,
    userName :: Name,
    userEmail :: Email,
    userCreatedAt :: UTCTime
    domainEvents :: [UserEvent]
  }
  deriving (Show, Eq)

createUser :: String -> String -> UTCTime -> User
createUser name email createdAt =
  let userIdentifier = UserId $ show createdAt
      username = Name name
      username_email = Email email
   in User userIdentifier username username_email createdAt
