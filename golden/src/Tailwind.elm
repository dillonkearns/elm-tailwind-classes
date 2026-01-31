module Tailwind exposing
    ( Tailwind(..)
    , classes
    , batch
    , raw
    , toClass
    )

{-| Type-safe Tailwind CSS for Elm (base module - codegen structure).
-}

import Html exposing (Attribute)
import Html.Attributes


type Tailwind
    = Tailwind String


classes : List Tailwind -> Attribute msg
classes list =
    list
        |> List.map (\(Tailwind cls) -> cls)
        |> String.join " "
        |> Html.Attributes.class


batch : List Tailwind -> Tailwind
batch list =
    list
        |> List.map (\(Tailwind cls) -> cls)
        |> String.join " "
        |> Tailwind


raw : String -> Tailwind
raw str =
    Tailwind str


toClass : Tailwind -> String
toClass (Tailwind cls) =
    cls
