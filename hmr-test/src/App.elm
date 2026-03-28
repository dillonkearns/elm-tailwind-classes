module App exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, p, span, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Breakpoints exposing (hover)
import Tailwind.Theme exposing (blue, gray, red, s2, s4, s8, s100, s500, s600, s900)
import Url


type alias Model =
    { key : Nav.Key
    , count : Int
    }


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | NoOp


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ _ key =
    ( { key = key, count = 0 }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested _ ->
            ( model, Cmd.none )

        UrlChanged _ ->
            ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )


view : Model -> Browser.Document Msg
view _ =
    { title = "HMR Test"
    , body =
        [ div
            [ classes [ Tw.p s4, Tw.bg_color (blue s500) ] ]
            [ h1 [ classes [ Tw.text_n3xl, Tw.font_bold ] ] [ text "HMR Test" ]
            , p [] [ text "Blue version" ]
            ]
        , div
            [ classes [ Tw.mt s8, Tw.p s4, Tw.bg_color (gray s100), Tw.rounded_lg ] ]
            [ p
                [ classes [ Tw.text_color (gray s900), Tw.text_sm ] ]
                [ text "Parameterized spacing and colors" ]
            , span
                [ classes [ Tw.text_color (red s500), hover [ Tw.text_color (blue s600) ] ] ]
                [ text "Hover me" ]
            ]
        ]
    }
