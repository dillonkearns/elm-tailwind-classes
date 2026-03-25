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
    )

{-| Responsive breakpoints and state variants for Tailwind CSS.

-}

import Tailwind exposing (Tailwind(..))


sm : List Tailwind -> Tailwind
sm twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "sm:" ++ c) twClasses))

md : List Tailwind -> Tailwind
md twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "md:" ++ c) twClasses))

lg : List Tailwind -> Tailwind
lg twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "lg:" ++ c) twClasses))

xl : List Tailwind -> Tailwind
xl twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "xl:" ++ c) twClasses))

n2xl : List Tailwind -> Tailwind
n2xl twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "2xl:" ++ c) twClasses))


hover : List Tailwind -> Tailwind
hover twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "hover:" ++ c) twClasses))

focus : List Tailwind -> Tailwind
focus twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus:" ++ c) twClasses))

active : List Tailwind -> Tailwind
active twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "active:" ++ c) twClasses))

disabled : List Tailwind -> Tailwind
disabled twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "disabled:" ++ c) twClasses))

visited : List Tailwind -> Tailwind
visited twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "visited:" ++ c) twClasses))

focus_within : List Tailwind -> Tailwind
focus_within twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus-within:" ++ c) twClasses))

focus_visible : List Tailwind -> Tailwind
focus_visible twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "focus-visible:" ++ c) twClasses))

first : List Tailwind -> Tailwind
first twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "first:" ++ c) twClasses))

last : List Tailwind -> Tailwind
last twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "last:" ++ c) twClasses))

odd : List Tailwind -> Tailwind
odd twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "odd:" ++ c) twClasses))

even : List Tailwind -> Tailwind
even twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "even:" ++ c) twClasses))

dark : List Tailwind -> Tailwind
dark twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "dark:" ++ c) twClasses))

group_hover : List Tailwind -> Tailwind
group_hover twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> "group-hover:" ++ c) twClasses))


withVariant : String -> List Tailwind -> Tailwind
withVariant variant twClasses =
    Tailwind (String.join " " (List.map (\(Tailwind c) -> variant ++ ":" ++ c) twClasses))
