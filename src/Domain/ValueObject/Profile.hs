module Domain.ValueObject.Profile where

import Data.Time.Clock (UTCTime)
import Domain.ValueObject.Email
import Domain.ValueObject.Name (Name (..))
import Domain.ValueObject.Phone
import Domain.ValueObject.UserId

data Profile = Profile
  { profileId :: String,
    userId :: UserId,
    profileName :: Name,
    profileEmail :: Email,
    profilePhone :: [Phone],
    profileCreatedAt :: UTCTime,
    profileUpdatedAt :: UTCTime
  }
  deriving (Show, Eq)

createProfile :: UserId -> String -> String -> String -> UTCTime -> Profile
createProfile userIdentifier name email phone createdAt =
  let profileIdentifier = "profile-" ++ show createdAt
      parsedName = Name name
      parsedEmail = Email email
      parsedPhone = parsePhone phone
   in case parsedPhone of
        Left err -> error $ "Invalid phone number: " ++ err
        Right phoneList -> Profile profileIdentifier userIdentifier parsedName parsedEmail [phoneList] createdAt createdAt
