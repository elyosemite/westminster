module Domain.ValueObject.Profile
  ( Profile (..),
    createProfile,
  )
where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.Email (Email (..))
import Domain.ValueObject.Name (Name (..))
import Domain.ValueObject.UserId (UserId (..))

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
createProfile userId name email createdAt =
  let profileIdentifier = "profile-" ++ show createdAt
      profileName = Name Name
      profileEmail = Email email
      profileCreatedAt = createdAt
   in Profile profileIdentifier userId profileName profileEmail profileCreatedAt createdAt
