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
  , techBookFest8
  , techBookFest9
  , techBookFest10
  , techBookFest14
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
  , techBookFest8
  , techBookFest9
  , techBookFest10
  , techBookFest14
  ]

techBookFest :: Event
techBookFest =
  Event
    { title = "技術書典"
    , id = "tech-book-fest"
    , date = "2016.06.25"
    , place = "秋葉原通運会館"
    , table = "A-34"
    , circleCut = Just "/circle-cut-1.png"
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
    , circleCut = Just "/circle-cut-2.png"
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
    , circleCut = Just "/circle-cut-2.png"
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
    , circleCut = Just "/circle-cut-2.png"
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
    , circleCut = Just "/circle-cut-2.png"
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
    , circleCut = Just "/circle-cut-3.png"
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
    , circleCut = Just "/circle-cut-3.png"
    , url = "https://techbookfest.org/event/tbf07"
    , circleUrl = "https://techbookfest.org/event/tbf07/circle/5662395955412992"
    }

techBookFest8 :: Event
techBookFest8 =
  Event
    { title = "技術書典 8"
    , id = "tech-book-fest-8"
    , date = "2020.02.29-2020.03.01"
    , place = "池袋サンシャインシティ"
    , table = "1日め お35"
    , circleCut = Just "/circle-cut-4.png"
    , url = "https://techbookfest.org/event/tbf08"
    , circleUrl = "https://techbookfest.org/event/tbf08/circle/5160117913780224"
    }

techBookFest9 :: Event
techBookFest9 =
  Event
    { title = "技術書典 9"
    , id = "tech-book-fest-9"
    , date = "2020.09.12-2020.12.22"
    , place = "オンライン"
    , table = "ネットの海 ecbf"
    , circleCut = Nothing
    , url = "https://techbookfest.org/event/tbf09"
    , circleUrl = "https://techbookfest.org/event/tbf09/circle/5688509568385024"
    }

techBookFest10 :: Event
techBookFest10 =
  Event
    { title = "技術書典 10"
    , id = "tech-book-fest-10"
    , date = "2020.12.26-2021.01.06"
    , place = "オンライン"
    , table = "ネットの海 721a"
    , circleCut = Nothing
    , url = "https://techbookfest.org/event/tbf10"
    , circleUrl = "https://techbookfest.org/event/tbf10/circle/5156076934660096"
    }

techBookFest14 :: Event
techBookFest14 =
  Event
    { title = "技術書典 14"
    , id = "tech-book-fest-14"
    , date = "2023.05.21"
    , place = "池袋サンシャインシティ"
    , table = "お03"
    , circleCut = Nothing
    , url = "https://techbookfest.org/event/tbf14"
    , circleUrl = "https://techbookfest.org/organization/5658962204557312"
    }

instance Ord Event where
  compare a b =
    case (L.elemIndex a events, L.elemIndex b events) of
      (Just i, Just j) -> compare i j
      (Nothing, _)     -> error $ "compare: an event is not contained by 'events': " ++ show a
      (_, Nothing)     -> error $ "compare: an event is not contained by 'events': " ++ show b
