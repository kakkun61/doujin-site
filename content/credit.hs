{-# LANGUAGE OverloadedStrings #-}

import           Data
import qualified Layout as L
import qualified Site

import Lucid

render path =
  L.top (title <> " | " <> Site.name) (L.ogp ogp) $ L.page title content
  where
    ogp =
      Ogp
        title
        Article
        (Site.url <> "/favicon.ico")
        (Site.url <> "/" <> path)
        Nothing
        (Just "ja_JP")
    title = "オープンソースライブラリー"
    content = do
      h2_ "minima"
      pre_ [style_ "overflow: scroll;"]
        "The MIT License (MIT)\
        \\n\
        \Copyright (c) 2016-present Parker Moore and the minima contributors\n\
        \\n\
        \Permission is hereby granted, free of charge, to any person obtaining a copy\n\
        \of this software and associated documentation files (the \"Software\"), to deal\n\
        \in the Software without restriction, including without limitation the rights\n\
        \to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\n\
        \copies of the Software, and to permit persons to whom the Software is\n\
        \furnished to do so, subject to the following conditions:\n\
        \\n\
        \The above copyright notice and this permission notice shall be included in\n\
        \all copies or substantial portions of the Software.\n\
        \\n\
        \THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\n\
        \IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\n\
        \FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\n\
        \AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\n\
        \LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\n\
        \OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN\n\
        \THE SOFTWARE."

main = undefined
