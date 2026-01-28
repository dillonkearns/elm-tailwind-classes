module Tailwind.Theme exposing
    ( Color(..)
    , Spacing(..)
    , spacingToString
    , Opacity(..)
    , red_50
    , red_100
    , red_200
    , red_300
    , red_400
    , red_500
    , red_600
    , red_700
    , red_800
    , red_900
    , red_950
    , orange_50
    , orange_100
    , orange_200
    , orange_300
    , orange_400
    , orange_500
    , orange_600
    , orange_700
    , orange_800
    , orange_900
    , orange_950
    , amber_50
    , amber_100
    , amber_200
    , amber_300
    , amber_400
    , amber_500
    , amber_600
    , amber_700
    , amber_800
    , amber_900
    , amber_950
    , yellow_50
    , yellow_100
    , yellow_200
    , yellow_300
    , yellow_400
    , yellow_500
    , yellow_600
    , yellow_700
    , yellow_800
    , yellow_900
    , yellow_950
    , lime_50
    , lime_100
    , lime_200
    , lime_300
    , lime_400
    , lime_500
    , lime_600
    , lime_700
    , lime_800
    , lime_900
    , lime_950
    , green_50
    , green_100
    , green_200
    , green_300
    , green_400
    , green_500
    , green_600
    , green_700
    , green_800
    , green_900
    , green_950
    , emerald_50
    , emerald_100
    , emerald_200
    , emerald_300
    , emerald_400
    , emerald_500
    , emerald_600
    , emerald_700
    , emerald_800
    , emerald_900
    , emerald_950
    , teal_50
    , teal_100
    , teal_200
    , teal_300
    , teal_400
    , teal_500
    , teal_600
    , teal_700
    , teal_800
    , teal_900
    , teal_950
    , cyan_50
    , cyan_100
    , cyan_200
    , cyan_300
    , cyan_400
    , cyan_500
    , cyan_600
    , cyan_700
    , cyan_800
    , cyan_900
    , cyan_950
    , sky_50
    , sky_100
    , sky_200
    , sky_300
    , sky_400
    , sky_500
    , sky_600
    , sky_700
    , sky_800
    , sky_900
    , sky_950
    , blue_50
    , blue_100
    , blue_200
    , blue_300
    , blue_400
    , blue_500
    , blue_600
    , blue_700
    , blue_800
    , blue_900
    , blue_950
    , indigo_50
    , indigo_100
    , indigo_200
    , indigo_300
    , indigo_400
    , indigo_500
    , indigo_600
    , indigo_700
    , indigo_800
    , indigo_900
    , indigo_950
    , violet_50
    , violet_100
    , violet_200
    , violet_300
    , violet_400
    , violet_500
    , violet_600
    , violet_700
    , violet_800
    , violet_900
    , violet_950
    , purple_50
    , purple_100
    , purple_200
    , purple_300
    , purple_400
    , purple_500
    , purple_600
    , purple_700
    , purple_800
    , purple_900
    , purple_950
    , fuchsia_50
    , fuchsia_100
    , fuchsia_200
    , fuchsia_300
    , fuchsia_400
    , fuchsia_500
    , fuchsia_600
    , fuchsia_700
    , fuchsia_800
    , fuchsia_900
    , fuchsia_950
    , pink_50
    , pink_100
    , pink_200
    , pink_300
    , pink_400
    , pink_500
    , pink_600
    , pink_700
    , pink_800
    , pink_900
    , pink_950
    , rose_50
    , rose_100
    , rose_200
    , rose_300
    , rose_400
    , rose_500
    , rose_600
    , rose_700
    , rose_800
    , rose_900
    , rose_950
    , slate_50
    , slate_100
    , slate_200
    , slate_300
    , slate_400
    , slate_500
    , slate_600
    , slate_700
    , slate_800
    , slate_900
    , slate_950
    , gray_50
    , gray_100
    , gray_200
    , gray_300
    , gray_400
    , gray_500
    , gray_600
    , gray_700
    , gray_800
    , gray_900
    , gray_950
    , zinc_50
    , zinc_100
    , zinc_200
    , zinc_300
    , zinc_400
    , zinc_500
    , zinc_600
    , zinc_700
    , zinc_800
    , zinc_900
    , zinc_950
    , neutral_50
    , neutral_100
    , neutral_200
    , neutral_300
    , neutral_400
    , neutral_500
    , neutral_600
    , neutral_700
    , neutral_800
    , neutral_900
    , neutral_950
    , stone_50
    , stone_100
    , stone_200
    , stone_300
    , stone_400
    , stone_500
    , stone_600
    , stone_700
    , stone_800
    , stone_900
    , stone_950
    , black
    , white
    , s0
    , spx
    , s0_dot_5
    , s1
    , s1_dot_5
    , s2
    , s2_dot_5
    , s3
    , s3_dot_5
    , s4
    , s5
    , s6
    , s7
    , s8
    , s9
    , s10
    , s11
    , s12
    , s14
    , s16
    , s20
    , s24
    , s28
    , s32
    , s36
    , s40
    , s44
    , s48
    , s52
    , s56
    , s60
    , s64
    , s72
    , s80
    , s96
    , opacity0
    , opacity5
    , opacity10
    , opacity20
    , opacity25
    , opacity30
    , opacity40
    , opacity50
    , opacity60
    , opacity70
    , opacity75
    , opacity80
    , opacity90
    , opacity95
    , opacity100
    )

{-| Theme values for Tailwind CSS.

This module provides type-safe color, spacing, and opacity values.


## Types

@docs Color, Spacing, spacingToString, Opacity


## Colors

@docs red_50, red_100, red_200, red_300, red_400, red_500, red_600, red_700, red_800, red_900, red_950, orange_50, orange_100, orange_200, orange_300, orange_400, orange_500, orange_600, orange_700, orange_800


## Spacing

@docs s0, spx, s0_dot_5, s1, s1_dot_5, s2, s2_dot_5, s3, s3_dot_5, s4, s5, s6, s7, s8, s9, s10, s11, s12, s14, s16


## Opacities

@docs opacity0, opacity5, opacity10, opacity20, opacity25, opacity30, opacity40, opacity50, opacity60, opacity70, opacity75, opacity80, opacity90, opacity95, opacity100

-}


{-| A Tailwind color value.
-}
type Color
    = Color String


{-| A Tailwind spacing value from the default scale.
-}
type Spacing
    = S0
    | Spx
    | S0_dot_5
    | S1
    | S1_dot_5
    | S2
    | S2_dot_5
    | S3
    | S3_dot_5
    | S4
    | S5
    | S6
    | S7
    | S8
    | S9
    | S10
    | S11
    | S12
    | S14
    | S16
    | S20
    | S24
    | S28
    | S32
    | S36
    | S40
    | S44
    | S48
    | S52
    | S56
    | S60
    | S64
    | S72
    | S80
    | S96


{-| Convert a Spacing value to its CSS class suffix.
-}
spacingToString : Spacing -> String
spacingToString spacing =
    case spacing of
        S0 ->
            "0"

        Spx ->
            "px"

        S0_dot_5 ->
            "0.5"

        S1 ->
            "1"

        S1_dot_5 ->
            "1.5"

        S2 ->
            "2"

        S2_dot_5 ->
            "2.5"

        S3 ->
            "3"

        S3_dot_5 ->
            "3.5"

        S4 ->
            "4"

        S5 ->
            "5"

        S6 ->
            "6"

        S7 ->
            "7"

        S8 ->
            "8"

        S9 ->
            "9"

        S10 ->
            "10"

        S11 ->
            "11"

        S12 ->
            "12"

        S14 ->
            "14"

        S16 ->
            "16"

        S20 ->
            "20"

        S24 ->
            "24"

        S28 ->
            "28"

        S32 ->
            "32"

        S36 ->
            "36"

        S40 ->
            "40"

        S44 ->
            "44"

        S48 ->
            "48"

        S52 ->
            "52"

        S56 ->
            "56"

        S60 ->
            "60"

        S64 ->
            "64"

        S72 ->
            "72"

        S80 ->
            "80"

        S96 ->
            "96"


{-| An opacity value (0-100).
-}
type Opacity
    = Opacity Int


{-| Color: red-50
-}
red_50 : Color
red_50 =
    Color "red-50"

{-| Color: red-100
-}
red_100 : Color
red_100 =
    Color "red-100"

{-| Color: red-200
-}
red_200 : Color
red_200 =
    Color "red-200"

{-| Color: red-300
-}
red_300 : Color
red_300 =
    Color "red-300"

{-| Color: red-400
-}
red_400 : Color
red_400 =
    Color "red-400"

{-| Color: red-500
-}
red_500 : Color
red_500 =
    Color "red-500"

{-| Color: red-600
-}
red_600 : Color
red_600 =
    Color "red-600"

{-| Color: red-700
-}
red_700 : Color
red_700 =
    Color "red-700"

{-| Color: red-800
-}
red_800 : Color
red_800 =
    Color "red-800"

{-| Color: red-900
-}
red_900 : Color
red_900 =
    Color "red-900"

{-| Color: red-950
-}
red_950 : Color
red_950 =
    Color "red-950"

{-| Color: orange-50
-}
orange_50 : Color
orange_50 =
    Color "orange-50"

{-| Color: orange-100
-}
orange_100 : Color
orange_100 =
    Color "orange-100"

{-| Color: orange-200
-}
orange_200 : Color
orange_200 =
    Color "orange-200"

{-| Color: orange-300
-}
orange_300 : Color
orange_300 =
    Color "orange-300"

{-| Color: orange-400
-}
orange_400 : Color
orange_400 =
    Color "orange-400"

{-| Color: orange-500
-}
orange_500 : Color
orange_500 =
    Color "orange-500"

{-| Color: orange-600
-}
orange_600 : Color
orange_600 =
    Color "orange-600"

{-| Color: orange-700
-}
orange_700 : Color
orange_700 =
    Color "orange-700"

{-| Color: orange-800
-}
orange_800 : Color
orange_800 =
    Color "orange-800"

{-| Color: orange-900
-}
orange_900 : Color
orange_900 =
    Color "orange-900"

{-| Color: orange-950
-}
orange_950 : Color
orange_950 =
    Color "orange-950"

{-| Color: amber-50
-}
amber_50 : Color
amber_50 =
    Color "amber-50"

{-| Color: amber-100
-}
amber_100 : Color
amber_100 =
    Color "amber-100"

{-| Color: amber-200
-}
amber_200 : Color
amber_200 =
    Color "amber-200"

{-| Color: amber-300
-}
amber_300 : Color
amber_300 =
    Color "amber-300"

{-| Color: amber-400
-}
amber_400 : Color
amber_400 =
    Color "amber-400"

{-| Color: amber-500
-}
amber_500 : Color
amber_500 =
    Color "amber-500"

{-| Color: amber-600
-}
amber_600 : Color
amber_600 =
    Color "amber-600"

{-| Color: amber-700
-}
amber_700 : Color
amber_700 =
    Color "amber-700"

{-| Color: amber-800
-}
amber_800 : Color
amber_800 =
    Color "amber-800"

{-| Color: amber-900
-}
amber_900 : Color
amber_900 =
    Color "amber-900"

{-| Color: amber-950
-}
amber_950 : Color
amber_950 =
    Color "amber-950"

{-| Color: yellow-50
-}
yellow_50 : Color
yellow_50 =
    Color "yellow-50"

{-| Color: yellow-100
-}
yellow_100 : Color
yellow_100 =
    Color "yellow-100"

{-| Color: yellow-200
-}
yellow_200 : Color
yellow_200 =
    Color "yellow-200"

{-| Color: yellow-300
-}
yellow_300 : Color
yellow_300 =
    Color "yellow-300"

{-| Color: yellow-400
-}
yellow_400 : Color
yellow_400 =
    Color "yellow-400"

{-| Color: yellow-500
-}
yellow_500 : Color
yellow_500 =
    Color "yellow-500"

{-| Color: yellow-600
-}
yellow_600 : Color
yellow_600 =
    Color "yellow-600"

{-| Color: yellow-700
-}
yellow_700 : Color
yellow_700 =
    Color "yellow-700"

{-| Color: yellow-800
-}
yellow_800 : Color
yellow_800 =
    Color "yellow-800"

{-| Color: yellow-900
-}
yellow_900 : Color
yellow_900 =
    Color "yellow-900"

{-| Color: yellow-950
-}
yellow_950 : Color
yellow_950 =
    Color "yellow-950"

{-| Color: lime-50
-}
lime_50 : Color
lime_50 =
    Color "lime-50"

{-| Color: lime-100
-}
lime_100 : Color
lime_100 =
    Color "lime-100"

{-| Color: lime-200
-}
lime_200 : Color
lime_200 =
    Color "lime-200"

{-| Color: lime-300
-}
lime_300 : Color
lime_300 =
    Color "lime-300"

{-| Color: lime-400
-}
lime_400 : Color
lime_400 =
    Color "lime-400"

{-| Color: lime-500
-}
lime_500 : Color
lime_500 =
    Color "lime-500"

{-| Color: lime-600
-}
lime_600 : Color
lime_600 =
    Color "lime-600"

{-| Color: lime-700
-}
lime_700 : Color
lime_700 =
    Color "lime-700"

{-| Color: lime-800
-}
lime_800 : Color
lime_800 =
    Color "lime-800"

{-| Color: lime-900
-}
lime_900 : Color
lime_900 =
    Color "lime-900"

{-| Color: lime-950
-}
lime_950 : Color
lime_950 =
    Color "lime-950"

{-| Color: green-50
-}
green_50 : Color
green_50 =
    Color "green-50"

{-| Color: green-100
-}
green_100 : Color
green_100 =
    Color "green-100"

{-| Color: green-200
-}
green_200 : Color
green_200 =
    Color "green-200"

{-| Color: green-300
-}
green_300 : Color
green_300 =
    Color "green-300"

{-| Color: green-400
-}
green_400 : Color
green_400 =
    Color "green-400"

{-| Color: green-500
-}
green_500 : Color
green_500 =
    Color "green-500"

{-| Color: green-600
-}
green_600 : Color
green_600 =
    Color "green-600"

{-| Color: green-700
-}
green_700 : Color
green_700 =
    Color "green-700"

{-| Color: green-800
-}
green_800 : Color
green_800 =
    Color "green-800"

{-| Color: green-900
-}
green_900 : Color
green_900 =
    Color "green-900"

{-| Color: green-950
-}
green_950 : Color
green_950 =
    Color "green-950"

{-| Color: emerald-50
-}
emerald_50 : Color
emerald_50 =
    Color "emerald-50"

{-| Color: emerald-100
-}
emerald_100 : Color
emerald_100 =
    Color "emerald-100"

{-| Color: emerald-200
-}
emerald_200 : Color
emerald_200 =
    Color "emerald-200"

{-| Color: emerald-300
-}
emerald_300 : Color
emerald_300 =
    Color "emerald-300"

{-| Color: emerald-400
-}
emerald_400 : Color
emerald_400 =
    Color "emerald-400"

{-| Color: emerald-500
-}
emerald_500 : Color
emerald_500 =
    Color "emerald-500"

{-| Color: emerald-600
-}
emerald_600 : Color
emerald_600 =
    Color "emerald-600"

{-| Color: emerald-700
-}
emerald_700 : Color
emerald_700 =
    Color "emerald-700"

{-| Color: emerald-800
-}
emerald_800 : Color
emerald_800 =
    Color "emerald-800"

{-| Color: emerald-900
-}
emerald_900 : Color
emerald_900 =
    Color "emerald-900"

{-| Color: emerald-950
-}
emerald_950 : Color
emerald_950 =
    Color "emerald-950"

{-| Color: teal-50
-}
teal_50 : Color
teal_50 =
    Color "teal-50"

{-| Color: teal-100
-}
teal_100 : Color
teal_100 =
    Color "teal-100"

{-| Color: teal-200
-}
teal_200 : Color
teal_200 =
    Color "teal-200"

{-| Color: teal-300
-}
teal_300 : Color
teal_300 =
    Color "teal-300"

{-| Color: teal-400
-}
teal_400 : Color
teal_400 =
    Color "teal-400"

{-| Color: teal-500
-}
teal_500 : Color
teal_500 =
    Color "teal-500"

{-| Color: teal-600
-}
teal_600 : Color
teal_600 =
    Color "teal-600"

{-| Color: teal-700
-}
teal_700 : Color
teal_700 =
    Color "teal-700"

{-| Color: teal-800
-}
teal_800 : Color
teal_800 =
    Color "teal-800"

{-| Color: teal-900
-}
teal_900 : Color
teal_900 =
    Color "teal-900"

{-| Color: teal-950
-}
teal_950 : Color
teal_950 =
    Color "teal-950"

{-| Color: cyan-50
-}
cyan_50 : Color
cyan_50 =
    Color "cyan-50"

{-| Color: cyan-100
-}
cyan_100 : Color
cyan_100 =
    Color "cyan-100"

{-| Color: cyan-200
-}
cyan_200 : Color
cyan_200 =
    Color "cyan-200"

{-| Color: cyan-300
-}
cyan_300 : Color
cyan_300 =
    Color "cyan-300"

{-| Color: cyan-400
-}
cyan_400 : Color
cyan_400 =
    Color "cyan-400"

{-| Color: cyan-500
-}
cyan_500 : Color
cyan_500 =
    Color "cyan-500"

{-| Color: cyan-600
-}
cyan_600 : Color
cyan_600 =
    Color "cyan-600"

{-| Color: cyan-700
-}
cyan_700 : Color
cyan_700 =
    Color "cyan-700"

{-| Color: cyan-800
-}
cyan_800 : Color
cyan_800 =
    Color "cyan-800"

{-| Color: cyan-900
-}
cyan_900 : Color
cyan_900 =
    Color "cyan-900"

{-| Color: cyan-950
-}
cyan_950 : Color
cyan_950 =
    Color "cyan-950"

{-| Color: sky-50
-}
sky_50 : Color
sky_50 =
    Color "sky-50"

{-| Color: sky-100
-}
sky_100 : Color
sky_100 =
    Color "sky-100"

{-| Color: sky-200
-}
sky_200 : Color
sky_200 =
    Color "sky-200"

{-| Color: sky-300
-}
sky_300 : Color
sky_300 =
    Color "sky-300"

{-| Color: sky-400
-}
sky_400 : Color
sky_400 =
    Color "sky-400"

{-| Color: sky-500
-}
sky_500 : Color
sky_500 =
    Color "sky-500"

{-| Color: sky-600
-}
sky_600 : Color
sky_600 =
    Color "sky-600"

{-| Color: sky-700
-}
sky_700 : Color
sky_700 =
    Color "sky-700"

{-| Color: sky-800
-}
sky_800 : Color
sky_800 =
    Color "sky-800"

{-| Color: sky-900
-}
sky_900 : Color
sky_900 =
    Color "sky-900"

{-| Color: sky-950
-}
sky_950 : Color
sky_950 =
    Color "sky-950"

{-| Color: blue-50
-}
blue_50 : Color
blue_50 =
    Color "blue-50"

{-| Color: blue-100
-}
blue_100 : Color
blue_100 =
    Color "blue-100"

{-| Color: blue-200
-}
blue_200 : Color
blue_200 =
    Color "blue-200"

{-| Color: blue-300
-}
blue_300 : Color
blue_300 =
    Color "blue-300"

{-| Color: blue-400
-}
blue_400 : Color
blue_400 =
    Color "blue-400"

{-| Color: blue-500
-}
blue_500 : Color
blue_500 =
    Color "blue-500"

{-| Color: blue-600
-}
blue_600 : Color
blue_600 =
    Color "blue-600"

{-| Color: blue-700
-}
blue_700 : Color
blue_700 =
    Color "blue-700"

{-| Color: blue-800
-}
blue_800 : Color
blue_800 =
    Color "blue-800"

{-| Color: blue-900
-}
blue_900 : Color
blue_900 =
    Color "blue-900"

{-| Color: blue-950
-}
blue_950 : Color
blue_950 =
    Color "blue-950"

{-| Color: indigo-50
-}
indigo_50 : Color
indigo_50 =
    Color "indigo-50"

{-| Color: indigo-100
-}
indigo_100 : Color
indigo_100 =
    Color "indigo-100"

{-| Color: indigo-200
-}
indigo_200 : Color
indigo_200 =
    Color "indigo-200"

{-| Color: indigo-300
-}
indigo_300 : Color
indigo_300 =
    Color "indigo-300"

{-| Color: indigo-400
-}
indigo_400 : Color
indigo_400 =
    Color "indigo-400"

{-| Color: indigo-500
-}
indigo_500 : Color
indigo_500 =
    Color "indigo-500"

{-| Color: indigo-600
-}
indigo_600 : Color
indigo_600 =
    Color "indigo-600"

{-| Color: indigo-700
-}
indigo_700 : Color
indigo_700 =
    Color "indigo-700"

{-| Color: indigo-800
-}
indigo_800 : Color
indigo_800 =
    Color "indigo-800"

{-| Color: indigo-900
-}
indigo_900 : Color
indigo_900 =
    Color "indigo-900"

{-| Color: indigo-950
-}
indigo_950 : Color
indigo_950 =
    Color "indigo-950"

{-| Color: violet-50
-}
violet_50 : Color
violet_50 =
    Color "violet-50"

{-| Color: violet-100
-}
violet_100 : Color
violet_100 =
    Color "violet-100"

{-| Color: violet-200
-}
violet_200 : Color
violet_200 =
    Color "violet-200"

{-| Color: violet-300
-}
violet_300 : Color
violet_300 =
    Color "violet-300"

{-| Color: violet-400
-}
violet_400 : Color
violet_400 =
    Color "violet-400"

{-| Color: violet-500
-}
violet_500 : Color
violet_500 =
    Color "violet-500"

{-| Color: violet-600
-}
violet_600 : Color
violet_600 =
    Color "violet-600"

{-| Color: violet-700
-}
violet_700 : Color
violet_700 =
    Color "violet-700"

{-| Color: violet-800
-}
violet_800 : Color
violet_800 =
    Color "violet-800"

{-| Color: violet-900
-}
violet_900 : Color
violet_900 =
    Color "violet-900"

{-| Color: violet-950
-}
violet_950 : Color
violet_950 =
    Color "violet-950"

{-| Color: purple-50
-}
purple_50 : Color
purple_50 =
    Color "purple-50"

{-| Color: purple-100
-}
purple_100 : Color
purple_100 =
    Color "purple-100"

{-| Color: purple-200
-}
purple_200 : Color
purple_200 =
    Color "purple-200"

{-| Color: purple-300
-}
purple_300 : Color
purple_300 =
    Color "purple-300"

{-| Color: purple-400
-}
purple_400 : Color
purple_400 =
    Color "purple-400"

{-| Color: purple-500
-}
purple_500 : Color
purple_500 =
    Color "purple-500"

{-| Color: purple-600
-}
purple_600 : Color
purple_600 =
    Color "purple-600"

{-| Color: purple-700
-}
purple_700 : Color
purple_700 =
    Color "purple-700"

{-| Color: purple-800
-}
purple_800 : Color
purple_800 =
    Color "purple-800"

{-| Color: purple-900
-}
purple_900 : Color
purple_900 =
    Color "purple-900"

{-| Color: purple-950
-}
purple_950 : Color
purple_950 =
    Color "purple-950"

{-| Color: fuchsia-50
-}
fuchsia_50 : Color
fuchsia_50 =
    Color "fuchsia-50"

{-| Color: fuchsia-100
-}
fuchsia_100 : Color
fuchsia_100 =
    Color "fuchsia-100"

{-| Color: fuchsia-200
-}
fuchsia_200 : Color
fuchsia_200 =
    Color "fuchsia-200"

{-| Color: fuchsia-300
-}
fuchsia_300 : Color
fuchsia_300 =
    Color "fuchsia-300"

{-| Color: fuchsia-400
-}
fuchsia_400 : Color
fuchsia_400 =
    Color "fuchsia-400"

{-| Color: fuchsia-500
-}
fuchsia_500 : Color
fuchsia_500 =
    Color "fuchsia-500"

{-| Color: fuchsia-600
-}
fuchsia_600 : Color
fuchsia_600 =
    Color "fuchsia-600"

{-| Color: fuchsia-700
-}
fuchsia_700 : Color
fuchsia_700 =
    Color "fuchsia-700"

{-| Color: fuchsia-800
-}
fuchsia_800 : Color
fuchsia_800 =
    Color "fuchsia-800"

{-| Color: fuchsia-900
-}
fuchsia_900 : Color
fuchsia_900 =
    Color "fuchsia-900"

{-| Color: fuchsia-950
-}
fuchsia_950 : Color
fuchsia_950 =
    Color "fuchsia-950"

{-| Color: pink-50
-}
pink_50 : Color
pink_50 =
    Color "pink-50"

{-| Color: pink-100
-}
pink_100 : Color
pink_100 =
    Color "pink-100"

{-| Color: pink-200
-}
pink_200 : Color
pink_200 =
    Color "pink-200"

{-| Color: pink-300
-}
pink_300 : Color
pink_300 =
    Color "pink-300"

{-| Color: pink-400
-}
pink_400 : Color
pink_400 =
    Color "pink-400"

{-| Color: pink-500
-}
pink_500 : Color
pink_500 =
    Color "pink-500"

{-| Color: pink-600
-}
pink_600 : Color
pink_600 =
    Color "pink-600"

{-| Color: pink-700
-}
pink_700 : Color
pink_700 =
    Color "pink-700"

{-| Color: pink-800
-}
pink_800 : Color
pink_800 =
    Color "pink-800"

{-| Color: pink-900
-}
pink_900 : Color
pink_900 =
    Color "pink-900"

{-| Color: pink-950
-}
pink_950 : Color
pink_950 =
    Color "pink-950"

{-| Color: rose-50
-}
rose_50 : Color
rose_50 =
    Color "rose-50"

{-| Color: rose-100
-}
rose_100 : Color
rose_100 =
    Color "rose-100"

{-| Color: rose-200
-}
rose_200 : Color
rose_200 =
    Color "rose-200"

{-| Color: rose-300
-}
rose_300 : Color
rose_300 =
    Color "rose-300"

{-| Color: rose-400
-}
rose_400 : Color
rose_400 =
    Color "rose-400"

{-| Color: rose-500
-}
rose_500 : Color
rose_500 =
    Color "rose-500"

{-| Color: rose-600
-}
rose_600 : Color
rose_600 =
    Color "rose-600"

{-| Color: rose-700
-}
rose_700 : Color
rose_700 =
    Color "rose-700"

{-| Color: rose-800
-}
rose_800 : Color
rose_800 =
    Color "rose-800"

{-| Color: rose-900
-}
rose_900 : Color
rose_900 =
    Color "rose-900"

{-| Color: rose-950
-}
rose_950 : Color
rose_950 =
    Color "rose-950"

{-| Color: slate-50
-}
slate_50 : Color
slate_50 =
    Color "slate-50"

{-| Color: slate-100
-}
slate_100 : Color
slate_100 =
    Color "slate-100"

{-| Color: slate-200
-}
slate_200 : Color
slate_200 =
    Color "slate-200"

{-| Color: slate-300
-}
slate_300 : Color
slate_300 =
    Color "slate-300"

{-| Color: slate-400
-}
slate_400 : Color
slate_400 =
    Color "slate-400"

{-| Color: slate-500
-}
slate_500 : Color
slate_500 =
    Color "slate-500"

{-| Color: slate-600
-}
slate_600 : Color
slate_600 =
    Color "slate-600"

{-| Color: slate-700
-}
slate_700 : Color
slate_700 =
    Color "slate-700"

{-| Color: slate-800
-}
slate_800 : Color
slate_800 =
    Color "slate-800"

{-| Color: slate-900
-}
slate_900 : Color
slate_900 =
    Color "slate-900"

{-| Color: slate-950
-}
slate_950 : Color
slate_950 =
    Color "slate-950"

{-| Color: gray-50
-}
gray_50 : Color
gray_50 =
    Color "gray-50"

{-| Color: gray-100
-}
gray_100 : Color
gray_100 =
    Color "gray-100"

{-| Color: gray-200
-}
gray_200 : Color
gray_200 =
    Color "gray-200"

{-| Color: gray-300
-}
gray_300 : Color
gray_300 =
    Color "gray-300"

{-| Color: gray-400
-}
gray_400 : Color
gray_400 =
    Color "gray-400"

{-| Color: gray-500
-}
gray_500 : Color
gray_500 =
    Color "gray-500"

{-| Color: gray-600
-}
gray_600 : Color
gray_600 =
    Color "gray-600"

{-| Color: gray-700
-}
gray_700 : Color
gray_700 =
    Color "gray-700"

{-| Color: gray-800
-}
gray_800 : Color
gray_800 =
    Color "gray-800"

{-| Color: gray-900
-}
gray_900 : Color
gray_900 =
    Color "gray-900"

{-| Color: gray-950
-}
gray_950 : Color
gray_950 =
    Color "gray-950"

{-| Color: zinc-50
-}
zinc_50 : Color
zinc_50 =
    Color "zinc-50"

{-| Color: zinc-100
-}
zinc_100 : Color
zinc_100 =
    Color "zinc-100"

{-| Color: zinc-200
-}
zinc_200 : Color
zinc_200 =
    Color "zinc-200"

{-| Color: zinc-300
-}
zinc_300 : Color
zinc_300 =
    Color "zinc-300"

{-| Color: zinc-400
-}
zinc_400 : Color
zinc_400 =
    Color "zinc-400"

{-| Color: zinc-500
-}
zinc_500 : Color
zinc_500 =
    Color "zinc-500"

{-| Color: zinc-600
-}
zinc_600 : Color
zinc_600 =
    Color "zinc-600"

{-| Color: zinc-700
-}
zinc_700 : Color
zinc_700 =
    Color "zinc-700"

{-| Color: zinc-800
-}
zinc_800 : Color
zinc_800 =
    Color "zinc-800"

{-| Color: zinc-900
-}
zinc_900 : Color
zinc_900 =
    Color "zinc-900"

{-| Color: zinc-950
-}
zinc_950 : Color
zinc_950 =
    Color "zinc-950"

{-| Color: neutral-50
-}
neutral_50 : Color
neutral_50 =
    Color "neutral-50"

{-| Color: neutral-100
-}
neutral_100 : Color
neutral_100 =
    Color "neutral-100"

{-| Color: neutral-200
-}
neutral_200 : Color
neutral_200 =
    Color "neutral-200"

{-| Color: neutral-300
-}
neutral_300 : Color
neutral_300 =
    Color "neutral-300"

{-| Color: neutral-400
-}
neutral_400 : Color
neutral_400 =
    Color "neutral-400"

{-| Color: neutral-500
-}
neutral_500 : Color
neutral_500 =
    Color "neutral-500"

{-| Color: neutral-600
-}
neutral_600 : Color
neutral_600 =
    Color "neutral-600"

{-| Color: neutral-700
-}
neutral_700 : Color
neutral_700 =
    Color "neutral-700"

{-| Color: neutral-800
-}
neutral_800 : Color
neutral_800 =
    Color "neutral-800"

{-| Color: neutral-900
-}
neutral_900 : Color
neutral_900 =
    Color "neutral-900"

{-| Color: neutral-950
-}
neutral_950 : Color
neutral_950 =
    Color "neutral-950"

{-| Color: stone-50
-}
stone_50 : Color
stone_50 =
    Color "stone-50"

{-| Color: stone-100
-}
stone_100 : Color
stone_100 =
    Color "stone-100"

{-| Color: stone-200
-}
stone_200 : Color
stone_200 =
    Color "stone-200"

{-| Color: stone-300
-}
stone_300 : Color
stone_300 =
    Color "stone-300"

{-| Color: stone-400
-}
stone_400 : Color
stone_400 =
    Color "stone-400"

{-| Color: stone-500
-}
stone_500 : Color
stone_500 =
    Color "stone-500"

{-| Color: stone-600
-}
stone_600 : Color
stone_600 =
    Color "stone-600"

{-| Color: stone-700
-}
stone_700 : Color
stone_700 =
    Color "stone-700"

{-| Color: stone-800
-}
stone_800 : Color
stone_800 =
    Color "stone-800"

{-| Color: stone-900
-}
stone_900 : Color
stone_900 =
    Color "stone-900"

{-| Color: stone-950
-}
stone_950 : Color
stone_950 =
    Color "stone-950"

{-| Color: black
-}
black : Color
black =
    Color "black"

{-| Color: white
-}
white : Color
white =
    Color "white"

-- SPACING VALUES

{-| Spacing: 0
-}
s0 : Spacing
s0 =
    S0

{-| Spacing: px
-}
spx : Spacing
spx =
    Spx

{-| Spacing: 0.5
-}
s0_dot_5 : Spacing
s0_dot_5 =
    S0_dot_5

{-| Spacing: 1
-}
s1 : Spacing
s1 =
    S1

{-| Spacing: 1.5
-}
s1_dot_5 : Spacing
s1_dot_5 =
    S1_dot_5

{-| Spacing: 2
-}
s2 : Spacing
s2 =
    S2

{-| Spacing: 2.5
-}
s2_dot_5 : Spacing
s2_dot_5 =
    S2_dot_5

{-| Spacing: 3
-}
s3 : Spacing
s3 =
    S3

{-| Spacing: 3.5
-}
s3_dot_5 : Spacing
s3_dot_5 =
    S3_dot_5

{-| Spacing: 4
-}
s4 : Spacing
s4 =
    S4

{-| Spacing: 5
-}
s5 : Spacing
s5 =
    S5

{-| Spacing: 6
-}
s6 : Spacing
s6 =
    S6

{-| Spacing: 7
-}
s7 : Spacing
s7 =
    S7

{-| Spacing: 8
-}
s8 : Spacing
s8 =
    S8

{-| Spacing: 9
-}
s9 : Spacing
s9 =
    S9

{-| Spacing: 10
-}
s10 : Spacing
s10 =
    S10

{-| Spacing: 11
-}
s11 : Spacing
s11 =
    S11

{-| Spacing: 12
-}
s12 : Spacing
s12 =
    S12

{-| Spacing: 14
-}
s14 : Spacing
s14 =
    S14

{-| Spacing: 16
-}
s16 : Spacing
s16 =
    S16

{-| Spacing: 20
-}
s20 : Spacing
s20 =
    S20

{-| Spacing: 24
-}
s24 : Spacing
s24 =
    S24

{-| Spacing: 28
-}
s28 : Spacing
s28 =
    S28

{-| Spacing: 32
-}
s32 : Spacing
s32 =
    S32

{-| Spacing: 36
-}
s36 : Spacing
s36 =
    S36

{-| Spacing: 40
-}
s40 : Spacing
s40 =
    S40

{-| Spacing: 44
-}
s44 : Spacing
s44 =
    S44

{-| Spacing: 48
-}
s48 : Spacing
s48 =
    S48

{-| Spacing: 52
-}
s52 : Spacing
s52 =
    S52

{-| Spacing: 56
-}
s56 : Spacing
s56 =
    S56

{-| Spacing: 60
-}
s60 : Spacing
s60 =
    S60

{-| Spacing: 64
-}
s64 : Spacing
s64 =
    S64

{-| Spacing: 72
-}
s72 : Spacing
s72 =
    S72

{-| Spacing: 80
-}
s80 : Spacing
s80 =
    S80

{-| Spacing: 96
-}
s96 : Spacing
s96 =
    S96

{-| Opacity 0%
-}
opacity0 : Opacity
opacity0 =
    Opacity 0

{-| Opacity 5%
-}
opacity5 : Opacity
opacity5 =
    Opacity 5

{-| Opacity 10%
-}
opacity10 : Opacity
opacity10 =
    Opacity 10

{-| Opacity 20%
-}
opacity20 : Opacity
opacity20 =
    Opacity 20

{-| Opacity 25%
-}
opacity25 : Opacity
opacity25 =
    Opacity 25

{-| Opacity 30%
-}
opacity30 : Opacity
opacity30 =
    Opacity 30

{-| Opacity 40%
-}
opacity40 : Opacity
opacity40 =
    Opacity 40

{-| Opacity 50%
-}
opacity50 : Opacity
opacity50 =
    Opacity 50

{-| Opacity 60%
-}
opacity60 : Opacity
opacity60 =
    Opacity 60

{-| Opacity 70%
-}
opacity70 : Opacity
opacity70 =
    Opacity 70

{-| Opacity 75%
-}
opacity75 : Opacity
opacity75 =
    Opacity 75

{-| Opacity 80%
-}
opacity80 : Opacity
opacity80 =
    Opacity 80

{-| Opacity 90%
-}
opacity90 : Opacity
opacity90 =
    Opacity 90

{-| Opacity 95%
-}
opacity95 : Opacity
opacity95 =
    Opacity 95

{-| Opacity 100%
-}
opacity100 : Opacity
opacity100 =
    Opacity 100
