module Tailwind.Theme exposing
    ( Color, colorToString
    , red, orange, amber, yellow, lime, green, emerald, teal, cyan, sky, blue, indigo, violet, purple, fuchsia, pink, rose, slate, gray, zinc, neutral, stone
    , Shade, shadeToString, s50, s100, s200, s300, s400, s500, s600, s700, s800, s900, s950
    , black, white, transparent, currentColor, inherit
    , Spacing(..), spacingToString, s0, spx, s0_dot_5, s1, s1_dot_5, s2, s2_dot_5, s3, s3_dot_5, s4, s5, s6, s7, s8, s9, s10, s11, s12, s14, s16, s20, s24, s28, s32, s36, s40, s44, s48, s52, s56, s60, s64, s72, s80, s96
    , Opacity(..), opacity0, opacity5, opacity10, opacity20, opacity25, opacity30, opacity40, opacity50, opacity60, opacity70, opacity75, opacity80, opacity90, opacity95, opacity100
    )

{-| Theme values for Tailwind CSS.

This module provides type-safe color, shade, spacing, and opacity values.


## Color Type

@docs Color, colorToString


## Shaded Colors

Colors that take a shade parameter. Usage: `text_color (blue s500)`

@docs red, orange, amber, yellow, lime, green, emerald, teal, cyan, sky, blue, indigo, violet, purple, fuchsia, pink, rose, slate, gray, zinc, neutral, stone


## Shades

@docs Shade, shadeToString, s50, s100, s200, s300, s400, s500, s600, s700, s800, s900, s950


## Simple Colors

Colors without shades. Usage: `text_color white`

@docs black, white, transparent, currentColor, inherit


## Spacing

@docs Spacing, spacingToString, s0, spx, s0_dot_5, s1, s1_dot_5, s2, s2_dot_5, s3, s3_dot_5, s4, s5, s6, s7, s8, s9, s10, s11, s12, s14, s16, s20, s24, s28, s32, s36, s40, s44, s48, s52, s56, s60, s64, s72, s80, s96


## Opacities

@docs Opacity, opacity0, opacity5, opacity10, opacity20, opacity25, opacity30, opacity40, opacity50, opacity60, opacity70, opacity75, opacity80, opacity90, opacity95, opacity100

-}


{-| A color value that can be used with color utilities like `text_color`, `bg_color`, etc.

Colors are either shaded (created by applying a shade to a color name like `blue s500`)
or simple (like `white`, `black`, `transparent`).

-}
type Color
    = Color String


{-| Convert a Color to its CSS class string suffix.
-}
colorToString : Color -> String
colorToString (Color str) =
    str


{-| A color shade (50, 100, 200, ... 950).

Represents the lightness level where 50 is lightest and 950 is darkest.

-}
type Shade
    = S50
    | S100
    | S200
    | S300
    | S400
    | S500
    | S600
    | S700
    | S800
    | S900
    | S950


{-| Convert a Shade to its CSS class string.
-}
shadeToString : Shade -> String
shadeToString shade =
    case shade of
        S50 ->
            "50"

        S100 ->
            "100"

        S200 ->
            "200"

        S300 ->
            "300"

        S400 ->
            "400"

        S500 ->
            "500"

        S600 ->
            "600"

        S700 ->
            "700"

        S800 ->
            "800"

        S900 ->
            "900"

        S950 ->
            "950"


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



-- SHADED COLORS


{-| Red color. Apply a shade: `red s500`
-}
red : Shade -> Color
red shade =
    Color ("red-" ++ shadeToString shade)


{-| Orange color. Apply a shade: `orange s500`
-}
orange : Shade -> Color
orange shade =
    Color ("orange-" ++ shadeToString shade)


{-| Amber color. Apply a shade: `amber s500`
-}
amber : Shade -> Color
amber shade =
    Color ("amber-" ++ shadeToString shade)


{-| Yellow color. Apply a shade: `yellow s500`
-}
yellow : Shade -> Color
yellow shade =
    Color ("yellow-" ++ shadeToString shade)


{-| Lime color. Apply a shade: `lime s500`
-}
lime : Shade -> Color
lime shade =
    Color ("lime-" ++ shadeToString shade)


{-| Green color. Apply a shade: `green s500`
-}
green : Shade -> Color
green shade =
    Color ("green-" ++ shadeToString shade)


{-| Emerald color. Apply a shade: `emerald s500`
-}
emerald : Shade -> Color
emerald shade =
    Color ("emerald-" ++ shadeToString shade)


{-| Teal color. Apply a shade: `teal s500`
-}
teal : Shade -> Color
teal shade =
    Color ("teal-" ++ shadeToString shade)


{-| Cyan color. Apply a shade: `cyan s500`
-}
cyan : Shade -> Color
cyan shade =
    Color ("cyan-" ++ shadeToString shade)


{-| Sky color. Apply a shade: `sky s500`
-}
sky : Shade -> Color
sky shade =
    Color ("sky-" ++ shadeToString shade)


{-| Blue color. Apply a shade: `blue s500`
-}
blue : Shade -> Color
blue shade =
    Color ("blue-" ++ shadeToString shade)


{-| Indigo color. Apply a shade: `indigo s500`
-}
indigo : Shade -> Color
indigo shade =
    Color ("indigo-" ++ shadeToString shade)


{-| Violet color. Apply a shade: `violet s500`
-}
violet : Shade -> Color
violet shade =
    Color ("violet-" ++ shadeToString shade)


{-| Purple color. Apply a shade: `purple s500`
-}
purple : Shade -> Color
purple shade =
    Color ("purple-" ++ shadeToString shade)


{-| Fuchsia color. Apply a shade: `fuchsia s500`
-}
fuchsia : Shade -> Color
fuchsia shade =
    Color ("fuchsia-" ++ shadeToString shade)


{-| Pink color. Apply a shade: `pink s500`
-}
pink : Shade -> Color
pink shade =
    Color ("pink-" ++ shadeToString shade)


{-| Rose color. Apply a shade: `rose s500`
-}
rose : Shade -> Color
rose shade =
    Color ("rose-" ++ shadeToString shade)


{-| Slate color. Apply a shade: `slate s500`
-}
slate : Shade -> Color
slate shade =
    Color ("slate-" ++ shadeToString shade)


{-| Gray color. Apply a shade: `gray s500`
-}
gray : Shade -> Color
gray shade =
    Color ("gray-" ++ shadeToString shade)


{-| Zinc color. Apply a shade: `zinc s500`
-}
zinc : Shade -> Color
zinc shade =
    Color ("zinc-" ++ shadeToString shade)


{-| Neutral color. Apply a shade: `neutral s500`
-}
neutral : Shade -> Color
neutral shade =
    Color ("neutral-" ++ shadeToString shade)


{-| Stone color. Apply a shade: `stone s500`
-}
stone : Shade -> Color
stone shade =
    Color ("stone-" ++ shadeToString shade)



-- SHADES


{-| Shade 50 (lightest)
-}
s50 : Shade
s50 =
    S50


{-| Shade 100
-}
s100 : Shade
s100 =
    S100


{-| Shade 200
-}
s200 : Shade
s200 =
    S200


{-| Shade 300
-}
s300 : Shade
s300 =
    S300


{-| Shade 400
-}
s400 : Shade
s400 =
    S400


{-| Shade 500 (medium)
-}
s500 : Shade
s500 =
    S500


{-| Shade 600
-}
s600 : Shade
s600 =
    S600


{-| Shade 700
-}
s700 : Shade
s700 =
    S700


{-| Shade 800
-}
s800 : Shade
s800 =
    S800


{-| Shade 900
-}
s900 : Shade
s900 =
    S900


{-| Shade 950 (darkest)
-}
s950 : Shade
s950 =
    S950



-- SIMPLE COLORS


{-| Black color. Usage: `text_color black`
-}
black : Color
black =
    Color "black"


{-| White color. Usage: `text_color white`
-}
white : Color
white =
    Color "white"


{-| Transparent color. Usage: `bg_color transparent`
-}
transparent : Color
transparent =
    Color "transparent"


{-| Current color (inherits from text color). Usage: `border_color currentColor`
-}
currentColor : Color
currentColor =
    Color "current"


{-| Inherit color. Usage: `text_color inherit`
-}
inherit : Color
inherit =
    Color "inherit"



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



-- OPACITY VALUES


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
