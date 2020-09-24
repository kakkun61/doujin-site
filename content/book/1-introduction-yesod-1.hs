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
        "遠回りして学ぶ Yesod 入門（上）"
        "/introduction-yesod-1-front.png"
        "入門書程度の内容の Haskell を理解した人がウェブアプリケーションを作れるようになる手助けをする本です。"
        events
        authors
        price
        Nothing
        Nothing
    events = [Event "技術書典 1" "2016.06.25" "秋葉原通運会館" "A-34"]
    authors = [Author "岡本和樹" $ Just "kakkun61"]
    price = Price (Just 1000) (Just 800) Nothing Nothing (Just 1000)
    content = do
      "インプレス R&D よりネクストパブリッシングで商業化されました。"
      a_ [href_ "/introduction-yesod-commercial.html"] "商業版"

main = undefined
