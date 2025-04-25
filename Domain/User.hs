module Domain.User where

import Data.Time.Clock (UTCTime)
import Domain.ValueObjects

data User = User
    { userId        :: UserId
    , userName      :: Name
    , userEmail     :: Email
    , userCreatedAt :: UTCTime
} deriving (Show, Eq)

createUser :: String -> String -> UTCTime -> User
createUser name email createdAt = User (UserId $ show createdAt) (Name name) (Email email) createdAt
