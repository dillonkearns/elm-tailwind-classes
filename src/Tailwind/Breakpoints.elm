module Tailwind.Breakpoints exposing
    ( sm
    , md
    , lg
    , xl
    , n2xl
    , hover
    , focus
    , active
    , disabled
    , visited
    , focus_within
    , focus_visible
    , first
    , last
    , odd
    , even
    , dark
    , group_hover
    , withVariant
    , classesToString
    )

{-| Responsive breakpoints and state variants for Tailwind CSS.


## Responsive Breakpoints

@docs sm, md, lg, xl, n2xl


## State Variants

@docs hover, focus, active, disabled, visited, focus_within, focus_visible, first, last, odd, even, dark, group_hover


## Utilities

@docs withVariant, classesToString

-}

import Html exposing (Attribute)
import Html.Attributes exposing (class)


{-| Apply classes at the sm breakpoint (40rem) and above.

    sm [ flex, p_8 ]

produces classes like "sm:flex sm:p-8"

-}
sm : List String -> Attribute msg
sm classes =
    class (String.join " " (List.map (\c -> "sm:" ++ c) classes))


{-| Apply classes at the md breakpoint (48rem) and above.

    md [ flex, p_8 ]

produces classes like "sm:flex sm:p-8"

-}
md : List String -> Attribute msg
md classes =
    class (String.join " " (List.map (\c -> "md:" ++ c) classes))


{-| Apply classes at the lg breakpoint (64rem) and above.

    lg [ flex, p_8 ]

produces classes like "sm:flex sm:p-8"

-}
lg : List String -> Attribute msg
lg classes =
    class (String.join " " (List.map (\c -> "lg:" ++ c) classes))


{-| Apply classes at the xl breakpoint (80rem) and above.

    xl [ flex, p_8 ]

produces classes like "sm:flex sm:p-8"

-}
xl : List String -> Attribute msg
xl classes =
    class (String.join " " (List.map (\c -> "xl:" ++ c) classes))


{-| Apply classes at the 2xl breakpoint (96rem) and above.

    n2xl [ flex, p_8 ]

produces classes like "sm:flex sm:p-8"

-}
n2xl : List String -> Attribute msg
n2xl classes =
    class (String.join " " (List.map (\c -> "2xl:" ++ c) classes))



{-| Apply classes with hover: prefix.
-}
hover : List String -> Attribute msg
hover classes =
    class (String.join " " (List.map (\c -> "hover:" ++ c) classes))


{-| Apply classes with focus: prefix.
-}
focus : List String -> Attribute msg
focus classes =
    class (String.join " " (List.map (\c -> "focus:" ++ c) classes))


{-| Apply classes with active: prefix.
-}
active : List String -> Attribute msg
active classes =
    class (String.join " " (List.map (\c -> "active:" ++ c) classes))


{-| Apply classes with disabled: prefix.
-}
disabled : List String -> Attribute msg
disabled classes =
    class (String.join " " (List.map (\c -> "disabled:" ++ c) classes))


{-| Apply classes with visited: prefix.
-}
visited : List String -> Attribute msg
visited classes =
    class (String.join " " (List.map (\c -> "visited:" ++ c) classes))


{-| Apply classes with focus-within: prefix.
-}
focus_within : List String -> Attribute msg
focus_within classes =
    class (String.join " " (List.map (\c -> "focus-within:" ++ c) classes))


{-| Apply classes with focus-visible: prefix.
-}
focus_visible : List String -> Attribute msg
focus_visible classes =
    class (String.join " " (List.map (\c -> "focus-visible:" ++ c) classes))


{-| Apply classes with first: prefix.
-}
first : List String -> Attribute msg
first classes =
    class (String.join " " (List.map (\c -> "first:" ++ c) classes))


{-| Apply classes with last: prefix.
-}
last : List String -> Attribute msg
last classes =
    class (String.join " " (List.map (\c -> "last:" ++ c) classes))


{-| Apply classes with odd: prefix.
-}
odd : List String -> Attribute msg
odd classes =
    class (String.join " " (List.map (\c -> "odd:" ++ c) classes))


{-| Apply classes with even: prefix.
-}
even : List String -> Attribute msg
even classes =
    class (String.join " " (List.map (\c -> "even:" ++ c) classes))


{-| Apply classes with dark: prefix.
-}
dark : List String -> Attribute msg
dark classes =
    class (String.join " " (List.map (\c -> "dark:" ++ c) classes))


{-| Apply classes with group-hover: prefix.
-}
group_hover : List String -> Attribute msg
group_hover classes =
    class (String.join " " (List.map (\c -> "group-hover:" ++ c) classes))


{-| Apply a custom variant prefix to a list of class names.

    withVariant "aria-selected" [ "bg-blue-500", "text-white" ]

produces "aria-selected:bg-blue-500 aria-selected:text-white"

-}
withVariant : String -> List String -> Attribute msg
withVariant variant classes =
    class (String.join " " (List.map (\c -> variant ++ ":" ++ c) classes))


{-| Convert a list of class names to a single space-separated string.
Useful when you need to extract class names.
-}
classesToString : List String -> String
classesToString =
    String.join " "
