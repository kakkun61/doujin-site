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
        "俺々言語にだって型推論が欲しい！"
        "/type-reconstruction.png"
        "型推論器の作り方について解説した本です。"
        events
        authors
        price
        Nothing
        (Just "https://kakkun61.booth.pm/items/1317485")
    events =
      [Event "技術書典 6" "2019.04.14" "池袋サンシャインシティ" "こ13"
      , Event "技術書典 7" "2019.09.22" "池袋サンシャインシティ" "し02D"
      ]
    authors = [Author "岡本和樹" $ Just "kakkun61"]
    price = Price (Just 500) (Just 300) Nothing Nothing (Just 500)
    content = do
      h2_ "対象読者"
      ul_ $ do
        li_ "⾃作⾔語に型推論を組み込んでみたい⽅"
        li_ "型推論のある⾔語を使っているが、いまいちしくみが分からない⽅"

      h2_ "書かれてあること"
      ul_ $ do
        li_ "型推論器の実装⽅法"

main = undefined
