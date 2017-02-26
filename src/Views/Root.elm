module Views.Root exposing (view)

import Html exposing (Html, text, div, img)
import Model exposing (Model)
import Msg exposing (..)
import Views.Table


view : Model -> Html Msg
view model =
    div [] [ Views.Table.view model.expenses ]
