{-# LANGUAGE OverloadedStrings #-}

import           Data
import qualified Layout as L

import Lucid

render path = do
  L.top (L.ogp ogp) $ L.book book (Just content)
  pure book
  where
    ogp =
      Ogp
        title
        Article
        (L.siteUrl <> image)
        (L.siteUrl <> "/" <> path)
        (Just description)
        (Just "ja_JP")
    book =
      Book
        title
        image
        description
        events
        authors
        price
        Nothing
        (Just "https://kakkun61.booth.pm/items/829369")
    title = "手続き Haskell"
    image = "/procedural-haskell.jpg"
    description = "Haskell の手続きプログラミングの側面について解説した本です。"
    events =
      [ Event "技術書典 4" "2018.04.22" "アキバスクエア" "き34"
      , Event "技術書典 5" "2019.10.08" "池袋サンシャインシティ" "か61"
      , Event "技術書典 6" "2019.04.14" "池袋サンシャインシティ" "こ13"
      , Event "技術書典 7" "2019.09.22" "池袋サンシャインシティ" "し02D"
      ]
    authors = [Author "岡本和樹" $ Just "kakkun61"]
    price = Price (Just 500) (Just 300) Nothing Nothing (Just 500)
    content = do
      h2_ "対象読者"
      ul_ $ do
        li_ $ do
          "Haskell 入門書程度が読める"
          ul_ $ do
            li_ "特に読めるが書こうとすると悩む人に読んでほしいです"
        li_ $ do
          "手続きプログラミングのプログラマー"
          ul_ $ do
            li_ "厳密に本書を読むためには Haskell を読めた方がよいですが、手続きプログラミングですのでプログラマーなら雰囲気で読めると思います"

      h2_ "書かれてあること"
      ul_ $ do
        li_ "書き換え可能な変数"
        li_ "手続きプログラミング的な制御構造"
        li_ "配列"
        li_ $ do
          "サンプルプログラム"
          ul_ $ do
            li_ "手続き的な実装と Haskell 的な実装の対比"

main = undefined
