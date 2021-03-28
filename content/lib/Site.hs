{-# LANGUAGE OverloadedStrings #-}

module Site where

import Data.String (IsString (fromString))
import Data.Text   (Text)

name :: IsString s => s
name = "趣味はデバッグ……"

url :: Text
url = "https://doujin.kakkun61.com"
