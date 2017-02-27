module Views.Root exposing (view)

import Html exposing (Html, text, div, img)
import Html.Attributes exposing (class)
import Material.Layout as Layout
import Model exposing (Model)
import Msg exposing (..)
import Views.Table


header : Model -> Html Msg
header model =
    Layout.row
        []
        [ Layout.title [] [ text "Easy budget" ] ]


body : Model -> Html Msg
body model =
    div
        [ class "main" ]
        [ div [ class "content" ]
            [ Views.Table.view model.expenses
            ]
        ]


view : Model -> Html Msg
view model =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ header model ]
        , drawer = []
        , tabs = ( [], [] )
        , main = [ body model ]
        }
