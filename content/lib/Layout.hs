{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns        #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE TypeApplications      #-}

module Layout where

import           Data
import qualified Site

import qualified Data.Foldable as F
import           Data.String   (IsString (fromString))
import           Data.Text     (Text)
import           Lucid
import qualified Lucid.Base    as Lucid
import Data.Maybe (fromMaybe)

top :: Text -> Html () -> Html () -> Html ()
top title head content = do
  doctype_
  html_ [lang_ "ja"] $ do
    head_ $ do
      meta_ [charset_ "utf-8"]
      meta_ [name_ "viewport", content_ "width=device-width, initial-scale=1"]
      link_ [rel_ "stylesheet", href_ "/style.css"]
      -- link_ [rel_ "alternate", type_ "application/rss+xml", title_ siteName, href_ "/feed.xml"]
      title_ $ toHtml title
      head
    body_ $ do
      header_ [class_ "site-header", role_ "banner"] $ do
        div_ [class_ "header-wrapper"] $ do
          a_ [class_ "site-title", rel_ "author", href_ "/"] Site.name
          nav_ [class_ "site-nav"] $ do
            input_ [type_ "checkbox", id_ "nav-trigger", class_ "nav-trigger"]
            label_ [for_ "nav-trigger"] $ do
              span_ [class_ "menu-icon"] $ do
                toHtmlRaw @Text $ mconcat
                  [ "<svg viewBox=\"0 0 18 15\" width=\"18px\" height=\"15px\">"
                  , "<path fill=\"#424242\" d=\"M18,1.484c0,0.82-0.665,1.484-1.484,1.484H1.484C0.665,2.969,0,2.304,0,1.484l0,0C0,0.665,0.665,0,1.484,0 h15.031C17.335,0,18,0.665,18,1.484L18,1.484z\"/>"
                  , "<path fill=\"#424242\" d=\"M18,7.516C18,8.335,17.335,9,16.516,9H1.484C0.665,9,0,8.335,0,7.516l0,0c0-0.82,0.665-1.484,1.484-1.484 h15.031C17.335,6.031,18,6.696,18,7.516L18,7.516z\"/>"
                  , "<path fill=\"#424242\" d=\"M18,13.516C18,14.335,17.335,15,16.516,15H1.484C0.665,15,0,14.335,0,13.516l0,0 c0-0.82,0.665-1.484,1.484-1.484h15.031C17.335,12.031,18,12.696,18,13.516L18,13.516z\"/>"
                  , "</svg>"]

            div_ [class_ "trigger"] $ do
              a_ [class_ "page-link", href_ "/events.html"] "イベント"
              a_ [class_ "page-link", href_ "/about.html"] $ "「" <> Site.name <> "」とは"
              -- a_ [class_ "page-link", href_ "/feed.xml"] "RSS"

      main_ [class_ "page-content"] $ do
        div_ [class_ "wrapper"] content

      footer_ $ do
        "Powered by "
        a_ [href_ "https://shakebuild.com"] "Shake"
        ", "
        a_ [href_ "https://hackage.haskell.org/package/lucid"] "Lucid"
        " and "
        a_ [href_ "https://hackage.haskell.org/package/hint"] "Hint"
        " | "
        a_ [href_ "/credit.html"] "OSS"

book :: Book -> [Event] -> Maybe (Html ()) -> Html ()
book Book { title, image, description, authors, price, sample, onlineSell } events content = do
  article_ [class_ "page"] $ do
    div_ $ do
      h1_ [class_ "book-title"] $ toHtml title

      div_ [class_ "book-info"] $ do
        div_ [class_ "book-image"] $ img_ [src_ image, alt_ "book front", class_ "book-front"]

        div_ [class_ "book-detail"] $ do
          p_ $ toHtml description

          div_ [class_ "book-events"] $ do
            F.for_ events $ \Event { title, id, date, place, table } -> do
              span_ [class_ "event-badge"] $ a_ [href_ $ "/" <> id <> ".html"] $ toHtml title
              ul_ $ do
                li_ $ toHtml date
                li_ $ toHtml place
                li_ $ toHtml table

          ul_ [class_ "book-authors"] $ do
            F.for_ authors $ \Author { name, twitter } -> do
              li_ $ do
                toHtml name
                whenJust twitter $ \twitter -> do
                  " "
                  a_ [href_ $ "https://twitter.com/" <> fromString twitter] $ do
                    span_ [class_ "twitter-icon"] ""
                    "@" <> toHtml twitter

          table_ [class_ "book-price"] $ do
            tbody_ $ do
              let Price { eventPaper, eventEbook, onlinePaperOnly, onlinePaper, onlineEbook } = price
              whenJust eventPaper $ \eventPaper ->
                tr_ $ do
                  td_ "紙＋電子（即売会）"
                  td_ [class_ "price"] $ "¥" <> toHtml (show eventPaper)
              whenJust eventEbook $ \eventEbook ->
                tr_ $ do
                  td_ "電子（即売会）"
                  td_ [class_ "price"] $ "¥" <> toHtml (show eventEbook)
              whenJust onlinePaperOnly $ \onlinePaperOnly ->
                tr_ $ do
                  td_ "紙（オンライン）"
                  td_ [class_ "price"] $ "¥" <> toHtml (show onlinePaperOnly)
              whenJust onlinePaper $ \onlinePaper ->
                tr_ $ do
                  td_ "紙＋電子（オンライン）"
                  td_ [class_ "price"] $ "¥" <> toHtml (show onlinePaper)
              whenJust onlineEbook $ \onlineEbook ->
                tr_ $ do
                  td_ "電子（オンライン）"
                  td_ [class_ "price"] $ "¥" <> toHtml (show onlineEbook)

          div_ [class_ "book-actions"] $ do
            whenJust sample $ \sample ->
              a_ [class_ "button", href_ sample] "サンプル PDF"
            whenJust onlineSell $ \onlineSell ->
              a_ [class_ "button", href_ onlineSell] "オンライン販売"

      whenJust content $ \content ->
        div_ [class_ "content"] $ do
          content

event :: Event -> [Book] -> Maybe (Html ()) -> Html ()
event Event { title, date, place, table, circleCut, url, circleUrl } books content = do
  article_ [class_ "page"] $ do
    div_ $ do
      h1_ [class_ "event-title"] $ toHtml title

      div_ [class_ "event-info"] $ do
        case circleCut of
          Just circleCut -> div_ [class_ "event-image"] $ img_ [src_ circleCut, alt_ "circle cut", class_ "circle-cut"]
          Nothing        -> pure ()

        div_ [class_ "event-detail"] $ do
          ul_ [class_ "event-meta"] $ do
            li_ $ toHtml date
            li_ $ toHtml place
            li_ $ toHtml table

          ul_ [class_ "event-books"] $ do
            F.for_ books $ \Book { title, id } -> do
              li_ $ a_ [href_ $ "/" <> id <> ".html"] $ toHtml title

          div_ [class_ "book-actions"] $ do
            a_ [class_ "button", href_ url] "イベントサイト"
            a_ [class_ "button", href_ circleUrl] "サークルページ"

          fromMaybe (pure ()) content

page :: Text -> Html () -> Html ()
page title content = do
  article_ [class_ "page"] $ do
    div_ $ do
      h1_ [class_ "page-title"] $ toHtml title
      div_ [style_ "margin: 20px;"] content

ogp :: Ogp -> Html ()
ogp Ogp { title, typ, image, url, description, locale } = do
  meta_ [property_ "og:title", content_ title]
  meta_ [property_ "og:type", content_ $ fromString $ show typ]
  meta_ [property_ "og:image", content_ image]
  meta_ [property_ "og:rul", content_ url]
  whenJust description $ \description -> meta_ [property_ "og:description", content_ description]
  whenJust locale $ \locale -> meta_ [property_ "og:locale", content_ locale]

whenJust :: Applicative m => Maybe a -> (a -> m ()) -> m ()
whenJust Nothing _  = pure ()
whenJust (Just a) f = f a

property_ :: Text -> Attribute
property_ = Lucid.makeAttribute "property"
