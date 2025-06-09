module Domain.Event.UserEvent where

import Domain.ValueObject.UserId (UserId)

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
  | UserDeactivated UserId
  deriving (Show, Eq)
