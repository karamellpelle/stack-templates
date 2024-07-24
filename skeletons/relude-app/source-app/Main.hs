-- Copyright (C) 2024 karamellpelle@hotmail.com
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
{-# OPTIONS_GHC -Wno-unused-imports #-}
module Main
(
    main,
) where

import Relude
import My

import PackageInfo_{{name-as-varid}} qualified as PackageInfo
import ColorizedData


main :: IO ()
main = do

    colorized <- executingStateT def $ do

        colorizedVersion   .= PackageInfo.version
        colorizedDataDir   .= "./data-dir/{{name}}/"

    usingReaderT colorized $ do
        putTextLn "main"
