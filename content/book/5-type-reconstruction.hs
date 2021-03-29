{-# LANGUAGE OverloadedStrings #-}

import qualified Book
import           Data
import qualified Data.Map.Strict as M
import qualified Layout          as L
import qualified Publication
import qualified Site

import Lucid

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
    book = Book.typeReconstruction
    Just events = M.lookup book Publication.events
    content = do
      h2_ "対象読者"
      ul_ $ do
        li_ "⾃作⾔語に型推論を組み込んでみたい⽅"
        li_ "型推論のある⾔語を使っているが、いまいちしくみが分からない⽅"

      h2_ "書かれてあること"
      ul_ $ do
        li_ "型推論器の実装⽅法"

main = undefined
