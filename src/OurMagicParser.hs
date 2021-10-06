module OurMagicParser

    (
        ourFunParser
        , someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "84.00"

--type EitherParser a = String -> Either String (a, String) 


ourFunParser :: String -> Maybe Float
ourFunParser _ | 2 == 2 = Just 3.14  -- 2 == 2if our real Parser succeeds
               | otherwise = Nothing  


ourFunParserEither :: String -> Either String Float
ourFunParserEither input | 2 == 2 = Left "I apologize... smth went wrong"
                   | otherwise = Right 3.14
