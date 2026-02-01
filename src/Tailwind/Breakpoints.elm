module Tailwind.Breakpoints exposing
    ( sm, md, lg, xl, n2xl
    , hover, focus, active, disabled, visited, focus_within, focus_visible, first, last, odd, even, dark, group_hover
    , withVariant
    )

{-| Responsive breakpoints and state variants for Tailwind CSS.

All functions take a `List Tailwind` and return a `Tailwind` value
with the appropriate variant prefix applied.

Example:

    import Tailwind as Tw exposing (classes)
    import Tailwind.Breakpoints exposing (hover, md)
    import Tailwind.Theme exposing (blue, s4, s500, s600)

    button
        [ classes
            [ Tw.bg_color (blue s500)
            , hover [ Tw.bg_color (blue s600) ]
            , md [ Tw.p s4 ]
            ]
        ]
        [ text "Click me" ]


## Responsive Breakpoints

@docs sm, md, lg, xl, n2xl


## State Variants

@docs hover, focus, active, disabled, visited, focus_within, focus_visible, first, last, odd, even, dark, group_hover


## Custom Variants

@docs withVariant

-}

import Tailwind exposing (Tailwind(..))


{-| Apply classes at the sm breakpoint (40rem) and above.

    sm [ Tw.flex, Tw.p s8 ]

produces classes like "sm:flex sm:p-8"

-}
sm : List Tailwind -> Tailwind
sm twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "sm:" ++ c) twClasses))


{-| Apply classes at the md breakpoint (48rem) and above.

    md [ Tw.flex, Tw.p s8 ]

produces classes like "md:flex md:p-8"

-}
md : List Tailwind -> Tailwind
md twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "md:" ++ c) twClasses))


{-| Apply classes at the lg breakpoint (64rem) and above.

    lg [ Tw.flex, Tw.p s8 ]

produces classes like "lg:flex lg:p-8"

-}
lg : List Tailwind -> Tailwind
lg twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "lg:" ++ c) twClasses))


{-| Apply classes at the xl breakpoint (80rem) and above.

    xl [ Tw.flex, Tw.p s8 ]

produces classes like "xl:flex xl:p-8"

-}
xl : List Tailwind -> Tailwind
xl twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "xl:" ++ c) twClasses))


{-| Apply classes at the 2xl breakpoint (96rem) and above.

    n2xl [ Tw.flex, Tw.p s8 ]

produces classes like "2xl:flex 2xl:p-8"

-}
n2xl : List Tailwind -> Tailwind
n2xl twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "2xl:" ++ c) twClasses))


{-| Apply classes with hover: variant.

    hover [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "hover:bg-blue-500 hover:text-white"

-}
hover : List Tailwind -> Tailwind
hover twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "hover:" ++ c) twClasses))


{-| Apply classes with focus: variant.

    focus [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "focus:bg-blue-500 focus:text-white"

-}
focus : List Tailwind -> Tailwind
focus twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus:" ++ c) twClasses))


{-| Apply classes with active: variant.

    active [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "active:bg-blue-500 active:text-white"

-}
active : List Tailwind -> Tailwind
active twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "active:" ++ c) twClasses))


{-| Apply classes with disabled: variant.

    disabled [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "disabled:bg-blue-500 disabled:text-white"

-}
disabled : List Tailwind -> Tailwind
disabled twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "disabled:" ++ c) twClasses))


{-| Apply classes with visited: variant.

    visited [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "visited:bg-blue-500 visited:text-white"

-}
visited : List Tailwind -> Tailwind
visited twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "visited:" ++ c) twClasses))


{-| Apply classes with focus-within: variant.

    focus_within [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "focus-within:bg-blue-500 focus-within:text-white"

-}
focus_within : List Tailwind -> Tailwind
focus_within twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus-within:" ++ c) twClasses))


{-| Apply classes with focus-visible: variant.

    focus_visible [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "focus-visible:bg-blue-500 focus-visible:text-white"

-}
focus_visible : List Tailwind -> Tailwind
focus_visible twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus-visible:" ++ c) twClasses))


{-| Apply classes with first: variant.

    first [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "first:bg-blue-500 first:text-white"

-}
first : List Tailwind -> Tailwind
first twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "first:" ++ c) twClasses))


{-| Apply classes with last: variant.

    last [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "last:bg-blue-500 last:text-white"

-}
last : List Tailwind -> Tailwind
last twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "last:" ++ c) twClasses))


{-| Apply classes with odd: variant.

    odd [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "odd:bg-blue-500 odd:text-white"

-}
odd : List Tailwind -> Tailwind
odd twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "odd:" ++ c) twClasses))


{-| Apply classes with even: variant.

    even [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "even:bg-blue-500 even:text-white"

-}
even : List Tailwind -> Tailwind
even twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "even:" ++ c) twClasses))


{-| Apply classes with dark: variant.

    dark [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "dark:bg-blue-500 dark:text-white"

-}
dark : List Tailwind -> Tailwind
dark twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "dark:" ++ c) twClasses))


{-| Apply classes with group-hover: variant.

    group_hover [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "group-hover:bg-blue-500 group-hover:text-white"

-}
group_hover : List Tailwind -> Tailwind
group_hover twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "group-hover:" ++ c) twClasses))


{-| Apply a custom variant prefix to a list of Tailwind values.

    withVariant "aria-selected" [ Tw.bg_color (blue s500), Tw.text_simple white ]

produces "aria-selected:bg-blue-500 aria-selected:text-white"

-}
withVariant : String -> List Tailwind -> Tailwind
withVariant variant twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> variant ++ ":" ++ c) twClasses))
