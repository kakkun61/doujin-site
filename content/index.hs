{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns        #-}
{-# LANGUAGE OverloadedStrings     #-}

import           Data
import qualified Layout as L

import Data.Foldable as F
import Lucid

render (path, books) =
  L.top
    (L.ogp ogp)
    $ div_ [class_ "home"] $ do
        ul_ [class_ "book-list"] $ do
          F.for_ books $ \(Book { title, bookImage, events }, path) -> do
            li_ $ do
              h3_ $
                a_ [class_ "post-link", href_ path] $ toHtml title
              div_ [class_ "justify-bottom"] $ do
                ul_ [class_ "event-badges"] $ do
                  F.for_ events $ \Event { title } -> do
                    li_ [class_ "event-badge"] $ toHtml title
                    " "
                a_ [href_ path] $ img_ [src_ bookImage, alt_ "book image", class_ "home-book-front"]
  where
    ogp =
      Ogp
        L.siteName
        Website
        (L.siteUrl <> "/favicon.ico")
        (L.siteUrl <> "/" <> path)
        Nothing
        (Just "ja_JP")

main = undefined
