module CLI where

import System.Environment (getArgs)
import SplitLines (splitLine)

interactWith fn inputFile outputFile =
    do
        input <- readFile inputFile
        writeFile outputFile (fn input)

main = mainWith myFn
    where mainWith fn = do
        args <- getArgs
        case args of
            [input, output] -> interactWith fn input output
            _ -> putStrLn "error: exactly two arguments needed"


myFn = unlines . splitLine
