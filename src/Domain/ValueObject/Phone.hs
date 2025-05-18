module Domain.ValueObject.Phone where

import Data.Char (isDigit)
import Data.Maybe (listToMaybe)
import Data.List (isPrefixOf)

data PhoneType = Modile | Home | Work deriving (Show, Eq)

data Phone = Phone
  { countryCode :: String
  , areaCode    :: String
  , number      :: String
  , extension   :: Maybe String
  , phoneType  :: PhoneType
  } deriving (Show, Eq)

formatPhone :: Phone -> String
formatPhone (Phone cc ac num ext pt) =
  "+" ++ cc ++ " (" ++ ac ++ ") " ++ num ++ formatExtension ext ++ " [" ++ show pt ++ "]"
  where
    formatExtension Nothing = ""
    formatExtension (Just e) = " ext. " ++ e

validLength :: Int -> Int -> String -> Bool
validLength minLen maxLen s = length s >= minLen && length s <= maxLen

isValidPhone :: Phone -> Either String ()
isValidPhone (Phone cc ac num ext _) =
  if not (all isDigit cc && validLength 1 4 cc) then Left "Country code is invalid"
  else if (all isDigit ac && validLength 1 5 ac) then Left "Area code is invalid"
  else if (all isDigit num && validLength 4 15 num) then Left "Number is invalid"
  else if maybe False (\e -> all isDigit e && validLength 1 6 e) ext then Left "Extension is invalid"
  else Right ()

parsePhone :: String -> Either String Phone
parsePhone input =
  let 
    (mainPart, extensionPart) = splitExtension input
    digits = filter isDigit mainPart
  in case digits of
    (c1:c2:a1:a2:rest) | length rest >= 8 ->
      let cc = [c1, c2]
          ac   = [a1, a2]
          num  = take 9 rest
          ext  = parseExtension extPart
      in Right $ Phone cc ac num ext Mobile
    _ -> Left "Número inválido: esperado formato 'CCAA999999999'"

-- Detect extension based on the separator "x" or "ext"
splitExtension :: String -> (String, Maybe String)
splitExtension str =
  case break (`elem` ['x', 'X']) str of
    (num, 'x':ext) -> (num, Just ext)
    (num, 'X':ext) -> (num, Just ext)
  _ -> case words str of
          (n:"ext":e:_) -> (n, Just e)
          (n:"EXT":e:_) -> (n, Just e)
          _ -> (str, Nothing)

parseExtension :: Maybe String -> Maybe String
parseExtension = fmap (take 6 . filter isDigit)