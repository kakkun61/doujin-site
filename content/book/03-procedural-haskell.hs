{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Book
import           Data
import qualified Data.Map.Strict as M
import qualified Layout          as L
import qualified Publication
import qualified Site

import Data.Text (Text)
import Lucid

render :: Text -> Html Book
render path = do
  L.top (Book.title book <> " | " <> Site.name) (L.ogp ogp) $ L.book book events (Just content)
  pure book
  where
    ogp =
      Ogp
        (Book.title book)
        Article
        (Site.url <> unPath (Book.image book))
        (Site.url <> "/" <> path)
        (Just $ Book.description book)
        (Just "ja_JP")
    book = Book.proceduralHaskell
    Just events = M.lookup book Publication.events
    content = do
      h2_ "対象読者"
      ul_ $ do
        li_ $ do
          "Haskell 入門書程度が読める"
          ul_ $ do
            li_ "特に読めるが書こうとすると悩む人に読んでほしいです"
        li_ $ do
          "手続きプログラミングのプログラマー"
          ul_ $ do
            li_ "厳密に本書を読むためには Haskell を読めた方がよいですが、手続きプログラミングですのでプログラマーなら雰囲気で読めると思います"

      h2_ "書かれてあること"
      ul_ $ do
        li_ "書き換え可能な変数"
        li_ "手続きプログラミング的な制御構造"
        li_ "配列"
        li_ $ do
          "サンプルプログラム"
          ul_ $ do
            li_ "手続き的な実装と Haskell 的な実装の対比"

main = undefined
