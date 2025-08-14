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
        (Site.url <> unPath (Book.image book))
        (Site.url <> "/" <> path)
        (Just $ Book.description book)
        (Just "ja_JP")
    book = Book.darkRoomPrinting
    Just events = M.lookup book Publication.events
    content = do
      h2_ "対象読者"
      ul_ $ do
        li_ "フィルム写真が好きな方"
        li_ "暗室で何をやっているのか気になる方"

      h2_ "書かれてあること"
      ul_ $ do
        li_ "令和の時代に家で暗室を作って白黒写真を印刷する方法"

main = undefined
