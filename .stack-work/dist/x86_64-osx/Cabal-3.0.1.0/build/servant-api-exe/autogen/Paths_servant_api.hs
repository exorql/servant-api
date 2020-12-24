{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_servant_api (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/200396/sample/servant-api/.stack-work/install/x86_64-osx/36470d06d630196b927d6b5c995710217d31c9f62bdedfd39417114d196e4773/8.8.4/bin"
libdir     = "/Users/200396/sample/servant-api/.stack-work/install/x86_64-osx/36470d06d630196b927d6b5c995710217d31c9f62bdedfd39417114d196e4773/8.8.4/lib/x86_64-osx-ghc-8.8.4/servant-api-0.1.0.0-DivsVmiFMp3CjSjwUQBd1U-servant-api-exe"
dynlibdir  = "/Users/200396/sample/servant-api/.stack-work/install/x86_64-osx/36470d06d630196b927d6b5c995710217d31c9f62bdedfd39417114d196e4773/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/200396/sample/servant-api/.stack-work/install/x86_64-osx/36470d06d630196b927d6b5c995710217d31c9f62bdedfd39417114d196e4773/8.8.4/share/x86_64-osx-ghc-8.8.4/servant-api-0.1.0.0"
libexecdir = "/Users/200396/sample/servant-api/.stack-work/install/x86_64-osx/36470d06d630196b927d6b5c995710217d31c9f62bdedfd39417114d196e4773/8.8.4/libexec/x86_64-osx-ghc-8.8.4/servant-api-0.1.0.0"
sysconfdir = "/Users/200396/sample/servant-api/.stack-work/install/x86_64-osx/36470d06d630196b927d6b5c995710217d31c9f62bdedfd39417114d196e4773/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "servant_api_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "servant_api_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "servant_api_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "servant_api_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "servant_api_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "servant_api_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
