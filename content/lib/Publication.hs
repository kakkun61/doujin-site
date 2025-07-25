-- | Relations of books and events.
module Publication
  ( events
  , books
  ) where

import Book
import Data
import Event

import qualified Data.List       as L
import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as M

list :: [(Book, [Event])]
list =
  [ (introductionYesod1, [techBookFest])
  , (introductionYesod, [comicMarket91, techBookFest2, techBookFest4])
  , ( proceduralHaskell
    , [ techBookFest4
      , techBookFest5
      , techBookFest6
      , techBookFest7
      , techBookFest9
      , techBookFest10
      , techBookFest11
      , techBookFest12
      , techBookFest13
      , techBookFest14
      , techBookFest18
      ]
    )
  , (introductionYesodCommercial, [techBookFest5, techBookFest6])
  , ( typeReconstruction
    , [ techBookFest6
      , techBookFest7
      , techBookFest9
      , techBookFest10
      , techBookFest11
      , techBookFest12
      , techBookFest13
      , techBookFest14
      , techBookFest18
      ]
    )
  , (darkRoomPrinting, [techBookFest13, techBookFest14, techBookFest18])
  , (monadDrill, [techBookFest18])
  ]

events :: Map Book [Event]
events = M.fromList list

books :: Map Event [Book]
books = foldr (\(book, events) map -> foldr (\event -> M.insertWith (\a b -> reverse $ L.sort $ a ++ b) event [book]) map events) M.empty list
