{-# LANGUAGE ScopedTypeVariables #-}

module Main (main) where

import Data (Book)

import           Control.Exception            (Exception (displayException))
import           Control.Monad.IO.Class       (MonadIO (liftIO))
import           Data.Foldable                (for_)
import           Data.Functor.Identity        (Identity (runIdentity))
import           Data.Traversable             (for)
import           Data.Typeable                (Typeable)
import qualified Development.Shake            as Shake
import           Development.Shake.FilePath   ((-<.>), (</>))
import qualified Development.Shake.Forward    as Shake
import           Language.Haskell.Interpreter (OptionVal ((:=)))
import qualified Language.Haskell.Interpreter as Hint
import qualified Lucid
import           Main.Utf8                    (withUtf8)
import           System.IO                    (hPutStrLn, stderr)

main :: IO ()
main =
  withUtf8 $
    Shake.shakeArgsForward
      (Shake.forwardOptions Shake.shakeOptions { Shake.shakeLintInside = ["fsatrace"] })
      action

action :: Shake.Action ()
action = do
  about
  credit
  cname
  bs <- books
  index bs
  style
  images

index :: [(Book, FilePath)] -> Shake.Action ()
index = lucid "index.hs" "index.html"

about :: Shake.Action ()
about = lucid "about.hs" "about.html" ()

credit :: Shake.Action ()
credit = lucid "credit.hs" "credit.html" ()

books :: Shake.Action [(Book, FilePath)]
books = do
  sources <- reverse <$> Shake.getDirectoryFiles "content/book" ["*"]
  for sources book

book :: FilePath -> Shake.Action (Book, FilePath)
book path = do
  b <- lucid ("book" </> path) dest ()
  pure (b, dest)
  where
    dest = path' -<.> "html"
    path' = dropOrder path
    dropOrder ('-':r) = r
    dropOrder (_:r)   = dropOrder r
    dropOrder []      = error "dropOrder: does not contain '-'"

lucid :: forall p r. (Show p, Typeable r) => FilePath -> FilePath -> p -> Shake.Action r
lucid source destination param = do
  libs <- Shake.getDirectoryFiles "content/lib" ["*.hs"]
  result <- liftIO $ Hint.runInterpreter $ do
    Hint.set [Hint.languageExtensions := [Hint.DuplicateRecordFields, Hint.OverloadedStrings]]
    Hint.loadModules $ ("content" </> source) : (("content/lib" </>) <$> libs)
    Hint.setTopLevelModules ["Main"]
    Hint.setImports ["Data.Functor.Identity", "Lucid", "Data.Text"]
    Hint.interpret ("render (" ++ show param ++ ")") (Hint.as :: Lucid.Html r)
  case result of
    Left e  -> do
      liftIO $ hPutStrLn stderr $ displayException e
      fail "interpret"
    Right html -> do
      Shake.writeFile' ("out" </> destination) $ show html
      pure $ runIdentity $ Lucid.evalHtmlT html

style :: Shake.Action ()
style = do
  let sources = (\n -> "content/style" </> n <> ".css") <$> ["minima", "home", "book", "header", "footer", "main"]
  contents <- for sources Shake.readFile'
  Shake.writeFile' "out/style.css" $ mconcat contents

images :: Shake.Action ()
images = do
  sources <- Shake.getDirectoryFiles "content/image" ["*"]
  for_ sources $ \source -> Shake.copyFileChanged ("content/image" </> source) ("out" </> source)

cname :: Shake.Action ()
cname = Shake.copyFileChanged "content/CNAME" "out/CNAME"
