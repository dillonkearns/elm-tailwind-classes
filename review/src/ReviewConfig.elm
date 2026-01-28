module ReviewConfig exposing (config)

{-| elm-review configuration for Tailwind class extraction.

This is a minimal config that only runs the TailwindExtractor rule.
It's designed to be used internally by the Vite plugin.

-}

import Review.Rule exposing (Rule)
import TailwindExtractor


config : List Rule
config =
    [ TailwindExtractor.rule
    ]
