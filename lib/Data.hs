{-# LANGUAGE DuplicateRecordFields #-}

module Data
  ( Book (..)
  , Event (..)
  , Author (..)
  , Price (..)
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
