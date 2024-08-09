module Main
  (
    -- export this module (for ghci):
    module Main, 
    -- export imported modules (for ghci):

  ) where

import Relude
import My


--------------------------------------------------------------------------------
--

main :: IO ()
main = do

    putTextLn "{{name}}"

