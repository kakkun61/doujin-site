{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DerivingStrategies    #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Data
  ( Book (..)
  , Event (..)
  , Author (..)
  , Ogp (..)
  , OgpType (..)
  , Path (..)
  , Url (..)
  , ActivityPubUser (..)
  ) where

import Data.Binary   (Binary)
import Data.Hashable (Hashable)
import Data.Text     (Text)
import GHC.Generics  (Generic)
import Data.String (IsString)
import qualified Lucid

data Book =
  Book
    { title       :: Text
    , id          :: Text
    , image       :: Path
    , description :: Text
    , authors     :: [Author]
    , prices      :: [(Text, Word)]
    , buttonLinks :: [(Text, Url)]
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
    , circleCut :: Maybe Path
    , url       :: Url
    , circleUrl :: Url
    }
  deriving stock (Show, Eq, Generic)

instance Binary Event

instance Hashable Event

data Author =
  Author
    { name        :: Text
    , twitter     :: Maybe Text
    , activityPub :: Maybe ActivityPubUser
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

newtype Path =
  Path { unPath :: Text }
  deriving stock (Show, Eq, Generic)
  deriving newtype (IsString, Lucid.ToHtml)

instance Binary Path

instance Hashable Path

newtype Url =
  Url { unUrl :: Text }
  deriving stock (Show, Eq, Generic)
  deriving newtype (IsString, Lucid.ToHtml)

instance Binary Url

instance Hashable Url

data ActivityPubUser =
  ActivityPubUser { user :: Text, server :: Text }
  deriving stock (Show, Eq, Ord, Generic)

instance Binary ActivityPubUser

instance Hashable ActivityPubUser
