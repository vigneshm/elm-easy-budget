module Main exposing (..)

import Date
import Html exposing (programWithFlags)
import Model exposing (ExpenseItem, ExpenseType(Debit), Model)
import Msg exposing (Msg, update)
import Views.Root exposing (view)


init : String -> ( Model, Cmd Msg )
init path =
    ( { currency = "USD"
      , expenses =
            [ { amount = 1.5
              , category = "Eat out"
              , date = Date.fromTime 1488129743964
              , description = "Coffee at starbucks"
              , expenseType = Debit
              , source = "Credit Card 1"
              }
            , { amount = 23
              , category = "Travel"
              , date = Date.fromTime 1488129743964
              , description = "Uber to work"
              , expenseType = Debit
              , source = "Credit Card 2"
              }
            ]
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program String Model Msg
main =
    programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
