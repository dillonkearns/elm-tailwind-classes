module Example exposing (main, view)

{-| Example usage of Tailwind utilities with type-safe API.

Demonstrates:

  - Type-safe spacing: `Tw.p Theme.s4`, `Tw.m Theme.s2`, `Tw.gap Theme.s4`
  - Type-safe colors: `Tw.bg_color Theme.blue_500`, `Tw.text_color Theme.white`

-}

import Html exposing (Html, button, div, h1, text)
import Html.Attributes exposing (class)
import Tailwind.Theme as Theme
import Tailwind.Utilities as Tw


main : Html msg
main =
    div [ Tw.p Theme.s8, Tw.bg_color Theme.gray_100, Tw.min_h Theme.s0 ]
        [ h1 [ Tw.text_n2xl, Tw.font_bold, Tw.mb Theme.s4, Tw.text_color Theme.gray_900 ]
            [ text "Tailwind CSS + Elm Demo" ]
        , view
        , cardExample
        , buttonExample
        ]


view : Html msg
view =
    div
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
        [ text "Hello, Tailwind!" ]


cardExample : Html msg
cardExample =
    div
        [ Tw.bg_color Theme.white
        , Tw.rounded_lg
        , Tw.shadow_lg
        , Tw.p Theme.s6
        , Tw.m Theme.s2
        , Tw.max_w Theme.s80
        ]
        [ div [ Tw.text_xl, Tw.font_semibold, Tw.mb Theme.s2, Tw.text_color Theme.gray_900 ]
            [ text "Card Title" ]
        , div [ Tw.text_color Theme.gray_600, Tw.text_sm ]
            [ text "This card uses type-safe Tailwind utilities. `Tw.p Theme.s6` ensures only valid spacing values compile!" ]
        ]


buttonExample : Html msg
buttonExample =
    div [ Tw.flex, Tw.gap Theme.s4, Tw.m Theme.s2 ]
        [ button
            [ Tw.bg_color Theme.blue_500
            , Tw.text_color Theme.white
            , Tw.font_semibold
            , Tw.py Theme.s2
            , Tw.px Theme.s4
            , Tw.rounded_lg
            , Tw.transition
            , class "hover:bg-blue-600"
            ]
            [ text "Primary" ]
        , button
            [ Tw.bg_color Theme.gray_200
            , Tw.text_color Theme.gray_800
            , Tw.font_semibold
            , Tw.py Theme.s2
            , Tw.px Theme.s4
            , Tw.rounded_lg
            , Tw.transition
            , class "hover:bg-gray-300"
            ]
            [ text "Secondary" ]
        ]
