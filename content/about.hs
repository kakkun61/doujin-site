{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}

import           Data
import qualified Layout as L
import qualified Site

import Lucid

render path =
  L.top (L.ogp ogp) $ L.page title content
  where
    ogp =
      Ogp
        title
        Article
        (Site.url <> "/favicon.ico")
        (Site.url <> "/" <> path)
        Nothing
        (Just "ja_JP")
    title = "「趣味はデバッグ……」とは"
    content = do
      p_ "岡本和樹の主宰する同人サークルで、Haskell の技術書を技術書典に向けて制作しています。"
      h2_ "参加したことのあるメンバー"
      ul_ $ do
        li_ $ do
          "岡本和樹 "
          a_ [href_ "https://twitter.com/kakkun61"] $ do
            span_ [class_ "twitter-icon"] ""
            "@kakkun61"
        li_ $ do
          "syocy "
          a_ [href_ "https://twitter.com/syocy"] $ do
            span_ [class_ "twitter-icon"] ""
            "@syocy"

main = undefined
