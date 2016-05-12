{-# LANGUAGE OverloadedStrings, QuasiQuotes #-}
module Fileserver (runApp, app) where

import           Network.Wai (Application)
import qualified Web.Scotty as S

app' :: S.ScottyM ()
app' = do
  S.get "/career/recommendation-wjblack" $ do
    S.file "./static/recommendation.pdf" 

app :: IO Application
app = S.scottyApp app'

runApp :: IO ()
runApp = S.scotty 6666 app'
