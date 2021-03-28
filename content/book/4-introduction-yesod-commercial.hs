{-# LANGUAGE OverloadedStrings #-}

import qualified Book
import           Data
import qualified Data.Map.Strict as M
import qualified Layout          as L
import qualified Publication
import qualified Site

import Lucid

render path = do
  L.top (L.ogp ogp) $ L.book book events (Just content)
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
    book = Book.introductionYesodCommercial
    Just events = M.lookup book Publication.events
    content = "インプレス R&D よりネクストパブリッシングで商業化されました。"

main = undefined
