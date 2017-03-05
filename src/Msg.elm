module Msg exposing (..)

import Material
import Model exposing (Model, ExpenseForm, ExpenseItem)
import Result


type Msg
    = Noop
    | AddExpenseForm ExpenseItem
    | UpdateExpenseAmount String
    | Mdl (Material.Msg Msg)


updateExpenseForm : ExpenseForm -> Model -> Model
updateExpenseForm expenseForm model =
    let
        oldUI =
            model.ui

        newUI =
            { oldUI | expenseForm = expenseForm }
    in
        { model | ui = newUI }


updateExpenseFormAmount : String -> Model -> Model
updateExpenseFormAmount amountInput model =
    let
        oldExpenseForm =
            model.ui.expenseForm

        newExpenseForm =
            { oldExpenseForm
                | amountInput = amountInput
                , amountValue =
                    String.toFloat amountInput |> Result.withDefault 0.0
            }
    in
        updateExpenseForm newExpenseForm model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddExpenseForm expense ->
            ( { model | expenses = model.expenses ++ [ expense ] }, Cmd.none )

        UpdateExpenseAmount amountInput ->
            ( updateExpenseFormAmount amountInput model, Cmd.none )

        Noop ->
            ( model, Cmd.none )

        Mdl msg ->
            Material.update Mdl msg model
