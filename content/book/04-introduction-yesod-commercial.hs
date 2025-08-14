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
    book = Book.introductionYesodCommercial
    Just events = M.lookup book Publication.events
    content = "インプレス R&D よりネクストパブリッシングで商業化されました。"

main = undefined
