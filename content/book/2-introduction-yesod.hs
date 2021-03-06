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
        Nothing
    title = "遠回りして学ぶ Yesod 入門"
    image = "/introduction-yesod-front.png"
    description = "入門書程度の内容の Haskell を理解した人がウェブアプリケーションフレームワーク Yesod を使うときに手助けになるような内容です。"
    events =
      [ Event "C91" "2016.12.29" "東京ビッグサイト" "西み-26a"
      , Event "技術書典 2" "2017.04.09" "アキバスクエア" "う-04"
      , Event "技術書典 4" "2018.04.22" "アキバスクエア" "き34"
      ]
    authors =
      [ Author "岡本和樹" $ Just "kakkun61"
      , Author "syocy" $ Just "syocy"
      ]
    price = Price (Just 1000) (Just 800) Nothing Nothing (Just 1000)
    content = do
      "インプレス R&D よりネクストパブリッシングで商業化されました。"
      a_ [href_ "/introduction-yesod-commercial.html"] "商業版"

main = undefined
