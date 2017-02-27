module Views.Table exposing (view)

import Date exposing (Date)
import Date.Extra as DateE
import Html exposing (Html, text, div, img)
import Material.Table as Table
import Model exposing (ExpenseItem)
import Msg exposing (Msg)
import FormatNumber
import FormatNumber.Locales

formatCurrency : Float -> String
formatCurrency =
  FormatNumber.format FormatNumber.Locales.usLocale

formatDate : Date -> String
formatDate =
  DateE.toFormattedString "M/d/y h:mm a"

itemView : ExpenseItem -> Html Msg
itemView item =
    Table.tr []
        [ Table.td [] [ text item.source ]
        , Table.td [] [ text <| formatDate item.date ]
        , Table.td [] [ text item.description ]
        , Table.td [] [ text item.category ]
        , Table.td [ Table.numeric ] [ text <| formatCurrency item.amount ] ]


view : List ExpenseItem -> Html Msg
view expenses =
    Table.table
        []
        [ Table.thead []
            [ Table.tr []
                [ Table.th [] [ text "Source" ]
                , Table.th [] [ text "Date" ]
                , Table.th [] [ text "Description" ]
                , Table.th [] [ text "Category" ]
                , Table.th [] [ text "Amount" ]
                ]
            ]
        , Table.tbody [] (expenses |> List.map itemView)
        ]
