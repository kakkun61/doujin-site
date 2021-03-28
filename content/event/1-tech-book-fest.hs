{-# LANGUAGE OverloadedStrings #-}

import           Data
import qualified Event
import qualified Layout      as L
import qualified Publication
import qualified Site

import qualified Data.Map.Strict as M
import           Lucid

render path = do
  L.top (L.ogp ogp) $ L.event event books (Just content)
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
    event = Event.techBookFest
    Just books = M.lookup event Publication.books
    content = do
      "インプレス R&D よりネクストパブリッシングで商業化されました。"
      a_ [href_ "/introduction-yesod-commercial.html"] "商業版"

main = undefined
