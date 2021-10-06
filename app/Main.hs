module Main where

import System.Environment (getArgs)
import System.IO ()
import OurMagicParser (ourFunParser)
import Text.Printf
import System.Exit
import Data.Maybe

main :: IO ()
main = do
    argv <- getArgs
    if (length argv == 1 && length (head argv) > 0) then do
        let result = ourFunParser (head argv)
        if result /= Nothing
            then printf "%.2f\n" $ fromJust result
            else putStrLn "please, give me something to do..." >>
                exitWith (ExitFailure 84)  
    else putStrLn "share something if u dont mind ..."
        >> exitWith (ExitFailure 84)         