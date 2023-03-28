#!/usr/bin/env stack
-- stack --install-ghc runghc --package htoml

{-# LANGUAGE OverloadedStrings #-}

import Text.Toml
import System.Environment (getArgs)
import qualified Data.Text as T
import qualified Data.Text.IO as T

main :: IO ()
main = do
    [path] <- getArgs
    tomlText <- T.readFile path
    let errorMessage = concat ["Invalid Toml file: [", path, "]"]
    case parseTomlDoc errorMessage tomlText of
         Left error -> print error
         Right table -> print table
