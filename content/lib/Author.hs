{-# LANGUAGE OverloadedStrings #-}

module Author
  ( kakkun61
  , syocy
  , osanai
  ) where

import Data (Author (..), ActivityPubUser (..))

kakkun61 :: Author
kakkun61 =
  Author
    { name = "岡本和樹"
    , twitter = Just "kakkun61"
    , activityPub = Just $ ActivityPubUser "kakkun61" "pawoo.net"
    }

syocy :: Author
syocy =
  Author
    { name = "syocy"
    , twitter = Just "syocy"
    , activityPub = Nothing
    }

osanai :: Author
osanai =
  Author
    { name = "小山内一由"
    , twitter = Nothing
    , activityPub = Nothing
    }
