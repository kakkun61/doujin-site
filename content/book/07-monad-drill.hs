{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Book
import           Data
import qualified Data.Map.Strict as M
import qualified Layout          as L
import qualified Publication
import qualified Site

import Data.Text (Text)
import Lucid

render :: Text -> Html Book
render path = do
  L.top (Book.title book <> " | " <> Site.name) (L.ogp ogp) $ L.book book events (Just content)
  pure book
  where
    ogp =
      Ogp
        (Book.title book)
        Article
        (Site.url <> Book.image book)
        (Site.url <> "/" <> path)
        (Just $ Book.description book)
        (Just "ja_JP")
    book = Book.monadDrill
    Just events = M.lookup book Publication.events
    content = do
      let supportPageUrl = "https://scrapbox.io/kakkun61-scraps/%E3%83%A2%E3%83%8A%E3%83%89%E3%83%89%E3%83%AA%E3%83%AB_%E3%82%B5%E3%83%9D%E3%83%BC%E3%83%88%E3%83%9A%E3%83%BC%E3%82%B8"
      p_ $ a_ [href_ supportPageUrl] "サポートページ"

main = undefined
