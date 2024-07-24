-- Copyright (C) {{year}} {{author-email}}
-- 
-- This file is part of '{{name}}'.
-- 
-- '{{name}}' is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- '{{name}}' is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with '{{name}}'.  If not, see <http://www.gnu.org/licenses/>.
--
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
