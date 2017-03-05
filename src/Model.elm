module Model exposing (Model)

import Material
import Types exposing (..)


type alias Model =
    { currency : String
    , expenses : List ExpenseItem
    , mdl : Material.Model
    }
