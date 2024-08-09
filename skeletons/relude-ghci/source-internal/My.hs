module My 
(
    module Relude,
    module Relude.Extra.Map,
    module Lens.Micro, 
    module Lens.Micro.Mtl, 
    module Data.Default,
    MonadError,
    throwError,
    catchError,
    handleError,

    UInt,
    io,
    whenMA,

) where

import Relude
import Relude.Extra.Map
import Lens.Micro
import Lens.Micro.Mtl
import Data.Default
import Control.Monad.Except (MonadError, throwError, catchError, handleError)

type UInt = Word

io :: MonadIO m => IO a -> m a
io = liftIO
{-# INLINE io #-}

whenMA :: Monad m => m Bool -> a -> m a -> m a
whenMA = \mb a ma ->
    mb >>= \case
        False -> pure $ a
        True  -> ma
{-# INLINE whenMA #-}
