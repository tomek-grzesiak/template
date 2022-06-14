module Main where

import Lib
import Protolude

main :: IO ()
main = flip runReaderT () . void .  runExceptT @() $ test2

class Monad m => Test2 m where
  test2 :: m ()

dummy :: (MonadReader () m, MonadError () m, MonadIO m) => m ()
dummy = liftIO . print $ "hello"

instance (MonadReader () m, MonadIO m) => Test2 (ExceptT () m) where
  test2 = dummy
