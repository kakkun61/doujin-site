{-# LANGUAGE OverloadedStrings #-}

module Author
  ( kakkun61
  , syocy
  , osanai
  ) where

import Data (Author (Author, name, twitter))

kakkun61 :: Author
kakkun61 = Author { name = "岡本和樹" , twitter = Just "kakkun61" }

syocy :: Author
syocy = Author { name = "syocy", twitter = Just "syocy" }

osanai :: Author
osanai = Author { name = "小山内一由", twitter = Nothing}
