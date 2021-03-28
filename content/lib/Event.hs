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

import Data

techBookFest :: Event
techBookFest =
  Event
    { title = "技術書典"
    , date = "2016.06.25"
    , place = "秋葉原通運会館"
    , table = "A-34"
    }

comicMarket91 :: Event
comicMarket91 =
  Event
    { title = "C91"
    , date = "2016.12.29"
    , place = "東京ビッグサイト"
    , table = "西み-26a"
    }

techBookFest2 :: Event
techBookFest2 =
  Event
    { title = "技術書典 2"
    , date = "2017.04.09"
    , place = "アキバスクエア"
    , table = "う-04"
    }

techBookFest4 :: Event
techBookFest4 =
  Event
    { title = "技術書典 4"
    , date = "2018.04.22"
    , place = "アキバスクエア"
    , table = "き34"
    }

techBookFest5 :: Event
techBookFest5 =
  Event
    { title = "技術書典 5"
    , date = "2019.10.08"
    , place = "池袋サンシャインシティ"
    , table = "か61"
    }

techBookFest6 :: Event
techBookFest6 =
  Event
    { title = "技術書典 6"
    , date = "2019.04.14"
    , place = "池袋サンシャインシティ"
    , table = "こ13"
    }

techBookFest7 :: Event
techBookFest7 =
  Event
    { title = "技術書典 7"
    , date = "2019.09.22"
    , place = "池袋サンシャインシティ"
    , table = "し02D"
    }
