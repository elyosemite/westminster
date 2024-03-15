applytwice :: (a -> a) -> a -> a
applytwice f x = f (f x)

-- Usage:
-- app (\x -> x * x) 10
app :: (a -> b) -> a -> b
app f x = f x

-- Usage:
-- describeMe (\x -> "My name is " ++ x) "Yuri Melo"
describeMe :: (String -> String) -> String -> String
describeMe func name = func name


-- transferBitcoinToWallet from("Yuri Melo") to("Igor Melo") BTC Quantity (10)
transferBitcoinToWallet :: (String -> String -> Int -> String) -> String -> String -> Int -> String
transferBitcoinToWallet func from to quantity = func from to quantity

doneTransfer :: String
doneTransfer = transferBitcoinToWallet (\from to quantity -> "From: " ++ from ++ " To: " ++ to ++ " Quantity: " ++ show quantity) "Yuri" "Igor" 100 ++ " BTC"