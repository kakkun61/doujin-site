-- | Relations of books and events.
module Publication
  ( events
  , books
  ) where

import Book
import Data
import Event

import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as M

list :: [(Book, [Event])]
list =
  [ (introductionYesod1, [techBookFest])
  , (introductionYesod, [comicMarket91, techBookFest2, techBookFest4])
  , (proceduralHaskell, [techBookFest4, techBookFest5, techBookFest6, techBookFest7])
  , (introductionYesodCommercial, [techBookFest5, techBookFest6])
  , (typeReconstruction, [techBookFest6, techBookFest7])
  ]

events :: Map Book [Event]
events = M.fromList list

books :: Map Event [Book]
books = foldr (\(book, events) map -> foldr (\event -> M.insertWith (++) event [book]) map events) M.empty list
