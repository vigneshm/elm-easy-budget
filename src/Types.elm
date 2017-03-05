module Types exposing (..)

import Date exposing (Date)


type ExpenseType
    = Credit
    | Debit


type alias ExpenseItem =
    { amount : Float
    , category : String
    , date : Date
    , description : String
    , expenseType : ExpenseType
    , source : String
    }
