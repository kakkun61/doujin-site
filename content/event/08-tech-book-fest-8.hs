{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Data
import qualified Event
import qualified Layout      as L
import qualified Publication
import qualified Site

import qualified Data.Map.Strict as M
import           Data.Text       (Text)
import           Lucid

render :: Text -> Html Event
render path = do
  L.top (Event.title event <> " | " <> Site.name) (L.ogp ogp) $ L.event event [] $ Just $ p_ "中止になりました"
  pure event
  where
    ogp =
      Ogp
        (Event.title event)
        Article
        (Site.url <> "/favicon.ico")
        (Site.url <> "/" <> path)
        Nothing
        (Just "ja_JP")
    event = Event.techBookFest8

main = undefined
