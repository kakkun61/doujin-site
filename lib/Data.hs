{-# LANGUAGE DuplicateRecordFields #-}

module Data
  ( Book (..)
  , Event (..)
  , Author (..)
  , Ogp (..)
  , OgpType (..)
  ) where

import Data.Text (Text)

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
  deriving (Show, Eq)

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
  deriving (Show, Eq)

data Author =
  Author
    { name    :: Text
    , twitter :: Maybe String
    }
  deriving (Show, Eq, Ord)

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
