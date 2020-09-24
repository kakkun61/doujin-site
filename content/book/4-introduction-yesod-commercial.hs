{-# LANGUAGE OverloadedStrings #-}

import           Data
import qualified Layout as L

import Lucid

render _ = do
  L.top $ L.book book (Just content)
  pure book
  where
    book =
      Book
        "Haskell で作る Web アプリケーション"
        "/introduction-yesod-commercial.jpg"
        "入門書程度の内容の Haskell を理解した人がウェブアプリケーションフレームワーク Yesod を使うときに手助けになるような内容です。"
        events
        authors
        price
        Nothing
        (Just "https://nextpublishing.jp/book/9979.html")
    events =
      [ Event "技術書典 5" "2019.10.08" "池袋サンシャインシティ" "か61"
      , Event "技術書典 6" "2019.04.14" "池袋サンシャインシティ" "こ13"
      ]
    authors =
      [ Author "岡本和樹" $ Just "kakkun61"
      , Author "小山内一由" Nothing
      ]
    price = Price (Just 1500) (Just 500) (Just 1800) Nothing (Just 1600)
    content = "インプレス R&D よりネクストパブリッシングで商業化されました。"

main = undefined
