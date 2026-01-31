module Tailwind exposing
    ( Tailwind(..)
    , classes
    , batch
    , raw, toClass
    , p, px, py, pt, pr, pb, pl, m, mx, my, mt, mr, mb, ml, neg_m, neg_mx, neg_my, neg_mt, neg_mr, neg_mb, neg_ml, gap, gap_x, gap_y
    , flex, inline_flex, block, inline_block, inline, grid, hidden, flex_row, flex_row_reverse, flex_col, flex_col_reverse, flex_wrap, flex_wrap_reverse, flex_nowrap, grow, grow_0, shrink, shrink_0, items_start, items_end, items_center, items_baseline, items_stretch, justify_start, justify_end, justify_center, justify_between, justify_around, justify_evenly, relative, absolute, fixed, sticky, static, visible, invisible, overflow_auto, overflow_hidden, overflow_visible, overflow_scroll, overflow_x_auto, overflow_y_auto, overflow_x_hidden, overflow_y_hidden
    , w, w_1over2, w_1over3, w_2over3, w_1over4, w_2over4, w_3over4, w_1over5, w_2over5, w_3over5, w_4over5, w_1over6, w_2over6, w_3over6, w_4over6, w_5over6, w_1over12, w_2over12, w_3over12, w_4over12, w_5over12, w_6over12, w_7over12, w_8over12, w_9over12, w_10over12, w_11over12, w_full, w_screen, w_auto, w_min, w_max, w_fit, h, h_1over2, h_1over3, h_2over3, h_1over4, h_2over4, h_3over4, h_1over5, h_2over5, h_3over5, h_4over5, h_1over6, h_2over6, h_3over6, h_4over6, h_5over6, h_1over12, h_2over12, h_3over12, h_4over12, h_5over12, h_6over12, h_7over12, h_8over12, h_9over12, h_10over12, h_11over12, h_full, h_screen, h_auto, h_min, h_max, h_fit, min_w, max_w, min_h, max_h
    , text_left, text_center, text_right, text_justify, font_sans, font_serif, font_mono, italic, not_italic, uppercase, lowercase, capitalize, normal_case, underline, line_through, no_underline, whitespace_normal, whitespace_nowrap, whitespace_pre, whitespace_pre_line, whitespace_pre_wrap, truncate, text_ellipsis, text_clip
    , text_xs, text_sm, text_base, text_lg, text_xl, text_n2xl, text_n3xl, text_n4xl, text_n5xl, text_n6xl, text_n7xl, text_n8xl, text_n9xl
    , font_thin, font_extralight, font_light, font_normal, font_medium, font_semibold, font_bold, font_extrabold, font_black
    , border, border_0, border_2, border_4, border_8, border_t, border_r, border_b, border_l, rounded, rounded_none, rounded_full
    , rounded_xs, rounded_sm, rounded_md, rounded_lg, rounded_xl, rounded_n2xl, rounded_n3xl, rounded_n4xl
    , shadow, shadow_none, transition, transition_all, transition_none, transition_colors, transition_opacity, transition_shadow, transition_transform, animate_none, animate_spin, animate_ping, animate_pulse, animate_bounce, cursor_auto, cursor_default, cursor_pointer, cursor_wait, cursor_text, cursor_move, cursor_not_allowed, pointer_events_none, pointer_events_auto, select_none, select_text, select_all, select_auto
    , shadow_n2xs, shadow_xs, shadow_sm, shadow_md, shadow_lg, shadow_xl, shadow_n2xl, shadow_inner
    , text_color, bg_color, border_color, ring_color, placeholder_color, text_simple, bg_simple, border_simple
    , opacity_0, opacity_5, opacity_10, opacity_20, opacity_25, opacity_30, opacity_40, opacity_50, opacity_60, opacity_70, opacity_75, opacity_80, opacity_90, opacity_95, opacity_100
    , z_0, z_10, z_20, z_30, z_40, z_50, z_auto
    )

{-| Type-safe Tailwind CSS for Elm.

This module provides the `Tailwind` type and all utility functions.
Use `classes` to convert a list of Tailwind values to an `Html.Attribute`.


## The Tailwind Type

@docs Tailwind


## Converting to Attributes

@docs classes


## Combining Classes

@docs batch


## Escape Hatch

@docs raw, toClass


## Spacing

@docs p, px, py, pt, pr, pb, pl, m, mx, my, mt, mr, mb, ml, neg_m, neg_mx, neg_my, neg_mt, neg_mr, neg_mb, neg_ml, gap, gap_x, gap_y


## Layout

@docs flex, inline_flex, block, inline_block, inline, grid, hidden, flex_row, flex_row_reverse, flex_col, flex_col_reverse, flex_wrap, flex_wrap_reverse, flex_nowrap, grow, grow_0, shrink, shrink_0, items_start, items_end, items_center, items_baseline, items_stretch, justify_start, justify_end, justify_center, justify_between, justify_around, justify_evenly, relative, absolute, fixed, sticky, static, visible, invisible, overflow_auto, overflow_hidden, overflow_visible, overflow_scroll, overflow_x_auto, overflow_y_auto, overflow_x_hidden, overflow_y_hidden


## Sizing

@docs w, w_1over2, w_1over3, w_2over3, w_1over4, w_2over4, w_3over4, w_1over5, w_2over5, w_3over5, w_4over5, w_1over6, w_2over6, w_3over6, w_4over6, w_5over6, w_1over12, w_2over12, w_3over12, w_4over12, w_5over12, w_6over12, w_7over12, w_8over12, w_9over12, w_10over12, w_11over12, w_full, w_screen, w_auto, w_min, w_max, w_fit, h, h_1over2, h_1over3, h_2over3, h_1over4, h_2over4, h_3over4, h_1over5, h_2over5, h_3over5, h_4over5, h_1over6, h_2over6, h_3over6, h_4over6, h_5over6, h_1over12, h_2over12, h_3over12, h_4over12, h_5over12, h_6over12, h_7over12, h_8over12, h_9over12, h_10over12, h_11over12, h_full, h_screen, h_auto, h_min, h_max, h_fit, min_w, max_w, min_h, max_h


## Typography

@docs text_left, text_center, text_right, text_justify, font_sans, font_serif, font_mono, italic, not_italic, uppercase, lowercase, capitalize, normal_case, underline, line_through, no_underline, whitespace_normal, whitespace_nowrap, whitespace_pre, whitespace_pre_line, whitespace_pre_wrap, truncate, text_ellipsis, text_clip


## Font Sizes

@docs text_xs, text_sm, text_base, text_lg, text_xl, text_n2xl, text_n3xl, text_n4xl, text_n5xl, text_n6xl, text_n7xl, text_n8xl, text_n9xl


## Font Weights

@docs font_thin, font_extralight, font_light, font_normal, font_medium, font_semibold, font_bold, font_extrabold, font_black


## Borders

@docs border, border_0, border_2, border_4, border_8, border_t, border_r, border_b, border_l, rounded, rounded_none, rounded_full


## Border Radius

@docs rounded_xs, rounded_sm, rounded_md, rounded_lg, rounded_xl, rounded_n2xl, rounded_n3xl, rounded_n4xl


## Effects

@docs shadow, shadow_none, transition, transition_all, transition_none, transition_colors, transition_opacity, transition_shadow, transition_transform, animate_none, animate_spin, animate_ping, animate_pulse, animate_bounce, cursor_auto, cursor_default, cursor_pointer, cursor_wait, cursor_text, cursor_move, cursor_not_allowed, pointer_events_none, pointer_events_auto, select_none, select_text, select_all, select_auto


## Shadows

@docs shadow_n2xs, shadow_xs, shadow_sm, shadow_md, shadow_lg, shadow_xl, shadow_n2xl, shadow_inner


## Colors

@docs text_color, bg_color, border_color, ring_color, placeholder_color, text_simple, bg_simple, border_simple


## Opacity

@docs opacity_0, opacity_5, opacity_10, opacity_20, opacity_25, opacity_30, opacity_40, opacity_50, opacity_60, opacity_70, opacity_75, opacity_80, opacity_90, opacity_95, opacity_100


## Z-Index

@docs z_0, z_10, z_20, z_30, z_40, z_50, z_auto

-}

import Html exposing (Attribute)
import Html.Attributes
import Tailwind.Theme exposing (Color, SimpleColor(..), Spacing, colorToString, spacingToString)


{-| A type representing a Tailwind CSS class or set of classes.

While the constructor is exposed for internal use by Tailwind.Breakpoints,
you should use the utility functions in this module to create values
rather than constructing them directly.

-}
type Tailwind
    = Tailwind String


{-| Convert a list of Tailwind values to an Html.Attribute.

This is the main entry point for using Tailwind classes in your view:

    import Tailwind as Tw exposing (classes)
    import Tailwind.Breakpoints exposing (hover, md)
    import Tailwind.Theme exposing (blue, s4, s500, s8)

    view =
        div
            [ classes
                [ Tw.flex
                , Tw.items_center
                , Tw.p s4
                , Tw.bg_color (blue s500)
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
            , Tw.bg_color (blue s500)
            , hover [ Tw.bg_color (blue s600) ]
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



-- SPACING
-- PADDING


{-| Padding on all sides.

    p s4 -- produces "p-4" (1rem)

-}
p : Spacing -> Tailwind
p spacing =
    Tailwind ("p-" ++ spacingToString spacing)


{-| Horizontal padding (left and right).
-}
px : Spacing -> Tailwind
px spacing =
    Tailwind ("px-" ++ spacingToString spacing)


{-| Vertical padding (top and bottom).
-}
py : Spacing -> Tailwind
py spacing =
    Tailwind ("py-" ++ spacingToString spacing)


{-| Top padding.
-}
pt : Spacing -> Tailwind
pt spacing =
    Tailwind ("pt-" ++ spacingToString spacing)


{-| Right padding.
-}
pr : Spacing -> Tailwind
pr spacing =
    Tailwind ("pr-" ++ spacingToString spacing)


{-| Bottom padding.
-}
pb : Spacing -> Tailwind
pb spacing =
    Tailwind ("pb-" ++ spacingToString spacing)


{-| Left padding.
-}
pl : Spacing -> Tailwind
pl spacing =
    Tailwind ("pl-" ++ spacingToString spacing)



-- MARGIN


{-| Margin on all sides.

    m s4 -- produces "m-4" (1rem)

-}
m : Spacing -> Tailwind
m spacing =
    Tailwind ("m-" ++ spacingToString spacing)


{-| Horizontal margin (left and right).
-}
mx : Spacing -> Tailwind
mx spacing =
    Tailwind ("mx-" ++ spacingToString spacing)


{-| Vertical margin (top and bottom).
-}
my : Spacing -> Tailwind
my spacing =
    Tailwind ("my-" ++ spacingToString spacing)


{-| Top margin.
-}
mt : Spacing -> Tailwind
mt spacing =
    Tailwind ("mt-" ++ spacingToString spacing)


{-| Right margin.
-}
mr : Spacing -> Tailwind
mr spacing =
    Tailwind ("mr-" ++ spacingToString spacing)


{-| Bottom margin.
-}
mb : Spacing -> Tailwind
mb spacing =
    Tailwind ("mb-" ++ spacingToString spacing)


{-| Left margin.
-}
ml : Spacing -> Tailwind
ml spacing =
    Tailwind ("ml-" ++ spacingToString spacing)



-- NEGATIVE MARGIN


{-| Negative margin on all sides.
-}
neg_m : Spacing -> Tailwind
neg_m spacing =
    Tailwind ("-m-" ++ spacingToString spacing)


{-| Negative horizontal margin.
-}
neg_mx : Spacing -> Tailwind
neg_mx spacing =
    Tailwind ("-mx-" ++ spacingToString spacing)


{-| Negative vertical margin.
-}
neg_my : Spacing -> Tailwind
neg_my spacing =
    Tailwind ("-my-" ++ spacingToString spacing)


{-| Negative top margin.
-}
neg_mt : Spacing -> Tailwind
neg_mt spacing =
    Tailwind ("-mt-" ++ spacingToString spacing)


{-| Negative right margin.
-}
neg_mr : Spacing -> Tailwind
neg_mr spacing =
    Tailwind ("-mr-" ++ spacingToString spacing)


{-| Negative bottom margin.
-}
neg_mb : Spacing -> Tailwind
neg_mb spacing =
    Tailwind ("-mb-" ++ spacingToString spacing)


{-| Negative left margin.
-}
neg_ml : Spacing -> Tailwind
neg_ml spacing =
    Tailwind ("-ml-" ++ spacingToString spacing)



-- GAP


{-| Gap between flex/grid items.

    gap s4 -- produces "gap-4"

-}
gap : Spacing -> Tailwind
gap spacing =
    Tailwind ("gap-" ++ spacingToString spacing)


{-| Horizontal gap.
-}
gap_x : Spacing -> Tailwind
gap_x spacing =
    Tailwind ("gap-x-" ++ spacingToString spacing)


{-| Vertical gap.
-}
gap_y : Spacing -> Tailwind
gap_y spacing =
    Tailwind ("gap-y-" ++ spacingToString spacing)



-- DISPLAY


{-| display: flex
-}
flex : Tailwind
flex =
    Tailwind "flex"


{-| display: inline-flex
-}
inline_flex : Tailwind
inline_flex =
    Tailwind "inline-flex"


{-| display: block
-}
block : Tailwind
block =
    Tailwind "block"


{-| display: inline-block
-}
inline_block : Tailwind
inline_block =
    Tailwind "inline-block"


{-| display: inline
-}
inline : Tailwind
inline =
    Tailwind "inline"


{-| display: grid
-}
grid : Tailwind
grid =
    Tailwind "grid"


{-| display: none
-}
hidden : Tailwind
hidden =
    Tailwind "hidden"



-- FLEX DIRECTION


{-| flex-direction: row
-}
flex_row : Tailwind
flex_row =
    Tailwind "flex-row"


{-| flex-direction: row-reverse
-}
flex_row_reverse : Tailwind
flex_row_reverse =
    Tailwind "flex-row-reverse"


{-| flex-direction: column
-}
flex_col : Tailwind
flex_col =
    Tailwind "flex-col"


{-| flex-direction: column-reverse
-}
flex_col_reverse : Tailwind
flex_col_reverse =
    Tailwind "flex-col-reverse"



-- FLEX WRAP


{-| flex-wrap: wrap
-}
flex_wrap : Tailwind
flex_wrap =
    Tailwind "flex-wrap"


{-| flex-wrap: wrap-reverse
-}
flex_wrap_reverse : Tailwind
flex_wrap_reverse =
    Tailwind "flex-wrap-reverse"


{-| flex-wrap: nowrap
-}
flex_nowrap : Tailwind
flex_nowrap =
    Tailwind "flex-nowrap"



-- FLEX GROW/SHRINK


{-| flex-grow: 1
-}
grow : Tailwind
grow =
    Tailwind "grow"


{-| flex-grow: 0
-}
grow_0 : Tailwind
grow_0 =
    Tailwind "grow-0"


{-| flex-shrink: 1
-}
shrink : Tailwind
shrink =
    Tailwind "shrink"


{-| flex-shrink: 0
-}
shrink_0 : Tailwind
shrink_0 =
    Tailwind "shrink-0"



-- ALIGN ITEMS


{-| align-items: flex-start
-}
items_start : Tailwind
items_start =
    Tailwind "items-start"


{-| align-items: flex-end
-}
items_end : Tailwind
items_end =
    Tailwind "items-end"


{-| align-items: center
-}
items_center : Tailwind
items_center =
    Tailwind "items-center"


{-| align-items: baseline
-}
items_baseline : Tailwind
items_baseline =
    Tailwind "items-baseline"


{-| align-items: stretch
-}
items_stretch : Tailwind
items_stretch =
    Tailwind "items-stretch"



-- JUSTIFY CONTENT


{-| justify-content: flex-start
-}
justify_start : Tailwind
justify_start =
    Tailwind "justify-start"


{-| justify-content: flex-end
-}
justify_end : Tailwind
justify_end =
    Tailwind "justify-end"


{-| justify-content: center
-}
justify_center : Tailwind
justify_center =
    Tailwind "justify-center"


{-| justify-content: space-between
-}
justify_between : Tailwind
justify_between =
    Tailwind "justify-between"


{-| justify-content: space-around
-}
justify_around : Tailwind
justify_around =
    Tailwind "justify-around"


{-| justify-content: space-evenly
-}
justify_evenly : Tailwind
justify_evenly =
    Tailwind "justify-evenly"



-- POSITIONING


{-| position: relative
-}
relative : Tailwind
relative =
    Tailwind "relative"


{-| position: absolute
-}
absolute : Tailwind
absolute =
    Tailwind "absolute"


{-| position: fixed
-}
fixed : Tailwind
fixed =
    Tailwind "fixed"


{-| position: sticky
-}
sticky : Tailwind
sticky =
    Tailwind "sticky"


{-| position: static
-}
static : Tailwind
static =
    Tailwind "static"



-- VISIBILITY


{-| visibility: visible
-}
visible : Tailwind
visible =
    Tailwind "visible"


{-| visibility: hidden
-}
invisible : Tailwind
invisible =
    Tailwind "invisible"



-- OVERFLOW


{-| overflow: auto
-}
overflow_auto : Tailwind
overflow_auto =
    Tailwind "overflow-auto"


{-| overflow: hidden
-}
overflow_hidden : Tailwind
overflow_hidden =
    Tailwind "overflow-hidden"


{-| overflow: visible
-}
overflow_visible : Tailwind
overflow_visible =
    Tailwind "overflow-visible"


{-| overflow: scroll
-}
overflow_scroll : Tailwind
overflow_scroll =
    Tailwind "overflow-scroll"


{-| overflow-x: auto
-}
overflow_x_auto : Tailwind
overflow_x_auto =
    Tailwind "overflow-x-auto"


{-| overflow-y: auto
-}
overflow_y_auto : Tailwind
overflow_y_auto =
    Tailwind "overflow-y-auto"


{-| overflow-x: hidden
-}
overflow_x_hidden : Tailwind
overflow_x_hidden =
    Tailwind "overflow-x-hidden"


{-| overflow-y: hidden
-}
overflow_y_hidden : Tailwind
overflow_y_hidden =
    Tailwind "overflow-y-hidden"



-- SIZING
-- WIDTH (using Spacing)


{-| Width from spacing scale.

    w s64 -- produces "w-64" (16rem)

-}
w : Spacing -> Tailwind
w spacing =
    Tailwind ("w-" ++ spacingToString spacing)



-- WIDTH FRACTIONS


{-| Width 1/2
-}
w_1over2 : Tailwind
w_1over2 =
    Tailwind "w-1/2"


{-| Width 1/3
-}
w_1over3 : Tailwind
w_1over3 =
    Tailwind "w-1/3"


{-| Width 2/3
-}
w_2over3 : Tailwind
w_2over3 =
    Tailwind "w-2/3"


{-| Width 1/4
-}
w_1over4 : Tailwind
w_1over4 =
    Tailwind "w-1/4"


{-| Width 2/4
-}
w_2over4 : Tailwind
w_2over4 =
    Tailwind "w-2/4"


{-| Width 3/4
-}
w_3over4 : Tailwind
w_3over4 =
    Tailwind "w-3/4"


{-| Width 1/5
-}
w_1over5 : Tailwind
w_1over5 =
    Tailwind "w-1/5"


{-| Width 2/5
-}
w_2over5 : Tailwind
w_2over5 =
    Tailwind "w-2/5"


{-| Width 3/5
-}
w_3over5 : Tailwind
w_3over5 =
    Tailwind "w-3/5"


{-| Width 4/5
-}
w_4over5 : Tailwind
w_4over5 =
    Tailwind "w-4/5"


{-| Width 1/6
-}
w_1over6 : Tailwind
w_1over6 =
    Tailwind "w-1/6"


{-| Width 2/6
-}
w_2over6 : Tailwind
w_2over6 =
    Tailwind "w-2/6"


{-| Width 3/6
-}
w_3over6 : Tailwind
w_3over6 =
    Tailwind "w-3/6"


{-| Width 4/6
-}
w_4over6 : Tailwind
w_4over6 =
    Tailwind "w-4/6"


{-| Width 5/6
-}
w_5over6 : Tailwind
w_5over6 =
    Tailwind "w-5/6"


{-| Width 1/12
-}
w_1over12 : Tailwind
w_1over12 =
    Tailwind "w-1/12"


{-| Width 2/12
-}
w_2over12 : Tailwind
w_2over12 =
    Tailwind "w-2/12"


{-| Width 3/12
-}
w_3over12 : Tailwind
w_3over12 =
    Tailwind "w-3/12"


{-| Width 4/12
-}
w_4over12 : Tailwind
w_4over12 =
    Tailwind "w-4/12"


{-| Width 5/12
-}
w_5over12 : Tailwind
w_5over12 =
    Tailwind "w-5/12"


{-| Width 6/12
-}
w_6over12 : Tailwind
w_6over12 =
    Tailwind "w-6/12"


{-| Width 7/12
-}
w_7over12 : Tailwind
w_7over12 =
    Tailwind "w-7/12"


{-| Width 8/12
-}
w_8over12 : Tailwind
w_8over12 =
    Tailwind "w-8/12"


{-| Width 9/12
-}
w_9over12 : Tailwind
w_9over12 =
    Tailwind "w-9/12"


{-| Width 10/12
-}
w_10over12 : Tailwind
w_10over12 =
    Tailwind "w-10/12"


{-| Width 11/12
-}
w_11over12 : Tailwind
w_11over12 =
    Tailwind "w-11/12"



-- WIDTH KEYWORDS


{-| Full width (100%).
-}
w_full : Tailwind
w_full =
    Tailwind "w-full"


{-| Screen width (100vw).
-}
w_screen : Tailwind
w_screen =
    Tailwind "w-screen"


{-| Auto width.
-}
w_auto : Tailwind
w_auto =
    Tailwind "w-auto"


{-| Min-content width.
-}
w_min : Tailwind
w_min =
    Tailwind "w-min"


{-| Max-content width.
-}
w_max : Tailwind
w_max =
    Tailwind "w-max"


{-| Fit-content width.
-}
w_fit : Tailwind
w_fit =
    Tailwind "w-fit"



-- HEIGHT (using Spacing)


{-| Height from spacing scale.

    h s32 -- produces "h-32" (8rem)

-}
h : Spacing -> Tailwind
h spacing =
    Tailwind ("h-" ++ spacingToString spacing)



-- HEIGHT FRACTIONS


{-| Height 1/2
-}
h_1over2 : Tailwind
h_1over2 =
    Tailwind "h-1/2"


{-| Height 1/3
-}
h_1over3 : Tailwind
h_1over3 =
    Tailwind "h-1/3"


{-| Height 2/3
-}
h_2over3 : Tailwind
h_2over3 =
    Tailwind "h-2/3"


{-| Height 1/4
-}
h_1over4 : Tailwind
h_1over4 =
    Tailwind "h-1/4"


{-| Height 2/4
-}
h_2over4 : Tailwind
h_2over4 =
    Tailwind "h-2/4"


{-| Height 3/4
-}
h_3over4 : Tailwind
h_3over4 =
    Tailwind "h-3/4"


{-| Height 1/5
-}
h_1over5 : Tailwind
h_1over5 =
    Tailwind "h-1/5"


{-| Height 2/5
-}
h_2over5 : Tailwind
h_2over5 =
    Tailwind "h-2/5"


{-| Height 3/5
-}
h_3over5 : Tailwind
h_3over5 =
    Tailwind "h-3/5"


{-| Height 4/5
-}
h_4over5 : Tailwind
h_4over5 =
    Tailwind "h-4/5"


{-| Height 1/6
-}
h_1over6 : Tailwind
h_1over6 =
    Tailwind "h-1/6"


{-| Height 2/6
-}
h_2over6 : Tailwind
h_2over6 =
    Tailwind "h-2/6"


{-| Height 3/6
-}
h_3over6 : Tailwind
h_3over6 =
    Tailwind "h-3/6"


{-| Height 4/6
-}
h_4over6 : Tailwind
h_4over6 =
    Tailwind "h-4/6"


{-| Height 5/6
-}
h_5over6 : Tailwind
h_5over6 =
    Tailwind "h-5/6"


{-| Height 1/12
-}
h_1over12 : Tailwind
h_1over12 =
    Tailwind "h-1/12"


{-| Height 2/12
-}
h_2over12 : Tailwind
h_2over12 =
    Tailwind "h-2/12"


{-| Height 3/12
-}
h_3over12 : Tailwind
h_3over12 =
    Tailwind "h-3/12"


{-| Height 4/12
-}
h_4over12 : Tailwind
h_4over12 =
    Tailwind "h-4/12"


{-| Height 5/12
-}
h_5over12 : Tailwind
h_5over12 =
    Tailwind "h-5/12"


{-| Height 6/12
-}
h_6over12 : Tailwind
h_6over12 =
    Tailwind "h-6/12"


{-| Height 7/12
-}
h_7over12 : Tailwind
h_7over12 =
    Tailwind "h-7/12"


{-| Height 8/12
-}
h_8over12 : Tailwind
h_8over12 =
    Tailwind "h-8/12"


{-| Height 9/12
-}
h_9over12 : Tailwind
h_9over12 =
    Tailwind "h-9/12"


{-| Height 10/12
-}
h_10over12 : Tailwind
h_10over12 =
    Tailwind "h-10/12"


{-| Height 11/12
-}
h_11over12 : Tailwind
h_11over12 =
    Tailwind "h-11/12"



-- HEIGHT KEYWORDS


{-| Full height (100%).
-}
h_full : Tailwind
h_full =
    Tailwind "h-full"


{-| Screen height (100vh).
-}
h_screen : Tailwind
h_screen =
    Tailwind "h-screen"


{-| Auto height.
-}
h_auto : Tailwind
h_auto =
    Tailwind "h-auto"


{-| Min-content height.
-}
h_min : Tailwind
h_min =
    Tailwind "h-min"


{-| Max-content height.
-}
h_max : Tailwind
h_max =
    Tailwind "h-max"


{-| Fit-content height.
-}
h_fit : Tailwind
h_fit =
    Tailwind "h-fit"



-- MIN/MAX WIDTH (using Spacing)


{-| Min width.
-}
min_w : Spacing -> Tailwind
min_w spacing =
    Tailwind ("min-w-" ++ spacingToString spacing)


{-| Max width.
-}
max_w : Spacing -> Tailwind
max_w spacing =
    Tailwind ("max-w-" ++ spacingToString spacing)



-- MIN/MAX HEIGHT (using Spacing)


{-| Min height.
-}
min_h : Spacing -> Tailwind
min_h spacing =
    Tailwind ("min-h-" ++ spacingToString spacing)


{-| Max height.
-}
max_h : Spacing -> Tailwind
max_h spacing =
    Tailwind ("max-h-" ++ spacingToString spacing)



-- TEXT ALIGNMENT


{-| text-align: left
-}
text_left : Tailwind
text_left =
    Tailwind "text-left"


{-| text-align: center
-}
text_center : Tailwind
text_center =
    Tailwind "text-center"


{-| text-align: right
-}
text_right : Tailwind
text_right =
    Tailwind "text-right"


{-| text-align: justify
-}
text_justify : Tailwind
text_justify =
    Tailwind "text-justify"



-- FONT FAMILY


{-| font-family: sans-serif
-}
font_sans : Tailwind
font_sans =
    Tailwind "font-sans"


{-| font-family: serif
-}
font_serif : Tailwind
font_serif =
    Tailwind "font-serif"


{-| font-family: monospace
-}
font_mono : Tailwind
font_mono =
    Tailwind "font-mono"



-- FONT STYLE


{-| font-style: italic
-}
italic : Tailwind
italic =
    Tailwind "italic"


{-| font-style: normal
-}
not_italic : Tailwind
not_italic =
    Tailwind "not-italic"



-- TEXT TRANSFORM


{-| text-transform: uppercase
-}
uppercase : Tailwind
uppercase =
    Tailwind "uppercase"


{-| text-transform: lowercase
-}
lowercase : Tailwind
lowercase =
    Tailwind "lowercase"


{-| text-transform: capitalize
-}
capitalize : Tailwind
capitalize =
    Tailwind "capitalize"


{-| text-transform: none
-}
normal_case : Tailwind
normal_case =
    Tailwind "normal-case"



-- TEXT DECORATION


{-| text-decoration: underline
-}
underline : Tailwind
underline =
    Tailwind "underline"


{-| text-decoration: line-through
-}
line_through : Tailwind
line_through =
    Tailwind "line-through"


{-| text-decoration: none
-}
no_underline : Tailwind
no_underline =
    Tailwind "no-underline"



-- WHITESPACE


{-| white-space: normal
-}
whitespace_normal : Tailwind
whitespace_normal =
    Tailwind "whitespace-normal"


{-| white-space: nowrap
-}
whitespace_nowrap : Tailwind
whitespace_nowrap =
    Tailwind "whitespace-nowrap"


{-| white-space: pre
-}
whitespace_pre : Tailwind
whitespace_pre =
    Tailwind "whitespace-pre"


{-| white-space: pre-line
-}
whitespace_pre_line : Tailwind
whitespace_pre_line =
    Tailwind "whitespace-pre-line"


{-| white-space: pre-wrap
-}
whitespace_pre_wrap : Tailwind
whitespace_pre_wrap =
    Tailwind "whitespace-pre-wrap"



-- TEXT OVERFLOW


{-| Truncate text with ellipsis
-}
truncate : Tailwind
truncate =
    Tailwind "truncate"


{-| text-overflow: ellipsis
-}
text_ellipsis : Tailwind
text_ellipsis =
    Tailwind "text-ellipsis"


{-| text-overflow: clip
-}
text_clip : Tailwind
text_clip =
    Tailwind "text-clip"



-- FONT SIZE


{-| font-size: 0.75rem
-}
text_xs : Tailwind
text_xs =
    Tailwind "text-xs"


{-| font-size: 0.875rem
-}
text_sm : Tailwind
text_sm =
    Tailwind "text-sm"


{-| font-size: 1rem
-}
text_base : Tailwind
text_base =
    Tailwind "text-base"


{-| font-size: 1.125rem
-}
text_lg : Tailwind
text_lg =
    Tailwind "text-lg"


{-| font-size: 1.25rem
-}
text_xl : Tailwind
text_xl =
    Tailwind "text-xl"


{-| font-size: 1.5rem
-}
text_n2xl : Tailwind
text_n2xl =
    Tailwind "text-2xl"


{-| font-size: 1.875rem
-}
text_n3xl : Tailwind
text_n3xl =
    Tailwind "text-3xl"


{-| font-size: 2.25rem
-}
text_n4xl : Tailwind
text_n4xl =
    Tailwind "text-4xl"


{-| font-size: 3rem
-}
text_n5xl : Tailwind
text_n5xl =
    Tailwind "text-5xl"


{-| font-size: 3.75rem
-}
text_n6xl : Tailwind
text_n6xl =
    Tailwind "text-6xl"


{-| font-size: 4.5rem
-}
text_n7xl : Tailwind
text_n7xl =
    Tailwind "text-7xl"


{-| font-size: 6rem
-}
text_n8xl : Tailwind
text_n8xl =
    Tailwind "text-8xl"


{-| font-size: 8rem
-}
text_n9xl : Tailwind
text_n9xl =
    Tailwind "text-9xl"



-- FONT WEIGHT


{-| font-weight: 100
-}
font_thin : Tailwind
font_thin =
    Tailwind "font-thin"


{-| font-weight: 200
-}
font_extralight : Tailwind
font_extralight =
    Tailwind "font-extralight"


{-| font-weight: 300
-}
font_light : Tailwind
font_light =
    Tailwind "font-light"


{-| font-weight: 400
-}
font_normal : Tailwind
font_normal =
    Tailwind "font-normal"


{-| font-weight: 500
-}
font_medium : Tailwind
font_medium =
    Tailwind "font-medium"


{-| font-weight: 600
-}
font_semibold : Tailwind
font_semibold =
    Tailwind "font-semibold"


{-| font-weight: 700
-}
font_bold : Tailwind
font_bold =
    Tailwind "font-bold"


{-| font-weight: 800
-}
font_extrabold : Tailwind
font_extrabold =
    Tailwind "font-extrabold"


{-| font-weight: 900
-}
font_black : Tailwind
font_black =
    Tailwind "font-black"



-- BORDER WIDTH


{-| border-width: 1px
-}
border : Tailwind
border =
    Tailwind "border"


{-| border-width: 0px
-}
border_0 : Tailwind
border_0 =
    Tailwind "border-0"


{-| border-width: 2px
-}
border_2 : Tailwind
border_2 =
    Tailwind "border-2"


{-| border-width: 4px
-}
border_4 : Tailwind
border_4 =
    Tailwind "border-4"


{-| border-width: 8px
-}
border_8 : Tailwind
border_8 =
    Tailwind "border-8"


{-| border-top-width: 1px
-}
border_t : Tailwind
border_t =
    Tailwind "border-t"


{-| border-right-width: 1px
-}
border_r : Tailwind
border_r =
    Tailwind "border-r"


{-| border-bottom-width: 1px
-}
border_b : Tailwind
border_b =
    Tailwind "border-b"


{-| border-left-width: 1px
-}
border_l : Tailwind
border_l =
    Tailwind "border-l"



-- BORDER RADIUS


{-| border-radius: 0.25rem
-}
rounded : Tailwind
rounded =
    Tailwind "rounded"


{-| border-radius: 0
-}
rounded_none : Tailwind
rounded_none =
    Tailwind "rounded-none"


{-| border-radius: 9999px
-}
rounded_full : Tailwind
rounded_full =
    Tailwind "rounded-full"



-- BORDER RADIUS


{-| Border radius: xs
-}
rounded_xs : Tailwind
rounded_xs =
    Tailwind "rounded-xs"


{-| Border radius: sm
-}
rounded_sm : Tailwind
rounded_sm =
    Tailwind "rounded-sm"


{-| Border radius: md
-}
rounded_md : Tailwind
rounded_md =
    Tailwind "rounded-md"


{-| Border radius: lg
-}
rounded_lg : Tailwind
rounded_lg =
    Tailwind "rounded-lg"


{-| Border radius: xl
-}
rounded_xl : Tailwind
rounded_xl =
    Tailwind "rounded-xl"


{-| Border radius: 2xl
-}
rounded_n2xl : Tailwind
rounded_n2xl =
    Tailwind "rounded-2xl"


{-| Border radius: 3xl
-}
rounded_n3xl : Tailwind
rounded_n3xl =
    Tailwind "rounded-3xl"


{-| Border radius: 4xl
-}
rounded_n4xl : Tailwind
rounded_n4xl =
    Tailwind "rounded-4xl"



-- SHADOW


{-| Default shadow
-}
shadow : Tailwind
shadow =
    Tailwind "shadow"


{-| No shadow
-}
shadow_none : Tailwind
shadow_none =
    Tailwind "shadow-none"



-- TRANSITIONS


{-| Default transition
-}
transition : Tailwind
transition =
    Tailwind "transition"


{-| Transition all properties
-}
transition_all : Tailwind
transition_all =
    Tailwind "transition-all"


{-| No transition
-}
transition_none : Tailwind
transition_none =
    Tailwind "transition-none"


{-| Transition colors
-}
transition_colors : Tailwind
transition_colors =
    Tailwind "transition-colors"


{-| Transition opacity
-}
transition_opacity : Tailwind
transition_opacity =
    Tailwind "transition-opacity"


{-| Transition shadow
-}
transition_shadow : Tailwind
transition_shadow =
    Tailwind "transition-shadow"


{-| Transition transform
-}
transition_transform : Tailwind
transition_transform =
    Tailwind "transition-transform"



-- ANIMATIONS


{-| No animation
-}
animate_none : Tailwind
animate_none =
    Tailwind "animate-none"


{-| Spinning animation
-}
animate_spin : Tailwind
animate_spin =
    Tailwind "animate-spin"


{-| Ping animation
-}
animate_ping : Tailwind
animate_ping =
    Tailwind "animate-ping"


{-| Pulse animation
-}
animate_pulse : Tailwind
animate_pulse =
    Tailwind "animate-pulse"


{-| Bounce animation
-}
animate_bounce : Tailwind
animate_bounce =
    Tailwind "animate-bounce"



-- CURSOR


{-| cursor: auto
-}
cursor_auto : Tailwind
cursor_auto =
    Tailwind "cursor-auto"


{-| cursor: default
-}
cursor_default : Tailwind
cursor_default =
    Tailwind "cursor-default"


{-| cursor: pointer
-}
cursor_pointer : Tailwind
cursor_pointer =
    Tailwind "cursor-pointer"


{-| cursor: wait
-}
cursor_wait : Tailwind
cursor_wait =
    Tailwind "cursor-wait"


{-| cursor: text
-}
cursor_text : Tailwind
cursor_text =
    Tailwind "cursor-text"


{-| cursor: move
-}
cursor_move : Tailwind
cursor_move =
    Tailwind "cursor-move"


{-| cursor: not-allowed
-}
cursor_not_allowed : Tailwind
cursor_not_allowed =
    Tailwind "cursor-not-allowed"



-- POINTER EVENTS


{-| pointer-events: none
-}
pointer_events_none : Tailwind
pointer_events_none =
    Tailwind "pointer-events-none"


{-| pointer-events: auto
-}
pointer_events_auto : Tailwind
pointer_events_auto =
    Tailwind "pointer-events-auto"



-- USER SELECT


{-| user-select: none
-}
select_none : Tailwind
select_none =
    Tailwind "select-none"


{-| user-select: text
-}
select_text : Tailwind
select_text =
    Tailwind "select-text"


{-| user-select: all
-}
select_all : Tailwind
select_all =
    Tailwind "select-all"


{-| user-select: auto
-}
select_auto : Tailwind
select_auto =
    Tailwind "select-auto"



-- SHADOW SIZES


{-| Shadow: 2xs
-}
shadow_n2xs : Tailwind
shadow_n2xs =
    Tailwind "shadow-2xs"


{-| Shadow: xs
-}
shadow_xs : Tailwind
shadow_xs =
    Tailwind "shadow-xs"


{-| Shadow: sm
-}
shadow_sm : Tailwind
shadow_sm =
    Tailwind "shadow-sm"


{-| Shadow: md
-}
shadow_md : Tailwind
shadow_md =
    Tailwind "shadow-md"


{-| Shadow: lg
-}
shadow_lg : Tailwind
shadow_lg =
    Tailwind "shadow-lg"


{-| Shadow: xl
-}
shadow_xl : Tailwind
shadow_xl =
    Tailwind "shadow-xl"


{-| Shadow: 2xl
-}
shadow_n2xl : Tailwind
shadow_n2xl =
    Tailwind "shadow-2xl"


{-| Shadow: inner
-}
shadow_inner : Tailwind
shadow_inner =
    Tailwind "shadow-inner"



-- COLOR UTILITIES


{-| Set text color.

    text_color (blue s500)

    text_color white

-}
text_color : Color -> Tailwind
text_color color =
    Tailwind ("text-" ++ colorToString color)


{-| Set background color.

    bg_color (blue s100)

    bg_color white

-}
bg_color : Color -> Tailwind
bg_color color =
    Tailwind ("bg-" ++ colorToString color)


{-| Set border color.

    border_color (gray s300)

    border_color black

-}
border_color : Color -> Tailwind
border_color color =
    Tailwind ("border-" ++ colorToString color)


{-| Set ring color.

    ring_color (indigo s500)

-}
ring_color : Color -> Tailwind
ring_color color =
    Tailwind ("ring-" ++ colorToString color)


{-| Set placeholder color.

    placeholder_color (gray s400)

-}
placeholder_color : Color -> Tailwind
placeholder_color color =
    Tailwind ("placeholder-" ++ colorToString color)


{-| Set text color using a simple color.

    text_simple white

-}
text_simple : SimpleColor -> Tailwind
text_simple (SimpleColor c) =
    Tailwind ("text-" ++ c)


{-| Set background color using a simple color.

    bg_simple white

-}
bg_simple : SimpleColor -> Tailwind
bg_simple (SimpleColor c) =
    Tailwind ("bg-" ++ c)


{-| Set border color using a simple color.

    border_simple black

-}
border_simple : SimpleColor -> Tailwind
border_simple (SimpleColor c) =
    Tailwind ("border-" ++ c)



-- OPACITY


{-| opacity: 0
-}
opacity_0 : Tailwind
opacity_0 =
    Tailwind "opacity-0"


{-| opacity: 0.05
-}
opacity_5 : Tailwind
opacity_5 =
    Tailwind "opacity-5"


{-| opacity: 0.1
-}
opacity_10 : Tailwind
opacity_10 =
    Tailwind "opacity-10"


{-| opacity: 0.2
-}
opacity_20 : Tailwind
opacity_20 =
    Tailwind "opacity-20"


{-| opacity: 0.25
-}
opacity_25 : Tailwind
opacity_25 =
    Tailwind "opacity-25"


{-| opacity: 0.3
-}
opacity_30 : Tailwind
opacity_30 =
    Tailwind "opacity-30"


{-| opacity: 0.4
-}
opacity_40 : Tailwind
opacity_40 =
    Tailwind "opacity-40"


{-| opacity: 0.5
-}
opacity_50 : Tailwind
opacity_50 =
    Tailwind "opacity-50"


{-| opacity: 0.6
-}
opacity_60 : Tailwind
opacity_60 =
    Tailwind "opacity-60"


{-| opacity: 0.7
-}
opacity_70 : Tailwind
opacity_70 =
    Tailwind "opacity-70"


{-| opacity: 0.75
-}
opacity_75 : Tailwind
opacity_75 =
    Tailwind "opacity-75"


{-| opacity: 0.8
-}
opacity_80 : Tailwind
opacity_80 =
    Tailwind "opacity-80"


{-| opacity: 0.9
-}
opacity_90 : Tailwind
opacity_90 =
    Tailwind "opacity-90"


{-| opacity: 0.95
-}
opacity_95 : Tailwind
opacity_95 =
    Tailwind "opacity-95"


{-| opacity: 1
-}
opacity_100 : Tailwind
opacity_100 =
    Tailwind "opacity-100"



-- Z-INDEX


{-| z-index: 0
-}
z_0 : Tailwind
z_0 =
    Tailwind "z-0"


{-| z-index: 10
-}
z_10 : Tailwind
z_10 =
    Tailwind "z-10"


{-| z-index: 20
-}
z_20 : Tailwind
z_20 =
    Tailwind "z-20"


{-| z-index: 30
-}
z_30 : Tailwind
z_30 =
    Tailwind "z-30"


{-| z-index: 40
-}
z_40 : Tailwind
z_40 =
    Tailwind "z-40"


{-| z-index: 50
-}
z_50 : Tailwind
z_50 =
    Tailwind "z-50"


{-| z-index: auto
-}
z_auto : Tailwind
z_auto =
    Tailwind "z-auto"
