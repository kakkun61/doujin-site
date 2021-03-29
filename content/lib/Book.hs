{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}

module Book
  ( Book (..)
  , introductionYesod1
  , introductionYesod
  , proceduralHaskell
  , introductionYesodCommercial
  , typeReconstruction
  ) where

import qualified Author
import           Data
import qualified Data.List as L

books :: [Book]
books =
  [ introductionYesod1
  , introductionYesod
  , proceduralHaskell
  , introductionYesodCommercial
  , typeReconstruction
  ]

introductionYesod1 :: Book
introductionYesod1 =
  Book
    { title = "遠回りして学ぶ Yesod 入門（上）"
    , id = "introduction-yesod-1"
    , image = "/introduction-yesod-1-front.png"
    , description = "入門書程度の内容の Haskell を理解した人がウェブアプリケーションを作れるようになる手助けをする本です。"
    , authors = [Author.kakkun61]
    , price = Price (Just 1000) (Just 800) Nothing Nothing (Just 1000)
    , sample = Nothing
    , onlineSell = Nothing
    }

introductionYesod :: Book
introductionYesod =
  Book
    { title = "遠回りして学ぶ Yesod 入門"
    , id = "introduction-yesod"
    , image = "/introduction-yesod-front.png"
    , description = "入門書程度の内容の Haskell を理解した人がウェブアプリケーションフレームワーク Yesod を使うときに手助けになるような内容です。"
    , authors = [Author.kakkun61, Author.syocy]
    , price = Price (Just 1000) (Just 800) Nothing Nothing (Just 1000)
    , sample = Nothing
    , onlineSell = Nothing
    }

proceduralHaskell :: Book
proceduralHaskell =
  Book
    { title = "手続き Haskell"
    , id = "procedural-haskell"
    , image = "/procedural-haskell.jpg"
    , description = "Haskell の手続きプログラミングの側面について解説した本です。"
    , authors = [Author.kakkun61]
    , price = Price (Just 500) (Just 300) Nothing Nothing (Just 500)
    , sample = Nothing
    , onlineSell = Just "https://kakkun61.booth.pm/items/829369"
    }

introductionYesodCommercial :: Book
introductionYesodCommercial =
  Book
    { title = "Haskell で作る Web アプリケーション"
    , id = "introduction-yesod-commercial"
    , image = "/introduction-yesod-commercial.jpg"
    , description = "入門書程度の内容の Haskell を理解した人がウェブアプリケーションフレームワーク Yesod を使うときに手助けになるような内容です。"
    , authors = [Author.kakkun61, Author.osanai]
    , price = Price (Just 1500) (Just 500) (Just 1800) Nothing (Just 1600)
    , sample = Nothing
    , onlineSell = Just "https://nextpublishing.jp/book/9979.html"
    }

typeReconstruction :: Book
typeReconstruction =
  Book
    { title = "俺々言語にだって型推論が欲しい！"
    , id = "type-reconstruction"
    , image = "/type-reconstruction.png"
    , description = "型推論器の作り方について解説した本です。"
    , authors = [Author.kakkun61, Author.syocy]
    , price = Price (Just 500) (Just 300) Nothing Nothing (Just 500)
    , sample = Nothing
    , onlineSell = Just "https://kakkun61.booth.pm/items/1317485"
    }

instance Ord Book where
  compare a b =
    case (L.elemIndex a books, L.elemIndex b books) of
      (Just i, Just j) -> compare i j
      _                -> error $ show a ++ ", " ++ show b
