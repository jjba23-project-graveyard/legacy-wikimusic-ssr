{-# LANGUAGE OverloadedLabels #-}

module WikiMusic.SSR.View.Components.DetailList where

import Principium
import Text.Blaze.Html5 as H

detailListEntry' :: ViewVars -> Text -> Html -> Html
detailListEntry' vv key val =
  H.div
    ! css'
      [ "flex",
        "flex-row",
        "gap-4",
        "w-fit",
        "font-mono"
      ]
    $ do
      (dt ! css' ["text-sm", "font-bold", if vv ^. #uiMode % #value == "dark" then "text-stone-300" else "text-stone-700"]) . text $ key
      dd ! css' ["text-sm", "break-all", if vv ^. #uiMode % #value == "dark" then "text-gray-300" else "text-gray-700", "font-mono"] $ val

detailListEntry :: ViewVars -> Text -> Html -> Html
detailListEntry = detailListEntry'

monoDetailListEntry :: ViewVars -> Text -> Html -> Html
monoDetailListEntry = detailListEntry'

detailList :: Html -> Html
detailList = dl ! css' ["flex", "flex-col", "gap-2", "justify-start"]
