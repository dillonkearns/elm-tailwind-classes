module Tailwind.Utilities exposing (..)

{-| Tailwind CSS utility classes (codegen structure).
-}

import Tailwind exposing (Tailwind(..))
import Tailwind.Theme exposing (Color, SimpleColor(..), Spacing, colorToString, spacingToString)


-- LAYOUT


flex : Tailwind
flex =
    Tailwind "flex"


items_center : Tailwind
items_center =
    Tailwind "items-center"


h_screen : Tailwind
h_screen =
    Tailwind "h-screen"



-- SPACING (parameterized)


p : Spacing -> Tailwind
p spacing =
    Tailwind ("p-" ++ spacingToString spacing)


px : Spacing -> Tailwind
px spacing =
    Tailwind ("px-" ++ spacingToString spacing)


py : Spacing -> Tailwind
py spacing =
    Tailwind ("py-" ++ spacingToString spacing)


mb : Spacing -> Tailwind
mb spacing =
    Tailwind ("mb-" ++ spacingToString spacing)


mt : Spacing -> Tailwind
mt spacing =
    Tailwind ("mt-" ++ spacingToString spacing)


gap : Spacing -> Tailwind
gap spacing =
    Tailwind ("gap-" ++ spacingToString spacing)



-- TYPOGRAPHY


text_n3xl : Tailwind
text_n3xl =
    Tailwind "text-3xl"


text_sm : Tailwind
text_sm =
    Tailwind "text-sm"


text_base : Tailwind
text_base =
    Tailwind "text-base"


text_lg : Tailwind
text_lg =
    Tailwind "text-lg"


font_bold : Tailwind
font_bold =
    Tailwind "font-bold"


font_semibold : Tailwind
font_semibold =
    Tailwind "font-semibold"



-- COLORS


text_color : Color -> Tailwind
text_color color =
    Tailwind ("text-" ++ colorToString color)


bg_color : Color -> Tailwind
bg_color color =
    Tailwind ("bg-" ++ colorToString color)


text_simple : SimpleColor -> Tailwind
text_simple (SimpleColor color) =
    Tailwind ("text-" ++ color)


bg_simple : SimpleColor -> Tailwind
bg_simple (SimpleColor color) =
    Tailwind ("bg-" ++ color)



-- BORDERS


rounded_lg : Tailwind
rounded_lg =
    Tailwind "rounded-lg"



-- EFFECTS


shadow_md : Tailwind
shadow_md =
    Tailwind "shadow-md"


shadow_lg : Tailwind
shadow_lg =
    Tailwind "shadow-lg"


transition : Tailwind
transition =
    Tailwind "transition"
