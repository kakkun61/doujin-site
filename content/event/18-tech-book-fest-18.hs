{-# LANGUAGE OverloadedStrings #-}

import           Data
import qualified Event
import qualified Layout      as L
import qualified Publication
import qualified Site

import qualified Data.Map.Strict as M
import           Lucid

render path = do
  L.top (Event.title event <> " | " <> Site.name) (L.ogp ogp) $ L.event event books Nothing
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
    event = Event.techBookFest18
    Just books = M.lookup event Publication.books

main = undefined
