module Tailwind.Breakpoints exposing
    ( sm, md, lg, xl, xxl
    , hover, focus, active, disabled, visited, focus_within, focus_visible, first, last, odd, even, dark, group_hover
    , withVariant
    )

{-| Responsive breakpoints and state variants for Tailwind CSS.

All functions take a `List Tailwind` and return a `Tailwind` value
with the appropriate variant prefix applied.

Example:

    import Tailwind exposing (classes)
    import Tailwind.Breakpoints exposing (hover, md)
    import Tailwind.Theme exposing (blue, s4, s500, s600, s8)
    import Tailwind.Utilities as Tw

    button
        [ classes
            [ Tw.bg_color (blue s500)
            , hover [ Tw.bg_color (blue s600) ]
            , md [ Tw.p s4 ]
            ]
        ]
        [ text "Click me" ]


## Responsive Breakpoints

@docs sm, md, lg, xl, xxl


## State Variants

@docs hover, focus, active, disabled, visited, focus_within, focus_visible, first, last, odd, even, dark, group_hover


## Custom Variants

@docs withVariant

-}

import Tailwind exposing (Tailwind(..))


{-| Apply classes at the sm breakpoint (640px) and above.

    sm [ Tw.flex, Tw.p s8 ]

produces classes like "sm:flex sm:p-8"

-}
sm : List Tailwind -> Tailwind
sm twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "sm:" ++ c) twClasses))


{-| Apply classes at the md breakpoint (768px) and above.

    md [ Tw.flex, Tw.p s8 ]

produces classes like "md:flex md:p-8"

-}
md : List Tailwind -> Tailwind
md twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "md:" ++ c) twClasses))


{-| Apply classes at the lg breakpoint (1024px) and above.

    lg [ Tw.flex, Tw.p s8 ]

produces classes like "lg:flex lg:p-8"

-}
lg : List Tailwind -> Tailwind
lg twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "lg:" ++ c) twClasses))


{-| Apply classes at the xl breakpoint (1280px) and above.

    xl [ Tw.flex, Tw.p s8 ]

produces classes like "xl:flex xl:p-8"

-}
xl : List Tailwind -> Tailwind
xl twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "xl:" ++ c) twClasses))


{-| Apply classes at the 2xl breakpoint (1536px) and above.

    xxl [ Tw.flex, Tw.p s8 ]

produces classes like "2xl:flex 2xl:p-8"

-}
xxl : List Tailwind -> Tailwind
xxl twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "2xl:" ++ c) twClasses))


{-| Apply classes with hover: variant.

    hover [ Tw.bg_color (blue s600) ]

produces "hover:bg-blue-600"

-}
hover : List Tailwind -> Tailwind
hover twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "hover:" ++ c) twClasses))


{-| Apply classes with focus: variant.

    focus [ Tw.ring_color (blue s500) ]

produces "focus:ring-blue-500"

-}
focus : List Tailwind -> Tailwind
focus twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus:" ++ c) twClasses))


{-| Apply classes with active: variant.

    active [ Tw.bg_color (blue s700) ]

produces "active:bg-blue-700"

-}
active : List Tailwind -> Tailwind
active twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "active:" ++ c) twClasses))


{-| Apply classes with disabled: variant.

    disabled [ Tw.opacity_50, Tw.cursor_not_allowed ]

produces "disabled:opacity-50 disabled:cursor-not-allowed"

-}
disabled : List Tailwind -> Tailwind
disabled twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "disabled:" ++ c) twClasses))


{-| Apply classes with visited: variant.

    visited [ Tw.text_color (purple s600) ]

produces "visited:text-purple-600"

-}
visited : List Tailwind -> Tailwind
visited twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "visited:" ++ c) twClasses))


{-| Apply classes with focus-within: variant.

    focus_within [ Tw.ring_color (blue s500) ]

produces "focus-within:ring-blue-500"

-}
focus_within : List Tailwind -> Tailwind
focus_within twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus-within:" ++ c) twClasses))


{-| Apply classes with focus-visible: variant.

    focus_visible [ Tw.ring_color (blue s500) ]

produces "focus-visible:ring-blue-500"

-}
focus_visible : List Tailwind -> Tailwind
focus_visible twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus-visible:" ++ c) twClasses))


{-| Apply classes with first: variant (first child).

    first [ Tw.rounded_t ]

produces "first:rounded-t"

-}
first : List Tailwind -> Tailwind
first twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "first:" ++ c) twClasses))


{-| Apply classes with last: variant (last child).

    last [ Tw.rounded_b ]

produces "last:rounded-b"

-}
last : List Tailwind -> Tailwind
last twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "last:" ++ c) twClasses))


{-| Apply classes with odd: variant (odd children).

    odd [ Tw.bg_color (gray s100) ]

produces "odd:bg-gray-100"

-}
odd : List Tailwind -> Tailwind
odd twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "odd:" ++ c) twClasses))


{-| Apply classes with even: variant (even children).

    even [ Tw.bg_color (gray s50) ]

produces "even:bg-gray-50"

-}
even : List Tailwind -> Tailwind
even twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "even:" ++ c) twClasses))


{-| Apply classes with dark: variant (dark mode).

    dark [ Tw.bg_color (gray s900), Tw.text_color white ]

produces "dark:bg-gray-900 dark:text-white"

-}
dark : List Tailwind -> Tailwind
dark twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "dark:" ++ c) twClasses))


{-| Apply classes with group-hover: variant.

Use with a parent element that has the "group" class.

    group_hover [ Tw.visible ]

produces "group-hover:visible"

-}
group_hover : List Tailwind -> Tailwind
group_hover twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "group-hover:" ++ c) twClasses))


{-| Apply a custom variant prefix to a list of Tailwind values.

    withVariant "aria-selected" [ Tw.bg_color (blue s500) ]

produces "aria-selected:bg-blue-500"

-}
withVariant : String -> List Tailwind -> Tailwind
withVariant variant twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> variant ++ ":" ++ c) twClasses))
