module Main where

import System.Environment (getArgs)
import System.IO ()
import OurMagicParser
import TheGrammer


main ::  IO ()
main =
    getArgs >>= \argv -> 
    if length argv == 1 && length (head argv) > 0
      then printResult $ parse expression $ stripChars " \t" (head argv)
    else braveExit "share something if u dont mind ..." 84