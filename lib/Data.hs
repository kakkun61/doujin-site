{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingStrategies    #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Data
  ( Book (..)
  , Event (..)
  , Author (..)
  , Ogp (..)
  , OgpType (..)
  ) where

import Data.Binary   (Binary)
import Data.Hashable (Hashable)
import Data.Text     (Text)
import GHC.Generics  (Generic)

data Book =
  Book
    { title       :: Text
    , id          :: Text
    , image       :: Text
    , description :: Text
    , authors     :: [Author]
    , prices      :: [(Text, Word)]
    , buttonLinks :: [(Text, Text)]
    }
  deriving stock (Show, Eq, Generic)

instance Binary Book

instance Hashable Book

data Event =
  Event
    { title     :: Text
    , id        :: Text
    , date      :: Text
    , place     :: Text
    , table     :: Text
    , circleCut :: Maybe Text
    , url       :: Text
    , circleUrl :: Text
    }
  deriving stock (Show, Eq, Generic)

instance Binary Event

instance Hashable Event

data Author =
  Author
    { name    :: Text
    , twitter :: Maybe String
    }
  deriving stock (Show, Eq, Ord, Generic)

instance Binary Author

instance Hashable Author

-- https://ogp.me/
data Ogp =
  Ogp
    { title       :: Text
    , typ         :: OgpType
    , image       :: Text
    , url         :: Text
    , description :: Maybe Text
    , locale      :: Maybe Text
    }
  deriving Show

data OgpType
  = Website
  | Article

instance Show OgpType where
  show Website = "website"
  show Article = "article"
