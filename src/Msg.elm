module Msg exposing (..)

import Material
import Model exposing (Model)


type Msg
    = Noop
    | Mdl (Material.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Noop ->
            ( model, Cmd.none )

        Mdl msg ->
            Material.update Mdl msg model
