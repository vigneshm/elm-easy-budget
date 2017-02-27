module Views.Table exposing (view)

import Date.Extra as DateE
import Html exposing (Html, text, div, img)
import Material.Table as Table
import Msg exposing (Msg)
import Types exposing (ExpenseItem)


itemView : ExpenseItem -> Html Msg
itemView item =
    Table.tr []
        [ Table.td [] [ text item.source ]
        , Table.td []
            [ text <| DateE.toFormattedString "M/d/y h:mm a" item.date ]
        , Table.td [] [ text item.description ]
        , Table.td [] [ text item.category ]
        , Table.td [ Table.numeric ] [ text <| toString item.amount ]
        ]


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
