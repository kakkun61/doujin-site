{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}

module Book
  ( Book (..)
  , introductionYesod1
  , introductionYesod
  , proceduralHaskell
  , introductionYesodCommercial
  , typeReconstruction
  , darkRoomPrinting
  , monadDrill
  ) where

import qualified Author
import           Data
import qualified Data.List as L
import           Data.Text (Text)

books :: [Book]
books =
  [ introductionYesod1
  , introductionYesod
  , proceduralHaskell
  , introductionYesodCommercial
  , typeReconstruction
  , darkRoomPrinting
  , monadDrill
  ]

introductionYesod1 :: Book
introductionYesod1 =
  Book
    { title = "遠回りして学ぶ Yesod 入門（上）"
    , id = "introduction-yesod-1"
    , image = "/introduction-yesod-1-front.png"
    , description = "入門書程度の内容の Haskell を理解した人がウェブアプリケーションを作れるようになる手助けをする本です。"
    , authors = [Author.kakkun61]
    , prices =
        [ eventPaperPrice 1000
        , eventEbookPrice 800
        , onlineEbookPrice 1000
        ]
    , buttonLinks = []
    }

introductionYesod :: Book
introductionYesod =
  Book
    { title = "遠回りして学ぶ Yesod 入門"
    , id = "introduction-yesod"
    , image = "/introduction-yesod-front.png"
    , description = "入門書程度の内容の Haskell を理解した人がウェブアプリケーションフレームワーク Yesod を使うときに手助けになるような内容です。"
    , authors = [Author.kakkun61, Author.syocy]
    , prices =
        [ eventPaperPrice 1000
        , eventEbookPrice 800
        , onlineEbookPrice 1000
        ]
    , buttonLinks = []
    }

proceduralHaskell :: Book
proceduralHaskell =
  Book
    { title = "手続き Haskell"
    , id = "procedural-haskell"
    , image = "/procedural-haskell.jpg"
    , description = "Haskell の手続きプログラミングの側面について解説した本です。"
    , authors = [Author.kakkun61]
    , prices =
        [ eventPaperPrice 500
        , eventEbookPrice 300
        , onlineEbookPrice 500
        ]
    , buttonLinks =
        [ techBookFestSellButtonLink "https://techbookfest.org/product/6046480204824576"
        , boothSellButtonLink "https://kakkun61.booth.pm/items/829369"
        ]
    }

introductionYesodCommercial :: Book
introductionYesodCommercial =
  Book
    { title = "Haskell で作る Web アプリケーション"
    , id = "introduction-yesod-commercial"
    , image = "/introduction-yesod-commercial.jpg"
    , description = "入門書程度の内容の Haskell を理解した人がウェブアプリケーションフレームワーク Yesod を使うときに手助けになるような内容です。"
    , authors = [Author.kakkun61, Author.osanai]
    , prices =
        [ eventPaperPrice 1500
        , eventEbookPrice 500
        , onlinePaperOnlyPrice 1800
        , onlineEbookPrice 1600
        ]
    , buttonLinks = [onlineSellButtonLink "https://nextpublishing.jp/book/9979.html"]
    }

typeReconstruction :: Book
typeReconstruction =
  Book
    { title = "俺々言語にだって型推論が欲しい！"
    , id = "type-reconstruction"
    , image = "/type-reconstruction.png"
    , description = "型推論器の作り方について解説した本です。"
    , authors = [Author.kakkun61, Author.syocy]
    , prices =
        [ eventPaperPrice 500
        , eventEbookPrice 300
        , onlineEbookPrice 500
        ]
    , buttonLinks =
        [ techBookFestSellButtonLink "https://techbookfest.org/product/5189254728646656"
        , boothSellButtonLink "https://kakkun61.booth.pm/items/1317485"
        ]
    }

darkRoomPrinting :: Book
darkRoomPrinting =
  Book
    { title = "令和白黒写真暗室印刷"
    , id = "dark-room-printing"
    , image = "/dark-room-printing.jpg"
    , description = "令和の時代に暗室を作って白黒フィルム写真を印刷するにはどうするのか。"
    , authors = [Author.kakkun61]
    , prices =
        [ eventPaperPrice 500
        , eventEbookPrice 300
        , onlineEbookPrice 500
        ]
    , buttonLinks = [onlineSellButtonLink "https://techbookfest.org/product/8VwMyT5QgmfkGvdAYWuRhJ"]
    }

monadDrill :: Book
monadDrill =
  Book
    { title = "モナドドリル"
    , id = "monad-drill"
    , image = "/monad-drill.jpg"
    , description = "モナドの読解力と利用力がつく！"
    , authors = [Author.kakkun61]
    , prices =
        [ eventPaperPrice 1000
        , eventEbookPrice 500
        , onlinePaperPrice 1200
        , onlineEbookPrice 700
        ]
    , buttonLinks =
        [ techBookFestSellButtonLink "https://techbookfest.org/product/jWEWpVGasBBr1fGYSrA9f8"
        , boothSellButtonLink "https://kakkun61.booth.pm/items/7222359"
        ]
    }

instance Ord Book where
  compare a b =
    case (L.elemIndex a books, L.elemIndex b books) of
      (Just i, Just j) -> compare i j
      _                -> error $ "compare " ++ show a ++ ", " ++ show b

eventPaperPrice :: Word -> (Text, Word)
eventPaperPrice price = ("紙＋電子（即売会）", price)

eventEbookPrice :: Word -> (Text, Word)
eventEbookPrice price = ("電子（即売会）", price)

onlinePaperOnlyPrice :: Word -> (Text, Word)
onlinePaperOnlyPrice price = ("紙（オンライン）", price)

onlinePaperPrice :: Word -> (Text, Word)
onlinePaperPrice price = ("紙＋電子（オンライン）", price)

onlineEbookPrice :: Word -> (Text, Word)
onlineEbookPrice price = ("電子（オンライン）", price)

onlineSellButtonLink :: Url -> (Text, Url)
onlineSellButtonLink url = ("オンライン販売", url)

techBookFestSellButtonLink :: Url -> (Text, Url)
techBookFestSellButtonLink url = ("オンライン販売（技術書典）", url)

boothSellButtonLink :: Url -> (Text, Url)
boothSellButtonLink url = ("オンライン販売（Booth）", url)
