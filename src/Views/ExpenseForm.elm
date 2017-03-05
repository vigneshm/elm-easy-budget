module Views.ExpenseForm exposing (view)

import Date
import Html exposing (Html, text, div, img)
import Material.Button as Button
import Material.Options as Options
import Material.Textfield as Textfield
import Model exposing (Model, ExpenseType(Debit))
import Msg exposing (..)


isFloat : String -> Bool
isFloat n =
    case String.toFloat n of
        Ok _ ->
            True

        Err _ ->
            False


view : Model -> Html Msg
view model =
    div []
        [ Textfield.render Mdl
            [ 0 ]
            model.mdl
            [ Textfield.label "Amount"
            , Textfield.floatingLabel
            , Textfield.text_
            , Textfield.value model.ui.expenseForm.amountInput
            , Options.onInput UpdateExpenseAmount
            , Textfield.error "Not a number"
                |> Options.when
                    (not <| (isFloat model.ui.expenseForm.amountInput))
            ]
            []
        , Button.render Mdl
            [ 0 ]
            model.mdl
            [ Button.raised
            , Button.colored
            , Options.onClick
                (AddExpenseForm
                    { amount = model.ui.expenseForm.amountValue
                    , category = "Spending money"
                    , date = Date.fromTime 1488129743964
                    , description = "New stuff"
                    , expenseType = Debit
                    , source = "Wallet"
                    }
                )
            ]
            [ text "New Expense" ]
        ]
