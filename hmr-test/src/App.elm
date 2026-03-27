module App exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, p, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Theme exposing (blue, red, s4, s500)
import Url

type alias Model = { key : Nav.Key, count : Int }
type Msg = UrlRequested Browser.UrlRequest | UrlChanged Url.Url | NoOp

main : Program () Model Msg
main = Browser.application
    { init = init, view = view, update = update
    , subscriptions = \_ -> Sub.none
    , onUrlRequest = UrlRequested, onUrlChange = UrlChanged
    }

init _ _ key = ( { key = key, count = 0 }, Cmd.none )

update msg model =
    case msg of
        UrlRequested _ -> ( model, Cmd.none )
        UrlChanged _ -> ( model, Cmd.none )
        NoOp -> ( model, Cmd.none )

view _ =
    { title = "HMR Test"
    , body =
        [ div [ classes [ Tw.p s4, Tw.bg_color (blue s500) ] ]
            [ h1 [ classes [ Tw.text_n3xl, Tw.font_bold ] ] [ text "HMR Test" ]
            , p [] [ text "Blue version" ]
            ]
        ]
    }
