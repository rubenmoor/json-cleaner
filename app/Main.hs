module Main where

import           Data.Aeson                 (Value)
import qualified Data.Aeson                 as JSON
import           Data.Aeson.Parser          (json)
import           Data.Attoparsec.ByteString (eitherResult, parse)
import qualified Data.ByteString.Char8      as SChar8
import qualified Data.ByteString.Lazy.Char8 as LChar8

readInput :: String -> Value
readInput str =
  let result = eitherResult . parse json . SChar8.pack $ str
  in  either error id result

render :: Value -> String
render = LChar8.unpack . JSON.encode

main :: IO ()
main = interact $ render . readInput
