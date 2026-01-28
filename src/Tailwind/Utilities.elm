module Tailwind.Utilities exposing
    ( p
    , px
    , py
    , pt
    , pr
    , pb
    , pl
    , m
    , mx
    , my
    , mt
    , mr
    , mb
    , ml
    , neg_m
    , neg_mx
    , neg_my
    , neg_mt
    , neg_mr
    , neg_mb
    , neg_ml
    , gap
    , gap_x
    , gap_y
    , flex
    , inline_flex
    , block
    , inline_block
    , inline
    , grid
    , hidden
    , flex_row
    , flex_row_reverse
    , flex_col
    , flex_col_reverse
    , flex_wrap
    , flex_wrap_reverse
    , flex_nowrap
    , grow
    , grow_0
    , shrink
    , shrink_0
    , items_start
    , items_end
    , items_center
    , items_baseline
    , items_stretch
    , justify_start
    , justify_end
    , justify_center
    , justify_between
    , justify_around
    , justify_evenly
    , relative
    , absolute
    , fixed
    , sticky
    , static
    , visible
    , invisible
    , overflow_auto
    , overflow_hidden
    , overflow_visible
    , overflow_scroll
    , overflow_x_auto
    , overflow_y_auto
    , overflow_x_hidden
    , overflow_y_hidden
    , w
    , w_1over2
    , w_1over3
    , w_2over3
    , w_1over4
    , w_2over4
    , w_3over4
    , w_1over5
    , w_2over5
    , w_3over5
    , w_4over5
    , w_1over6
    , w_2over6
    , w_3over6
    , w_4over6
    , w_5over6
    , w_1over12
    , w_2over12
    , w_3over12
    , w_4over12
    , w_5over12
    , w_6over12
    , w_7over12
    , w_8over12
    , w_9over12
    , w_10over12
    , w_11over12
    , w_full
    , w_screen
    , w_auto
    , w_min
    , w_max
    , w_fit
    , h
    , h_1over2
    , h_1over3
    , h_2over3
    , h_1over4
    , h_2over4
    , h_3over4
    , h_1over5
    , h_2over5
    , h_3over5
    , h_4over5
    , h_1over6
    , h_2over6
    , h_3over6
    , h_4over6
    , h_5over6
    , h_1over12
    , h_2over12
    , h_3over12
    , h_4over12
    , h_5over12
    , h_6over12
    , h_7over12
    , h_8over12
    , h_9over12
    , h_10over12
    , h_11over12
    , h_full
    , h_screen
    , h_auto
    , h_min
    , h_max
    , h_fit
    , min_w
    , max_w
    , min_h
    , max_h
    , text_left
    , text_center
    , text_right
    , text_justify
    , font_sans
    , font_serif
    , font_mono
    , italic
    , not_italic
    , uppercase
    , lowercase
    , capitalize
    , normal_case
    , underline
    , line_through
    , no_underline
    , whitespace_normal
    , whitespace_nowrap
    , whitespace_pre
    , whitespace_pre_line
    , whitespace_pre_wrap
    , truncate
    , text_ellipsis
    , text_clip
    , text_xs
    , text_sm
    , text_base
    , text_lg
    , text_xl
    , text_n2xl
    , text_n3xl
    , text_n4xl
    , text_n5xl
    , text_n6xl
    , text_n7xl
    , text_n8xl
    , text_n9xl
    , font_thin
    , font_extralight
    , font_light
    , font_normal
    , font_medium
    , font_semibold
    , font_bold
    , font_extrabold
    , font_black
    , border
    , border_0
    , border_2
    , border_4
    , border_8
    , border_t
    , border_r
    , border_b
    , border_l
    , rounded
    , rounded_none
    , rounded_full
    , rounded_xs
    , rounded_sm
    , rounded_md
    , rounded_lg
    , rounded_xl
    , rounded_n2xl
    , rounded_n3xl
    , rounded_n4xl
    , shadow
    , shadow_none
    , transition
    , transition_all
    , transition_none
    , transition_colors
    , transition_opacity
    , transition_shadow
    , transition_transform
    , animate_none
    , animate_spin
    , animate_ping
    , animate_pulse
    , animate_bounce
    , cursor_auto
    , cursor_default
    , cursor_pointer
    , cursor_wait
    , cursor_text
    , cursor_move
    , cursor_not_allowed
    , pointer_events_none
    , pointer_events_auto
    , select_none
    , select_text
    , select_all
    , select_auto
    , shadow_n2xs
    , shadow_xs
    , shadow_sm
    , shadow_md
    , shadow_lg
    , shadow_xl
    , shadow_n2xl
    , shadow_inner
    , text_color
    , bg_color
    , border_color
    , ring_color
    , placeholder_color
    , opacity_0
    , opacity_5
    , opacity_10
    , opacity_20
    , opacity_25
    , opacity_30
    , opacity_40
    , opacity_50
    , opacity_60
    , opacity_70
    , opacity_75
    , opacity_80
    , opacity_90
    , opacity_95
    , opacity_100
    , z_0
    , z_10
    , z_20
    , z_30
    , z_40
    , z_50
    , z_auto
    )

{-| Tailwind CSS utility classes as Elm functions.

Following elm-tailwind-modules naming conventions:
- Hyphens become underscores: `flex-col` → `flex_col`
- Numeric prefixes get 'n': `2xl` → `n2xl`
- Fractions use 'over': `w-1/2` → `w_1over2`
- Decimals use '_dot_': `p-0.5` → `p_0_dot_5`


## Spacing (Type-Safe)

@docs p, px, py, pt, pr, pb, pl, m, mx, my, mt, mr, mb, ml, neg_m, neg_mx, neg_my, gap, gap_x, gap_y


## Layout

@docs flex, grid, block, hidden, flex_row, flex_col, items_center, justify_center


## Sizing

@docs w, h, min_w, max_w, min_h, max_h, w_full, h_full, w_screen, h_screen, w_1over2, w_1over3, h_1over2


## Typography

@docs text_left, text_center, text_right, text_xs, text_sm, text_base, text_lg, text_xl


## Colors

@docs text_color, bg_color, border_color


## Effects

@docs shadow, rounded, transition

-}

import Html exposing (Attribute)
import Html.Attributes exposing (class)
import Tailwind.Theme exposing (Color(..), Spacing(..), spacingToString)


-- SPACING

-- PADDING

{-| Padding on all sides.

    p s4  -- produces "p-4" (1rem)

-}
p : Spacing -> Attribute msg
p spacing =
    class ("p-" ++ spacingToString spacing)


{-| Horizontal padding (left and right).
-}
px : Spacing -> Attribute msg
px spacing =
    class ("px-" ++ spacingToString spacing)


{-| Vertical padding (top and bottom).
-}
py : Spacing -> Attribute msg
py spacing =
    class ("py-" ++ spacingToString spacing)


{-| Top padding.
-}
pt : Spacing -> Attribute msg
pt spacing =
    class ("pt-" ++ spacingToString spacing)


{-| Right padding.
-}
pr : Spacing -> Attribute msg
pr spacing =
    class ("pr-" ++ spacingToString spacing)


{-| Bottom padding.
-}
pb : Spacing -> Attribute msg
pb spacing =
    class ("pb-" ++ spacingToString spacing)


{-| Left padding.
-}
pl : Spacing -> Attribute msg
pl spacing =
    class ("pl-" ++ spacingToString spacing)


-- MARGIN

{-| Margin on all sides.

    m s4  -- produces "m-4" (1rem)

-}
m : Spacing -> Attribute msg
m spacing =
    class ("m-" ++ spacingToString spacing)


{-| Horizontal margin (left and right).
-}
mx : Spacing -> Attribute msg
mx spacing =
    class ("mx-" ++ spacingToString spacing)


{-| Vertical margin (top and bottom).
-}
my : Spacing -> Attribute msg
my spacing =
    class ("my-" ++ spacingToString spacing)


{-| Top margin.
-}
mt : Spacing -> Attribute msg
mt spacing =
    class ("mt-" ++ spacingToString spacing)


{-| Right margin.
-}
mr : Spacing -> Attribute msg
mr spacing =
    class ("mr-" ++ spacingToString spacing)


{-| Bottom margin.
-}
mb : Spacing -> Attribute msg
mb spacing =
    class ("mb-" ++ spacingToString spacing)


{-| Left margin.
-}
ml : Spacing -> Attribute msg
ml spacing =
    class ("ml-" ++ spacingToString spacing)


-- NEGATIVE MARGIN

{-| Negative margin on all sides.
-}
neg_m : Spacing -> Attribute msg
neg_m spacing =
    class ("-m-" ++ spacingToString spacing)


{-| Negative horizontal margin.
-}
neg_mx : Spacing -> Attribute msg
neg_mx spacing =
    class ("-mx-" ++ spacingToString spacing)


{-| Negative vertical margin.
-}
neg_my : Spacing -> Attribute msg
neg_my spacing =
    class ("-my-" ++ spacingToString spacing)


{-| Negative top margin.
-}
neg_mt : Spacing -> Attribute msg
neg_mt spacing =
    class ("-mt-" ++ spacingToString spacing)


{-| Negative right margin.
-}
neg_mr : Spacing -> Attribute msg
neg_mr spacing =
    class ("-mr-" ++ spacingToString spacing)


{-| Negative bottom margin.
-}
neg_mb : Spacing -> Attribute msg
neg_mb spacing =
    class ("-mb-" ++ spacingToString spacing)


{-| Negative left margin.
-}
neg_ml : Spacing -> Attribute msg
neg_ml spacing =
    class ("-ml-" ++ spacingToString spacing)


-- GAP

{-| Gap between flex/grid items.

    gap s4  -- produces "gap-4"

-}
gap : Spacing -> Attribute msg
gap spacing =
    class ("gap-" ++ spacingToString spacing)


{-| Horizontal gap.
-}
gap_x : Spacing -> Attribute msg
gap_x spacing =
    class ("gap-x-" ++ spacingToString spacing)


{-| Vertical gap.
-}
gap_y : Spacing -> Attribute msg
gap_y spacing =
    class ("gap-y-" ++ spacingToString spacing)



-- DISPLAY

{-| display: flex
-}
flex : Attribute msg
flex =
    class "flex"


{-| display: inline-flex
-}
inline_flex : Attribute msg
inline_flex =
    class "inline-flex"


{-| display: block
-}
block : Attribute msg
block =
    class "block"


{-| display: inline-block
-}
inline_block : Attribute msg
inline_block =
    class "inline-block"


{-| display: inline
-}
inline : Attribute msg
inline =
    class "inline"


{-| display: grid
-}
grid : Attribute msg
grid =
    class "grid"


{-| display: none
-}
hidden : Attribute msg
hidden =
    class "hidden"


-- FLEX DIRECTION

{-| flex-direction: row
-}
flex_row : Attribute msg
flex_row =
    class "flex-row"


{-| flex-direction: row-reverse
-}
flex_row_reverse : Attribute msg
flex_row_reverse =
    class "flex-row-reverse"


{-| flex-direction: column
-}
flex_col : Attribute msg
flex_col =
    class "flex-col"


{-| flex-direction: column-reverse
-}
flex_col_reverse : Attribute msg
flex_col_reverse =
    class "flex-col-reverse"


-- FLEX WRAP

flex_wrap : Attribute msg
flex_wrap =
    class "flex-wrap"


flex_wrap_reverse : Attribute msg
flex_wrap_reverse =
    class "flex-wrap-reverse"


flex_nowrap : Attribute msg
flex_nowrap =
    class "flex-nowrap"


-- FLEX GROW/SHRINK

grow : Attribute msg
grow =
    class "grow"


grow_0 : Attribute msg
grow_0 =
    class "grow-0"


shrink : Attribute msg
shrink =
    class "shrink"


shrink_0 : Attribute msg
shrink_0 =
    class "shrink-0"


-- ALIGN ITEMS

items_start : Attribute msg
items_start =
    class "items-start"


items_end : Attribute msg
items_end =
    class "items-end"


items_center : Attribute msg
items_center =
    class "items-center"


items_baseline : Attribute msg
items_baseline =
    class "items-baseline"


items_stretch : Attribute msg
items_stretch =
    class "items-stretch"


-- JUSTIFY CONTENT

justify_start : Attribute msg
justify_start =
    class "justify-start"


justify_end : Attribute msg
justify_end =
    class "justify-end"


justify_center : Attribute msg
justify_center =
    class "justify-center"


justify_between : Attribute msg
justify_between =
    class "justify-between"


justify_around : Attribute msg
justify_around =
    class "justify-around"


justify_evenly : Attribute msg
justify_evenly =
    class "justify-evenly"


-- POSITIONING

relative : Attribute msg
relative =
    class "relative"


absolute : Attribute msg
absolute =
    class "absolute"


fixed : Attribute msg
fixed =
    class "fixed"


sticky : Attribute msg
sticky =
    class "sticky"


static : Attribute msg
static =
    class "static"


-- VISIBILITY

visible : Attribute msg
visible =
    class "visible"


invisible : Attribute msg
invisible =
    class "invisible"


-- OVERFLOW

overflow_auto : Attribute msg
overflow_auto =
    class "overflow-auto"


overflow_hidden : Attribute msg
overflow_hidden =
    class "overflow-hidden"


overflow_visible : Attribute msg
overflow_visible =
    class "overflow-visible"


overflow_scroll : Attribute msg
overflow_scroll =
    class "overflow-scroll"


overflow_x_auto : Attribute msg
overflow_x_auto =
    class "overflow-x-auto"


overflow_y_auto : Attribute msg
overflow_y_auto =
    class "overflow-y-auto"


overflow_x_hidden : Attribute msg
overflow_x_hidden =
    class "overflow-x-hidden"


overflow_y_hidden : Attribute msg
overflow_y_hidden =
    class "overflow-y-hidden"


-- SIZING

-- WIDTH (using Spacing)

{-| Width from spacing scale.

    w s64  -- produces "w-64" (16rem)

-}
w : Spacing -> Attribute msg
w spacing =
    class ("w-" ++ spacingToString spacing)


-- WIDTH FRACTIONS

{-| Width 1/2
-}
w_1over2 : Attribute msg
w_1over2 =
    class "w-1/2"

{-| Width 1/3
-}
w_1over3 : Attribute msg
w_1over3 =
    class "w-1/3"

{-| Width 2/3
-}
w_2over3 : Attribute msg
w_2over3 =
    class "w-2/3"

{-| Width 1/4
-}
w_1over4 : Attribute msg
w_1over4 =
    class "w-1/4"

{-| Width 2/4
-}
w_2over4 : Attribute msg
w_2over4 =
    class "w-2/4"

{-| Width 3/4
-}
w_3over4 : Attribute msg
w_3over4 =
    class "w-3/4"

{-| Width 1/5
-}
w_1over5 : Attribute msg
w_1over5 =
    class "w-1/5"

{-| Width 2/5
-}
w_2over5 : Attribute msg
w_2over5 =
    class "w-2/5"

{-| Width 3/5
-}
w_3over5 : Attribute msg
w_3over5 =
    class "w-3/5"

{-| Width 4/5
-}
w_4over5 : Attribute msg
w_4over5 =
    class "w-4/5"

{-| Width 1/6
-}
w_1over6 : Attribute msg
w_1over6 =
    class "w-1/6"

{-| Width 2/6
-}
w_2over6 : Attribute msg
w_2over6 =
    class "w-2/6"

{-| Width 3/6
-}
w_3over6 : Attribute msg
w_3over6 =
    class "w-3/6"

{-| Width 4/6
-}
w_4over6 : Attribute msg
w_4over6 =
    class "w-4/6"

{-| Width 5/6
-}
w_5over6 : Attribute msg
w_5over6 =
    class "w-5/6"

{-| Width 1/12
-}
w_1over12 : Attribute msg
w_1over12 =
    class "w-1/12"

{-| Width 2/12
-}
w_2over12 : Attribute msg
w_2over12 =
    class "w-2/12"

{-| Width 3/12
-}
w_3over12 : Attribute msg
w_3over12 =
    class "w-3/12"

{-| Width 4/12
-}
w_4over12 : Attribute msg
w_4over12 =
    class "w-4/12"

{-| Width 5/12
-}
w_5over12 : Attribute msg
w_5over12 =
    class "w-5/12"

{-| Width 6/12
-}
w_6over12 : Attribute msg
w_6over12 =
    class "w-6/12"

{-| Width 7/12
-}
w_7over12 : Attribute msg
w_7over12 =
    class "w-7/12"

{-| Width 8/12
-}
w_8over12 : Attribute msg
w_8over12 =
    class "w-8/12"

{-| Width 9/12
-}
w_9over12 : Attribute msg
w_9over12 =
    class "w-9/12"

{-| Width 10/12
-}
w_10over12 : Attribute msg
w_10over12 =
    class "w-10/12"

{-| Width 11/12
-}
w_11over12 : Attribute msg
w_11over12 =
    class "w-11/12"


-- WIDTH KEYWORDS

{-| Full width (100%).
-}
w_full : Attribute msg
w_full =
    class "w-full"


{-| Screen width (100vw).
-}
w_screen : Attribute msg
w_screen =
    class "w-screen"


{-| Auto width.
-}
w_auto : Attribute msg
w_auto =
    class "w-auto"


{-| Min-content width.
-}
w_min : Attribute msg
w_min =
    class "w-min"


{-| Max-content width.
-}
w_max : Attribute msg
w_max =
    class "w-max"


{-| Fit-content width.
-}
w_fit : Attribute msg
w_fit =
    class "w-fit"


-- HEIGHT (using Spacing)

{-| Height from spacing scale.

    h s32  -- produces "h-32" (8rem)

-}
h : Spacing -> Attribute msg
h spacing =
    class ("h-" ++ spacingToString spacing)


-- HEIGHT FRACTIONS

{-| Height 1/2
-}
h_1over2 : Attribute msg
h_1over2 =
    class "h-1/2"

{-| Height 1/3
-}
h_1over3 : Attribute msg
h_1over3 =
    class "h-1/3"

{-| Height 2/3
-}
h_2over3 : Attribute msg
h_2over3 =
    class "h-2/3"

{-| Height 1/4
-}
h_1over4 : Attribute msg
h_1over4 =
    class "h-1/4"

{-| Height 2/4
-}
h_2over4 : Attribute msg
h_2over4 =
    class "h-2/4"

{-| Height 3/4
-}
h_3over4 : Attribute msg
h_3over4 =
    class "h-3/4"

{-| Height 1/5
-}
h_1over5 : Attribute msg
h_1over5 =
    class "h-1/5"

{-| Height 2/5
-}
h_2over5 : Attribute msg
h_2over5 =
    class "h-2/5"

{-| Height 3/5
-}
h_3over5 : Attribute msg
h_3over5 =
    class "h-3/5"

{-| Height 4/5
-}
h_4over5 : Attribute msg
h_4over5 =
    class "h-4/5"

{-| Height 1/6
-}
h_1over6 : Attribute msg
h_1over6 =
    class "h-1/6"

{-| Height 2/6
-}
h_2over6 : Attribute msg
h_2over6 =
    class "h-2/6"

{-| Height 3/6
-}
h_3over6 : Attribute msg
h_3over6 =
    class "h-3/6"

{-| Height 4/6
-}
h_4over6 : Attribute msg
h_4over6 =
    class "h-4/6"

{-| Height 5/6
-}
h_5over6 : Attribute msg
h_5over6 =
    class "h-5/6"

{-| Height 1/12
-}
h_1over12 : Attribute msg
h_1over12 =
    class "h-1/12"

{-| Height 2/12
-}
h_2over12 : Attribute msg
h_2over12 =
    class "h-2/12"

{-| Height 3/12
-}
h_3over12 : Attribute msg
h_3over12 =
    class "h-3/12"

{-| Height 4/12
-}
h_4over12 : Attribute msg
h_4over12 =
    class "h-4/12"

{-| Height 5/12
-}
h_5over12 : Attribute msg
h_5over12 =
    class "h-5/12"

{-| Height 6/12
-}
h_6over12 : Attribute msg
h_6over12 =
    class "h-6/12"

{-| Height 7/12
-}
h_7over12 : Attribute msg
h_7over12 =
    class "h-7/12"

{-| Height 8/12
-}
h_8over12 : Attribute msg
h_8over12 =
    class "h-8/12"

{-| Height 9/12
-}
h_9over12 : Attribute msg
h_9over12 =
    class "h-9/12"

{-| Height 10/12
-}
h_10over12 : Attribute msg
h_10over12 =
    class "h-10/12"

{-| Height 11/12
-}
h_11over12 : Attribute msg
h_11over12 =
    class "h-11/12"


-- HEIGHT KEYWORDS

{-| Full height (100%).
-}
h_full : Attribute msg
h_full =
    class "h-full"


{-| Screen height (100vh).
-}
h_screen : Attribute msg
h_screen =
    class "h-screen"


{-| Auto height.
-}
h_auto : Attribute msg
h_auto =
    class "h-auto"


{-| Min-content height.
-}
h_min : Attribute msg
h_min =
    class "h-min"


{-| Max-content height.
-}
h_max : Attribute msg
h_max =
    class "h-max"


{-| Fit-content height.
-}
h_fit : Attribute msg
h_fit =
    class "h-fit"


-- MIN/MAX WIDTH (using Spacing)

{-| Min width.
-}
min_w : Spacing -> Attribute msg
min_w spacing =
    class ("min-w-" ++ spacingToString spacing)


{-| Max width.
-}
max_w : Spacing -> Attribute msg
max_w spacing =
    class ("max-w-" ++ spacingToString spacing)


-- MIN/MAX HEIGHT (using Spacing)

{-| Min height.
-}
min_h : Spacing -> Attribute msg
min_h spacing =
    class ("min-h-" ++ spacingToString spacing)


{-| Max height.
-}
max_h : Spacing -> Attribute msg
max_h spacing =
    class ("max-h-" ++ spacingToString spacing)



-- TEXT ALIGNMENT

text_left : Attribute msg
text_left =
    class "text-left"


text_center : Attribute msg
text_center =
    class "text-center"


text_right : Attribute msg
text_right =
    class "text-right"


text_justify : Attribute msg
text_justify =
    class "text-justify"


-- FONT FAMILY

font_sans : Attribute msg
font_sans =
    class "font-sans"


font_serif : Attribute msg
font_serif =
    class "font-serif"


font_mono : Attribute msg
font_mono =
    class "font-mono"


-- FONT STYLE

italic : Attribute msg
italic =
    class "italic"


not_italic : Attribute msg
not_italic =
    class "not-italic"


-- TEXT TRANSFORM

uppercase : Attribute msg
uppercase =
    class "uppercase"


lowercase : Attribute msg
lowercase =
    class "lowercase"


capitalize : Attribute msg
capitalize =
    class "capitalize"


normal_case : Attribute msg
normal_case =
    class "normal-case"


-- TEXT DECORATION

underline : Attribute msg
underline =
    class "underline"


line_through : Attribute msg
line_through =
    class "line-through"


no_underline : Attribute msg
no_underline =
    class "no-underline"


-- WHITESPACE

whitespace_normal : Attribute msg
whitespace_normal =
    class "whitespace-normal"


whitespace_nowrap : Attribute msg
whitespace_nowrap =
    class "whitespace-nowrap"


whitespace_pre : Attribute msg
whitespace_pre =
    class "whitespace-pre"


whitespace_pre_line : Attribute msg
whitespace_pre_line =
    class "whitespace-pre-line"


whitespace_pre_wrap : Attribute msg
whitespace_pre_wrap =
    class "whitespace-pre-wrap"


-- TEXT OVERFLOW

truncate : Attribute msg
truncate =
    class "truncate"


text_ellipsis : Attribute msg
text_ellipsis =
    class "text-ellipsis"


text_clip : Attribute msg
text_clip =
    class "text-clip"


-- FONT SIZE

{-| font-size: 0.75rem
-}
text_xs : Attribute msg
text_xs =
    class "text-xs"

{-| font-size: 0.875rem
-}
text_sm : Attribute msg
text_sm =
    class "text-sm"

{-| font-size: 1rem
-}
text_base : Attribute msg
text_base =
    class "text-base"

{-| font-size: 1.125rem
-}
text_lg : Attribute msg
text_lg =
    class "text-lg"

{-| font-size: 1.25rem
-}
text_xl : Attribute msg
text_xl =
    class "text-xl"

{-| font-size: 1.5rem
-}
text_n2xl : Attribute msg
text_n2xl =
    class "text-2xl"

{-| font-size: 1.875rem
-}
text_n3xl : Attribute msg
text_n3xl =
    class "text-3xl"

{-| font-size: 2.25rem
-}
text_n4xl : Attribute msg
text_n4xl =
    class "text-4xl"

{-| font-size: 3rem
-}
text_n5xl : Attribute msg
text_n5xl =
    class "text-5xl"

{-| font-size: 3.75rem
-}
text_n6xl : Attribute msg
text_n6xl =
    class "text-6xl"

{-| font-size: 4.5rem
-}
text_n7xl : Attribute msg
text_n7xl =
    class "text-7xl"

{-| font-size: 6rem
-}
text_n8xl : Attribute msg
text_n8xl =
    class "text-8xl"

{-| font-size: 8rem
-}
text_n9xl : Attribute msg
text_n9xl =
    class "text-9xl"

-- FONT WEIGHT

{-| font-weight: 100
-}
font_thin : Attribute msg
font_thin =
    class "font-thin"

{-| font-weight: 200
-}
font_extralight : Attribute msg
font_extralight =
    class "font-extralight"

{-| font-weight: 300
-}
font_light : Attribute msg
font_light =
    class "font-light"

{-| font-weight: 400
-}
font_normal : Attribute msg
font_normal =
    class "font-normal"

{-| font-weight: 500
-}
font_medium : Attribute msg
font_medium =
    class "font-medium"

{-| font-weight: 600
-}
font_semibold : Attribute msg
font_semibold =
    class "font-semibold"

{-| font-weight: 700
-}
font_bold : Attribute msg
font_bold =
    class "font-bold"

{-| font-weight: 800
-}
font_extrabold : Attribute msg
font_extrabold =
    class "font-extrabold"

{-| font-weight: 900
-}
font_black : Attribute msg
font_black =
    class "font-black"


-- BORDER WIDTH

border : Attribute msg
border =
    class "border"


border_0 : Attribute msg
border_0 =
    class "border-0"


border_2 : Attribute msg
border_2 =
    class "border-2"


border_4 : Attribute msg
border_4 =
    class "border-4"


border_8 : Attribute msg
border_8 =
    class "border-8"


border_t : Attribute msg
border_t =
    class "border-t"


border_r : Attribute msg
border_r =
    class "border-r"


border_b : Attribute msg
border_b =
    class "border-b"


border_l : Attribute msg
border_l =
    class "border-l"


-- BORDER RADIUS

rounded : Attribute msg
rounded =
    class "rounded"


rounded_none : Attribute msg
rounded_none =
    class "rounded-none"


rounded_full : Attribute msg
rounded_full =
    class "rounded-full"


-- BORDER RADIUS

rounded_xs : Attribute msg
rounded_xs =
    class "rounded-xs"

rounded_sm : Attribute msg
rounded_sm =
    class "rounded-sm"

rounded_md : Attribute msg
rounded_md =
    class "rounded-md"

rounded_lg : Attribute msg
rounded_lg =
    class "rounded-lg"

rounded_xl : Attribute msg
rounded_xl =
    class "rounded-xl"

rounded_n2xl : Attribute msg
rounded_n2xl =
    class "rounded-2xl"

rounded_n3xl : Attribute msg
rounded_n3xl =
    class "rounded-3xl"

rounded_n4xl : Attribute msg
rounded_n4xl =
    class "rounded-4xl"


-- SHADOW

shadow : Attribute msg
shadow =
    class "shadow"


shadow_none : Attribute msg
shadow_none =
    class "shadow-none"


-- TRANSITIONS

transition : Attribute msg
transition =
    class "transition"


transition_all : Attribute msg
transition_all =
    class "transition-all"


transition_none : Attribute msg
transition_none =
    class "transition-none"


transition_colors : Attribute msg
transition_colors =
    class "transition-colors"


transition_opacity : Attribute msg
transition_opacity =
    class "transition-opacity"


transition_shadow : Attribute msg
transition_shadow =
    class "transition-shadow"


transition_transform : Attribute msg
transition_transform =
    class "transition-transform"


-- ANIMATIONS

animate_none : Attribute msg
animate_none =
    class "animate-none"


animate_spin : Attribute msg
animate_spin =
    class "animate-spin"


animate_ping : Attribute msg
animate_ping =
    class "animate-ping"


animate_pulse : Attribute msg
animate_pulse =
    class "animate-pulse"


animate_bounce : Attribute msg
animate_bounce =
    class "animate-bounce"


-- CURSOR

cursor_auto : Attribute msg
cursor_auto =
    class "cursor-auto"


cursor_default : Attribute msg
cursor_default =
    class "cursor-default"


cursor_pointer : Attribute msg
cursor_pointer =
    class "cursor-pointer"


cursor_wait : Attribute msg
cursor_wait =
    class "cursor-wait"


cursor_text : Attribute msg
cursor_text =
    class "cursor-text"


cursor_move : Attribute msg
cursor_move =
    class "cursor-move"


cursor_not_allowed : Attribute msg
cursor_not_allowed =
    class "cursor-not-allowed"


-- POINTER EVENTS

pointer_events_none : Attribute msg
pointer_events_none =
    class "pointer-events-none"


pointer_events_auto : Attribute msg
pointer_events_auto =
    class "pointer-events-auto"


-- USER SELECT

select_none : Attribute msg
select_none =
    class "select-none"


select_text : Attribute msg
select_text =
    class "select-text"


select_all : Attribute msg
select_all =
    class "select-all"


select_auto : Attribute msg
select_auto =
    class "select-auto"


-- SHADOW SIZES

shadow_n2xs : Attribute msg
shadow_n2xs =
    class "shadow-2xs"

shadow_xs : Attribute msg
shadow_xs =
    class "shadow-xs"

shadow_sm : Attribute msg
shadow_sm =
    class "shadow-sm"

shadow_md : Attribute msg
shadow_md =
    class "shadow-md"

shadow_lg : Attribute msg
shadow_lg =
    class "shadow-lg"

shadow_xl : Attribute msg
shadow_xl =
    class "shadow-xl"

shadow_n2xl : Attribute msg
shadow_n2xl =
    class "shadow-2xl"

shadow_inner : Attribute msg
shadow_inner =
    class "shadow-inner"


-- COLOR UTILITIES (parameterized)

{-| Set text color.

    text_color red_500

-}
text_color : Color -> Attribute msg
text_color (Color c) =
    class ("text-" ++ c)


{-| Set background color.

    bg_color blue_100

-}
bg_color : Color -> Attribute msg
bg_color (Color c) =
    class ("bg-" ++ c)


{-| Set border color.

    border_color gray_300

-}
border_color : Color -> Attribute msg
border_color (Color c) =
    class ("border-" ++ c)


{-| Set ring color.

    ring_color indigo_500

-}
ring_color : Color -> Attribute msg
ring_color (Color c) =
    class ("ring-" ++ c)


{-| Set placeholder color.

    placeholder_color gray_400

-}
placeholder_color : Color -> Attribute msg
placeholder_color (Color c) =
    class ("placeholder-" ++ c)



-- OPACITY

opacity_0 : Attribute msg
opacity_0 =
    class "opacity-0"


opacity_5 : Attribute msg
opacity_5 =
    class "opacity-5"


opacity_10 : Attribute msg
opacity_10 =
    class "opacity-10"


opacity_20 : Attribute msg
opacity_20 =
    class "opacity-20"


opacity_25 : Attribute msg
opacity_25 =
    class "opacity-25"


opacity_30 : Attribute msg
opacity_30 =
    class "opacity-30"


opacity_40 : Attribute msg
opacity_40 =
    class "opacity-40"


opacity_50 : Attribute msg
opacity_50 =
    class "opacity-50"


opacity_60 : Attribute msg
opacity_60 =
    class "opacity-60"


opacity_70 : Attribute msg
opacity_70 =
    class "opacity-70"


opacity_75 : Attribute msg
opacity_75 =
    class "opacity-75"


opacity_80 : Attribute msg
opacity_80 =
    class "opacity-80"


opacity_90 : Attribute msg
opacity_90 =
    class "opacity-90"


opacity_95 : Attribute msg
opacity_95 =
    class "opacity-95"


opacity_100 : Attribute msg
opacity_100 =
    class "opacity-100"


-- Z-INDEX

z_0 : Attribute msg
z_0 =
    class "z-0"

z_10 : Attribute msg
z_10 =
    class "z-10"

z_20 : Attribute msg
z_20 =
    class "z-20"

z_30 : Attribute msg
z_30 =
    class "z-30"

z_40 : Attribute msg
z_40 =
    class "z-40"

z_50 : Attribute msg
z_50 =
    class "z-50"

z_auto : Attribute msg
z_auto =
    class "z-auto"
