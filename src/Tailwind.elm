module Tailwind exposing
    ( Tailwind(..)
    , classes
    , batch
    , raw, toClass
    )

{-| Type-safe Tailwind CSS for Elm.

This module provides the `Tailwind` type that represents Tailwind CSS classes.
Use the utilities in `Tailwind.Utilities` and variants in `Tailwind.Breakpoints`
to build up your styles, then convert to an `Html.Attribute` with `classes`.


## The Tailwind Type

@docs Tailwind


## Converting to Attributes

@docs classes


## Combining Classes

@docs batch


## Escape Hatch

@docs raw, toClass

-}

import Html exposing (Attribute)
import Html.Attributes


{-| A type representing a Tailwind CSS class or set of classes.

While the constructor is exposed for internal use by Tailwind.Utilities
and Tailwind.Breakpoints, you should use those modules to create values
rather than constructing them directly.

-}
type Tailwind
    = Tailwind String


{-| Convert a list of Tailwind values to an Html.Attribute.

This is the main entry point for using Tailwind classes in your view:

    import Tailwind exposing (classes)
    import Tailwind.Breakpoints exposing (hover, md)
    import Tailwind.Theme exposing (blue, s4, s500, s8)
    import Tailwind.Utilities as Tw

    view =
        div
            [ classes
                [ Tw.flex
                , Tw.items_center
                , Tw.p s4
                , Tw.bg_color blue_500
                , hover [ Tw.opacity_75 ]
                , md [ Tw.p s8 ]
                ]
            ]
            [ text "Hello!" ]

-}
classes : List Tailwind -> Attribute msg
classes twClasses =
    Html.Attributes.class (String.join " " (List.map toClassName twClasses))


{-| Combine multiple Tailwind values into one.

Useful for defining reusable style groups:

    buttonStyles : Tailwind
    buttonStyles =
        batch
            [ Tw.px s4
            , Tw.py s2
            , Tw.rounded
            , Tw.bg_color blue_500
            , hover [ Tw.bg_color blue_600 ]
            ]

-}
batch : List Tailwind -> Tailwind
batch twClasses =
    Tailwind (String.join " " (List.map toClassName twClasses))


{-| Escape hatch for arbitrary class names not covered by the API.

    raw "custom-class"

    raw "[scroll-snap-type:x_mandatory]" -- Tailwind arbitrary value syntax

Use sparingly - these won't be type-checked!

-}
raw : String -> Tailwind
raw className =
    Tailwind className


{-| Extract the class string from a Tailwind value.

Useful for interop with other libraries or debugging.

-}
toClass : Tailwind -> String
toClass (Tailwind className) =
    className



-- Internal helper


toClassName : Tailwind -> String
toClassName (Tailwind className) =
    className
