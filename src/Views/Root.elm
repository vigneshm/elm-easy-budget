module Views.Root exposing (view)

import Date
import Html exposing (Html, text, div, img)
import Html.Attributes exposing (class)
import Material.Button as Button
import Material.Layout as Layout
import Material.Options as Options
import Model exposing (Model, ExpenseType(Debit))
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
            , newExpense model
            ]
        ]


newExpense : Model -> Html Msg
newExpense model =
    Button.render Mdl
        [ 0 ]
        model.mdl
        [ Button.raised
        , Button.colored
        , Options.onClick
            (AddNewExpense
                { amount = 23
                , category = "Spending money"
                , date = Date.fromTime 1488129743964
                , description = "New stuff"
                , expenseType = Debit
                , source = "Wallet"
                }
            )
        ]
        [ text "New Expense" ]


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
