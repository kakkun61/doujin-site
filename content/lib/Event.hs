{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}

module Event
  ( Event (..)
  , techBookFest
  , comicMarket91
  , techBookFest2
  , techBookFest4
  , techBookFest5
  , techBookFest6
  , techBookFest7
  ) where

import           Data
import qualified Data.List as L

events :: [Event]
events =
  [ techBookFest
  , comicMarket91
  , techBookFest2
  , techBookFest4
  , techBookFest5
  , techBookFest6
  , techBookFest7
  ]

techBookFest :: Event
techBookFest =
  Event
    { title = "技術書典"
    , id = "tech-book-fest"
    , date = "2016.06.25"
    , place = "秋葉原通運会館"
    , table = "A-34"
    , circleCut = "/circle-cut-1.png"
    , url = "https://techbookfest.org/tbf01/"
    , circleUrl = "https://techbookfest.org/tbf01/#A-34"
    }

comicMarket91 :: Event
comicMarket91 =
  Event
    { title = "コミックマーケット 91"
    , id = "comic-market-91"
    , date = "2016.12.29"
    , place = "東京ビッグサイト"
    , table = "西み-26a"
    , circleCut = "/circle-cut-2.png"
    , url = "https://www.comiket.co.jp/info-a/C91/C91info.html"
    , circleUrl = "https://webcatalog-auth.circle.ms/Perma/Circle/10364927/130"
    }

techBookFest2 :: Event
techBookFest2 =
  Event
    { title = "技術書典 2"
    , id = "tech-book-fest-2"
    , date = "2017.04.09"
    , place = "アキバスクエア"
    , table = "う-04"
    , circleCut = "/circle-cut-2.png"
    , url = "https://techbookfest.org/event/tbf02"
    , circleUrl = "https://techbookfest.org/event/tbf02/circle/5096012251136000"
    }

techBookFest4 :: Event
techBookFest4 =
  Event
    { title = "技術書典 4"
    , id = "tech-book-fest-4"
    , date = "2018.04.22"
    , place = "アキバスクエア"
    , table = "き34"
    , circleCut = "/circle-cut-2.png"
    , url = "https://techbookfest.org/event/tbf04"
    , circleUrl = "https://techbookfest.org/event/tbf04/circle/13790002"
    }

techBookFest5 :: Event
techBookFest5 =
  Event
    { title = "技術書典 5"
    , id = "tech-book-fest-5"
    , date = "2019.10.08"
    , place = "池袋サンシャインシティ"
    , table = "か61"
    , circleCut = "/circle-cut-2.png"
    , url = "https://techbookfest.org/event/tbf05"
    , circleUrl = "https://techbookfest.org/event/tbf05/circle/45000003"
    }

techBookFest6 :: Event
techBookFest6 =
  Event
    { title = "技術書典 6"
    , id = "tech-book-fest-6"
    , date = "2019.04.14"
    , place = "池袋サンシャインシティ"
    , table = "こ13"
    , circleCut = "/circle-cut-3.png"
    , url = "https://techbookfest.org/event/tbf06"
    , circleUrl = "https://techbookfest.org/event/tbf06/circle/46330001"
    }

techBookFest7 :: Event
techBookFest7 =
  Event
    { title = "技術書典 7"
    , id = "tech-book-fest-7"
    , date = "2019.09.22"
    , place = "池袋サンシャインシティ"
    , table = "し02D"
    , circleCut = "/circle-cut-3.png"
    , url = "https://techbookfest.org/event/tbf07"
    , circleUrl = "https://techbookfest.org/event/tbf07/circle/5662395955412992"
    }

instance Ord Event where
  compare a b =
    case (L.elemIndex a events, L.elemIndex b events) of
      (Just i, Just j) -> compare i j
      _                -> error $ show a ++ ", " ++ show b
