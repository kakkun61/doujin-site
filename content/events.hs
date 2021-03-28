{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}

{-# LANGUAGE NamedFieldPuns        #-}

import           Data
import qualified Layout as L
import qualified Site

import qualified Data.Foldable   as F
import qualified Data.Map.Strict as M
import           Lucid
import qualified Publication

render (path, events) =
  L.top
    (L.ogp ogp)
    $ div_ [class_ "home"] $ do
        ul_ [class_ "event-list"] $ do
          F.for_ events $ \(event@Event { title }, path) -> do
            let Just books = M.lookup event Publication.books
            li_ $ do
              h3_ $
                a_ [class_ "post-link", href_ path] $ toHtml title
              div_ [class_ "justify-bottom"] $ do
                ul_ [] $ do
                  F.for_ books $ \Book { title } -> do
                    li_ [] $ toHtml title
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
