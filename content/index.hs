{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns        #-}
{-# LANGUAGE OverloadedStrings     #-}

import           Data
import qualified Layout      as L
import qualified Publication
import qualified Site

import           Data.Foldable   as F
import qualified Data.Map.Strict as M
import           Lucid

render (path, books) =
  L.top
    Site.name
    (L.ogp ogp)
    $ div_ [class_ "home"] $ do
        ul_ [class_ "book-list"] $ do
          F.for_ books $ \(book@Book { title, image }, path) -> do
            li_ $ do
              h3_ $ a_ [class_ "post-link", href_ path] $ toHtml title
              div_ [class_ "justify-bottom"] $ do
                let Just (Event { id, title } : _) = M.lookup book Publication.events
                p_ $ span_ [class_ "event-badge"] $ a_ [href_ $ "/" <> id <> ".html"] $ toHtml title
                a_ [href_ path] $ img_ [src_ image, alt_ "book image", class_ "home-book-front"]
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
