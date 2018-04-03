module SplitLines where

splitLines :: String -> [String]
splitLines [] = []
splitLines cs =
    -- break spaltet liste in 2 teile auf und gibt tuple zurueck
    -- pre ist vor breakpoint
    -- suf is nach breakpoint und enhaelt line-seperator falls vorhanden
    let (pre, suf) = break isLineTerminator cs
    -- list wird aus pre cons rekursivem aufruf von splitlines rest gebaut
    in pre : case suf of
        ('\r':'\n':rest) -> splitLines rest
        ('\r':rest) -> splitLines rest
        ('\n':rest) -> splitLines rest

isLineTerminator c = c == '\r' || c == '\n'

firstWord :: [String] -> [String]
firstWord xs = map (head . words) xs

fixLines :: String -> String
fixLines = unlines . splitLines
