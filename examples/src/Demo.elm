module Demo exposing (main, view)

{-| Example usage of Tailwind utilities with type-safe API.

Demonstrates:

  - Opaque Tailwind type with `classes` converter
  - Type-safe spacing: `Tw.p s4`
  - Parameterized colors: `Tw.bg_color (blue s500)`
  - Simple colors: `Tw.bg_simple white`
  - Composable variants: `hover [ Tw.bg_color (blue s600) ]`

-}

import Html exposing (Html, button, div, h1, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Breakpoints exposing (hover)
import Tailwind.Theme exposing (blue, gray, s0, s100, s2, s200, s300, s4, s500, s6, s600, s8, s80, s800, s900, white)


main : Html msg
main =
    div
        [ classes
            [ Tw.p s8
            , Tw.bg_color (gray s100)
            , Tw.min_h s0
            ]
        ]
        [ h1
            [ classes
                [ Tw.text_n2xl
                , Tw.font_bold
                , Tw.mb s4
                , Tw.text_color (gray s900)
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
            , Tw.p s4
            , Tw.m s2
            , Tw.bg_color (blue s100)
            , Tw.text_color (gray s800)
            , Tw.rounded_lg
            , Tw.shadow_md
            ]
        ]
        [ text "Hello, Tailwind!" ]


cardExample : Html msg
cardExample =
    div
        [ classes
            [ Tw.bg_simple white
            , Tw.rounded_lg
            , Tw.shadow_lg
            , Tw.p s6
            , Tw.m s2
            , Tw.max_w s80
            ]
        ]
        [ div
            [ classes
                [ Tw.text_xl
                , Tw.font_semibold
                , Tw.mb s2
                , Tw.text_color (gray s900)
                ]
            ]
            [ text "Card Title" ]
        , div
            [ classes
                [ Tw.text_color (gray s600)
                , Tw.text_sm
                ]
            ]
            [ text "This card uses type-safe Tailwind utilities with parameterized colors: `Tw.bg_color (blue s500)`" ]
        ]


buttonExample : Html msg
buttonExample =
    div
        [ classes
            [ Tw.flex
            , Tw.gap s4
            , Tw.m s2
            ]
        ]
        [ button
            [ classes
                [ Tw.bg_color (blue s500)
                , Tw.text_simple white
                , Tw.font_semibold
                , Tw.py s2
                , Tw.px s4
                , Tw.rounded_lg
                , Tw.transition
                , hover [ Tw.bg_color (blue s600) ]
                ]
            ]
            [ text "Primary" ]
        , button
            [ classes
                [ Tw.bg_color (gray s200)
                , Tw.text_color (gray s800)
                , Tw.font_semibold
                , Tw.py s2
                , Tw.px s4
                , Tw.rounded_lg
                , Tw.transition
                , hover [ Tw.bg_color (gray s300) ]
                ]
            ]
            [ text "Secondary" ]
        ]
