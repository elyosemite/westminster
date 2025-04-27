module Domain.ValueObject.Profile where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.Email (Email (..))
import Domain.ValueObject.Name (Name (..))
import Domain.ValueObject.UserId

data Profile = Profile
  { profileId :: String,
    userId :: UserId,
    profileName :: Name,
    profileEmail :: Email,
    profileCreatedAt :: UTCTime,
    profileUpdatedAt :: UTCTime
  }
  deriving (Show, Eq)

createProfile :: UserId -> String -> String -> UTCTime -> Profile
createProfile userIdentifier name email createdAt =
  let profileIdentifier = "profile-" ++ show createdAt
      parsedName = Name name
      parsedEmail = Email email
   in Profile profileIdentifier userIdentifier parsedName parsedEmail createdAt createdAt
