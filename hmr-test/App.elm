module App exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (id)
import Tailwind as Tw exposing (classes)
import Tailwind.Theme exposing (blue, gray, s4, s8, s100, s500, s800, s900)


main : Html msg
main =
    div
        [ classes
            [ Tw.p s8
            , Tw.bg_color (gray s100)
            ]
        ]
        [ div
            [ classes
                [ Tw.text_n2xl
                , Tw.font_bold
                , Tw.text_color (gray s900)
                ]
            ]
            [ text "HMR Test" ]
        , div
            [ id "test-target"
            , classes
                [ Tw.p s4
                , Tw.bg_color (blue s500)
                , Tw.text_color (gray s100)
                , Tw.rounded_lg
                ]
            ]
            [ text "Hello from Elm" ]
        ]
