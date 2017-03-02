module Msg exposing (..)

import Material
import Model exposing (Model, ExpenseItem)


type Msg
    = Noop
    | AddNewExpense ExpenseItem
    | Mdl (Material.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddNewExpense expense ->
            ( { model | expenses = model.expenses ++ [ expense ] }, Cmd.none )

        Noop ->
            ( model, Cmd.none )

        Mdl msg ->
            Material.update Mdl msg model
