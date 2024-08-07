-- Copyright (C) {{year}} {{copyright}}
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
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE DeriveGeneric #-}
module ColorizedData
(
    ColorizedData,
    ColorizedApp,

    -- lenses
    colorizedVersion, 
    colorizedDataDir,

) where

import Relude
import My

import Lens.Micro.TH
import System.FilePath
import Data.Version

import GHC.Generics hiding (UInt, Meta)


data ColorizedData = ColorizedData {
      _colorizedVersion :: Version
    , _colorizedDataDir :: FilePath

    } deriving (Generic)


instance Default ColorizedData where
    def = ColorizedData {
          _colorizedVersion = makeVersion [0, 0]
        , _colorizedDataDir = def

        }


type ColorizedApp = ReaderT ColorizedData IO


makeLenses ''ColorizedData
