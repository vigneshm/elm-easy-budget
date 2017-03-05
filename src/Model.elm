module Model exposing (..)

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


type alias ExpenseForm =
    { amountInput : String
    , amountValue : Float
    }


type alias UI =
    { expenseForm : ExpenseForm
    }


type alias Model =
    { currency : String
    , expenses : List ExpenseItem
    , ui : UI
    , mdl : Material.Model
    }
