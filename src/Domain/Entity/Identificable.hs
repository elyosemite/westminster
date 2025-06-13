module Domain.Entity.Identificable where

class Identificable a where
  getId :: a -> String

data User = User {userId :: String, userName :: String, userAddress :: String}
data Account = Account {accountNumber :: String, accountBalance :: Double, accountUser :: String}

instance Identifiable User where
  getId user = userId user

instance Identifiable Account where
  getId account = accountNumber account

findById :: (Identifiable a) => String -> [a] -> Maybe a
findById searchId list = find_in (\x -> getId x == searchId) list
  where
    find_in p xs = case filter p xs of
      (x : _) -> Just x
      _ -> Nothing
