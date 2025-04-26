module Domain.Event.UserEvent
  ( UserEvent (..),
    UserCreated (..),
    UserDeleted (..),
    UserUpdated (..),
  )
where

data UserEvent
  = UserCreated UserId
  | UserDeleted UserId
  | UserUpdated UserId
  | UserBlocked UserId
  | UserUnblocked UserId
  | UserEmailUpdated UserId
  | UserNameUpdated UserId
  | UserPasswordUpdated UserId
  | UserPhoneUpdated UserId
  | UserAddressUpdated UserId
  | UserProfilePictureUpdated UserId
  | UserPreferencesUpdated UserId
  | UserTwoFactorAuthEnabled UserId
  | UserTwoFactorAuthDisabled UserId
  | UserPasswordResetRequested UserId
  | UserPasswordResetCompleted UserId
  | UserAccountActivated UserId
  | UserAccountDeactivated UserId
  deriving (Show, Eq)
