{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE DerivingStrategies  #-}
{-# LANGUAGE FlexibleInstances   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving  #-}

{-# OPTIONS_GHC -Wno-orphans #-}

module Main (main) where

import Data (Book, Event)

import           Control.Exception            (Exception (displayException))
import           Control.Monad.IO.Class       (MonadIO (liftIO))
import           Data.Foldable                (Foldable (fold), for_)
import           Data.Traversable             (for)
import           Data.Typeable                (Typeable)
import qualified Development.Shake            as Shake
import qualified Development.Shake.Classes    as Shake
import           Development.Shake.FilePath   ((-<.>), (</>))
import qualified Development.Shake.Forward    as Shake
import           GHC.Generics                 (Generic)
import           GHC.Stack                    (HasCallStack)
import           Language.Haskell.Interpreter (OptionVal ((:=)))
import qualified Language.Haskell.Interpreter as Hint
import           Main.Utf8                    (withUtf8)
import           System.IO                    (hPutStrLn, stderr)

main :: HasCallStack => IO ()
main =
  withUtf8 $
    Shake.shakeArgsForward
      (Shake.forwardOptions Shake.shakeOptions { Shake.shakeLintInside = [""], Shake.shakeThreads = 0 })
      action

action :: HasCallStack => Shake.Action ()
action = do
  about
  credit
  cname
  bs <- books
  index bs
  events
  style
  images

index :: HasCallStack => [(Book, FilePath)] -> Shake.Action ()
index books = lucid "index.hs" "index.html" ("index.html", books)

about :: HasCallStack => Shake.Action ()
about = lucid "about.hs" "about.html" "about.html"

credit :: HasCallStack => Shake.Action ()
credit = lucid "credit.hs" "credit.html" "credit.html"

books :: HasCallStack => Shake.Action [(Book, FilePath)]
books = do
  sources <- reverse <$> Shake.getDirectoryFiles "content/book" ["*"]
  for sources book

book :: HasCallStack => FilePath -> Shake.Action (Book, FilePath)
book path = do
  b <- lucid ("book" </> path) dest dest
  pure (b, dest)
  where
    dest = dropOrder path -<.> "html"

events :: HasCallStack => Shake.Action ()
events = do
  sources <- reverse <$> Shake.getDirectoryFiles "content/event" ["*"]
  es <- for sources event
  lucid "events.hs" "events.html" ("events.html", es)

event :: HasCallStack => FilePath -> Shake.Action (Event, FilePath)
event path = do
  e <- lucid ("event" </> path) dest dest
  pure (e, dest)
  where
    dest = dropOrder path -<.> "html"

-- Don't call this function in parallel, as GHCi has global locking.
lucid
  :: forall p r
   . (Show p, Shake.Hashable p, Show r, Typeable r, Shake.Binary r, HasCallStack)
  => FilePath -> FilePath -> p -> Shake.Action r
lucid source destination param = do
  libs <- Shake.getDirectoryFiles "content/lib" ["*.hs"]
  let hsFiles = "lib/Data.hs" : ("content" </> source) : (("content/lib" </>) <$> libs)
  hsContents <- Shake.forP hsFiles Shake.readFile'
  let hash = Shake.hash (hsContents, param)
  result <- Shake.cacheActionWith ("hint: " ++ source) hash $ Shake.traced "hint" $ Hint.runInterpreter $ do
    Hint.loadModules hsFiles
    Hint.set [Hint.languageExtensions := [Hint.DuplicateRecordFields, Hint.OverloadedStrings]]
    Hint.setImports ["Main", "Data", "Prelude", "Data.Functor.Identity", "Lucid"]
    Hint.interpret ("let html = render (" ++ show param ++ ") in (show html, runIdentity (evalHtmlT html))") (Hint.as :: (String, r))
  case result of
    Left e -> do
      liftIO $ hPutStrLn stderr $ displayException e
      fail "interpret"
    Right (s, r) -> do
      Shake.writeFileChanged ("out" </> destination) s
      pure r

style :: HasCallStack => Shake.Action ()
style = do
  let sources = (\n -> "content/style" </> n <> ".css") <$> ["minima", "list", "book", "header", "footer", "main"]
  contents <- Shake.forP sources Shake.readFile'
  Shake.writeFileChanged "out/style.css" $ fold contents

images :: HasCallStack => Shake.Action ()
images = do
  sources <- Shake.getDirectoryFiles "content/image" ["*"]
  for_ sources $ \source -> Shake.copyFileChanged ("content/image" </> source) ("out" </> source)

cname :: HasCallStack => Shake.Action ()
cname = Shake.copyFileChanged "content/CNAME" "out/CNAME"

dropOrder :: HasCallStack => String -> String
dropOrder path =
  case dropWhile (/= '-') path of
    '-':r -> r
    _     -> error "dropOrder: does not contain '-'"

deriving stock instance Generic Hint.InterpreterError

instance Shake.Binary Hint.InterpreterError

deriving stock instance Generic Hint.GhcError

instance Shake.Binary Hint.GhcError
