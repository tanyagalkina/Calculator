module OurMagicParser
    (
       
        braveExit
        , printResult
        , stripChars
    ) where

import Text.Printf
import System.Exit

stripChars :: String -> String -> String
stripChars = filter . flip notElem


printResult :: [(Float, String)] -> IO()
printResult [] = braveExit "I could not calculate... I am sorry" 84
printResult  res | snd (head res) /= "" =  braveExit "I could not parse everything.." 84
                 | otherwise = 
                   thePrint $ fst (head res) 


braveExit :: String -> Int -> IO ()
braveExit str 0 = putStrLn str >> exitWith (ExitSuccess)
braveExit str n = putStrLn str >> exitWith (ExitFailure n)


thePrint :: (Show a, PrintfArg a, RealFloat a) => a -> IO ()
thePrint x = 
    if (not (isInfinite x)) then
        printf "%.2f\n" x
    else braveExit "wrong operation can you try again" 84