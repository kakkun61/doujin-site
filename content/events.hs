{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}

{-# LANGUAGE NamedFieldPuns        #-}

import           Data
import qualified Layout as L
import qualified Site

import qualified Data.Foldable   as F
import qualified Data.Map.Strict as M
import           Data.Maybe
import           Lucid
import qualified Publication

render (path, events) =
  L.top
    ("イベント | " <> Site.name)
    (L.ogp ogp)
    $ div_ [class_ "home"] $ do
        ul_ [class_ "event-list"] $ do
          F.for_ events $ \(event@Event { title, date }, path) -> do
            let books = fromMaybe [] $ M.lookup event Publication.books
            li_ $ do
              h3_ $ a_ [class_ "post-link", href_ path] $ toHtml title
              p_ $ toHtml date
              div_ $ do
                ul_ [] $ do
                  F.for_ books $ \Book { title, id } -> do
                    li_ $ a_ [href_ $ "/" <> id <> ".html"] $ toHtml title
                    " "
  where
    ogp =
      Ogp
        Site.name
        Website
        (Site.url <> "/favicon.ico")
        (Site.url <> "/" <> path)
        Nothing
        (Just "ja_JP")

main = undefined
