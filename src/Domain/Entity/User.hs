module Domain.Entity.User
(
  createUser
)
where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.UserId
import Domain.ValueObject.Email
import Domain.ValueObject.Name
import Domain.Event.UserEvent

data User = User
  { userId :: UserId,
    userName :: Name,
    userEmail :: Email,
    userCreatedAt :: UTCTime,
    domainEvents :: [UserEvent]
  }
  deriving (Show, Eq)

createUser :: String -> String -> UTCTime -> User
createUser name email createdAt =
  let userIdentifier = UserId $ show createdAt
      username = Name name
      userEmailValue = Email email
   in User userIdentifier username userEmailValue createdAt []
