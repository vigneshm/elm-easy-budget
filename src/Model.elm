module Model
    exposing
        ( ExpenseItem
        , ExpenseType(Credit, Debit)
        , Model
        )

import Date exposing (Date)
import Material


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


type alias Model =
    { currency : String
    , expenses : List ExpenseItem
    , mdl : Material.Model
    }
