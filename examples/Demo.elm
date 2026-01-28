module Demo exposing (main, view)

{-| Example usage of Tailwind utilities with type-safe API.

Demonstrates:

  - Opaque Tailwind type with `classes` converter
  - Type-safe spacing: `Tw.p Theme.s4`, `Tw.m Theme.s2`, `Tw.gap Theme.s4`
  - Type-safe colors: `Tw.bg_color Theme.blue_500`, `Tw.text_color Theme.white`
  - Composable variants: `hover [ Tw.bg_color Theme.blue_600 ]`

-}

import Html exposing (Html, button, div, h1, text)
import Tailwind exposing (classes)
import Tailwind.Breakpoints exposing (hover)
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


main : Html msg
main =
    div
        [ classes
            [ Tw.p Theme.s8
            , Tw.bg_color Theme.gray_100
            , Tw.min_h Theme.s0
            ]
        ]
        [ h1
            [ classes
                [ Tw.text_n2xl
                , Tw.font_bold
                , Tw.mb Theme.s4
                , Tw.text_color Theme.gray_900
                ]
            ]
            [ text "Tailwind CSS + Elm Demo" ]
        , view
        , cardExample
        , buttonExample
        ]


view : Html msg
view =
    div
        [ classes
            [ Tw.flex
            , Tw.items_center
            , Tw.justify_between
            , Tw.p Theme.s4
            , Tw.m Theme.s2
            , Tw.bg_color Theme.blue_100
            , Tw.text_color Theme.gray_800
            , Tw.rounded_lg
            , Tw.shadow_md
            ]
        ]
        [ text "Hello, Tailwind!" ]


cardExample : Html msg
cardExample =
    div
        [ classes
            [ Tw.bg_color Theme.white
            , Tw.rounded_lg
            , Tw.shadow_lg
            , Tw.p Theme.s6
            , Tw.m Theme.s2
            , Tw.max_w Theme.s80
            ]
        ]
        [ div
            [ classes
                [ Tw.text_xl
                , Tw.font_semibold
                , Tw.mb Theme.s2
                , Tw.text_color Theme.gray_900
                ]
            ]
            [ text "Card Title" ]
        , div
            [ classes
                [ Tw.text_color Theme.gray_600
                , Tw.text_sm
                ]
            ]
            [ text "This card uses type-safe Tailwind utilities. `Tw.p Theme.s6` ensures only valid spacing values compile!" ]
        ]


buttonExample : Html msg
buttonExample =
    div
        [ classes
            [ Tw.flex
            , Tw.gap Theme.s4
            , Tw.m Theme.s2
            ]
        ]
        [ button
            [ classes
                [ Tw.bg_color Theme.blue_500
                , Tw.text_color Theme.white
                , Tw.font_semibold
                , Tw.py Theme.s2
                , Tw.px Theme.s4
                , Tw.rounded_lg
                , Tw.transition
                , hover [ Tw.bg_color Theme.blue_600 ]
                ]
            ]
            [ text "Primary" ]
        , button
            [ classes
                [ Tw.bg_color Theme.gray_200
                , Tw.text_color Theme.gray_800
                , Tw.font_semibold
                , Tw.py Theme.s2
                , Tw.px Theme.s4
                , Tw.rounded_lg
                , Tw.transition
                , hover [ Tw.bg_color Theme.gray_300 ]
                ]
            ]
            [ text "Secondary" ]
        ]
