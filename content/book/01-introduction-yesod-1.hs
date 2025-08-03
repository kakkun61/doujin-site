{-# LANGUAGE OverloadedStrings #-}

import qualified Book
import           Data
import qualified Event
import qualified Layout      as L
import qualified Publication
import qualified Site

import qualified Data.Map.Strict as M
import           Lucid

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
    book = Book.introductionYesod1
    Just events = M.lookup book Publication.events
    content = do
      "インプレス R&D よりネクストパブリッシングで商業化されました。"
      a_ [href_ "/introduction-yesod-commercial.html"] "商業版"

main = undefined
