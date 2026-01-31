module Demo exposing (main)

{-| Golden test demo for Tailwind class extraction.

This file exercises various Tailwind patterns:

  - Simple constants
  - Parameterized spacing
  - Parameterized colors
  - Simple colors
  - Variants (hover, focus)
  - Breakpoints (md, lg)
  - Nested variants
  - Raw strings

-}

import Html exposing (Html, button, div, h1, p, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Breakpoints exposing (focus, hover, lg, md)
import Tailwind.Theme exposing (blue, gray, s2, s4, s6, s8, s100, s500, s600, s800, s900, white)


main : Html msg
main =
    div
        [ classes
            [ Tw.h_screen
            , Tw.bg_color (gray s100)
            , Tw.p s8
            ]
        ]
        [ h1
            [ classes
                [ Tw.text_n3xl
                , Tw.font_bold
                , Tw.mb s4
                , Tw.text_color (gray s900)
                ]
            ]
            [ text "Golden Test Demo" ]
        , div
            [ classes
                [ Tw.flex
                , Tw.items_center
                , Tw.gap s4
                , Tw.p s4
                , Tw.bg_simple white
                , Tw.rounded_lg
                , Tw.shadow_md
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
                    , focus [ Tw.shadow_lg ]
                    ]
                ]
                [ text "Primary Button" ]
            , p
                [ classes
                    [ Tw.text_color (gray s600)
                    , Tw.text_sm
                    , md [ Tw.text_base ]
                    , lg [ Tw.text_lg ]
                    ]
                ]
                [ text "Responsive text" ]
            ]
        , div
            [ classes
                [ Tw.mt s6
                , Tw.raw "custom-utility"
                ]
            ]
            [ text "Custom raw class" ]
        ]
