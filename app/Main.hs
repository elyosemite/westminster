import Domain.Entity.User
import Data.Time.Clock (getCurrentTime)

main :: IO ()
main = do
    currentTime <- getCurrentTime
    let name  = "John Doe"
        email = "john.doe@gmail.com"
        user  = createUser name email currentTime
    print user
