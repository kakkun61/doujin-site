{-# LANGUAGE DuplicateRecordFields #-}

module Data
  ( Book (..)
  , Event (..)
  , Author (..)
  , Price (..)
  , Ogp (..)
  , OgpType (..)
  ) where

import Data.Text (Text)

data Book =
  Book
    { title       :: Text
    , bookImage   :: Text
    , description :: Text
    , events      :: [Event]
    , authors     :: [Author]
    , price       :: Price
    , sample      :: Maybe Text
    , onlineSell  :: Maybe Text
    }
  deriving Show

data Event =
  Event
    { title :: Text
    , date  :: Text
    , place :: Text
    , table :: Text
    }
  deriving Show

data Author =
  Author
    { name    :: Text
    , twitter :: Maybe String
    }
  deriving Show

data Price =
  Price
    { eventPaper  :: Maybe Word
    , eventEbook  :: Maybe Word
    , onlinePaperOnly :: Maybe Word
    , onlinePaper :: Maybe Word
    , onlineEbook :: Maybe Word
    }
  deriving Show

-- https://ogp.me/
data Ogp =
  Ogp
    { title :: Text
    , typ :: OgpType
    , image :: Text
    , url :: Text
    , description :: Maybe Text
    , locale :: Maybe Text
    }
  deriving Show

data OgpType
  = Website
  | Article

instance Show OgpType where
  show Website = "website"
  show Article = "article"
