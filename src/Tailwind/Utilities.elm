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
    , rounded_xs
    , rounded_sm
    , rounded_md
    , rounded_lg
    , rounded_xl
    , rounded_n2xl
    , rounded_n3xl
    , rounded_n4xl
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
    , neg_bottom_full
    , neg_bottom_px
    , neg_end_full
    , neg_end_px
    , neg_indent_px
    , neg_inset_full
    , neg_inset_px
    , neg_inset_x_full
    , neg_inset_x_px
    , neg_inset_y_full
    , neg_inset_y_px
    , neg_left_full
    , neg_left_px
    , neg_m_px
    , neg_mb_px
    , neg_me_px
    , neg_ml_px
    , neg_mr_px
    , neg_ms_px
    , neg_mt_px
    , neg_mx_px
    , neg_my_px
    , neg_right_full
    , neg_right_px
    , neg_scroll_m_px
    , neg_scroll_mb_px
    , neg_scroll_me_px
    , neg_scroll_ml_px
    , neg_scroll_mr_px
    , neg_scroll_ms_px
    , neg_scroll_mt_px
    , neg_scroll_mx_px
    , neg_scroll_my_px
    , neg_space_x_px
    , neg_space_y_px
    , neg_start_full
    , neg_start_px
    , neg_top_full
    , neg_top_px
    , neg_translate_full
    , neg_translate_px
    , neg_translate_x_full
    , neg_translate_x_px
    , neg_translate_y_full
    , neg_translate_y_px
    , neg_translate_z_px
    , absolute
    , accent_auto
    , align_baseline
    , align_bottom
    , align_middle
    , align_sub
    , align_super
    , align_text_bottom
    , align_text_top
    , align_top
    , animate_none
    , antialiased
    , appearance_auto
    , appearance_none
    , aspect_auto
    , aspect_square
    , auto_cols_auto
    , auto_cols_fr
    , auto_cols_max
    , auto_cols_min
    , auto_rows_auto
    , auto_rows_fr
    , auto_rows_max
    , auto_rows_min
    , backdrop_blur_none
    , backface_hidden
    , backface_visible
    , basis_auto
    , basis_full
    , basis_px
    , bg_auto
    , bg_blend_color
    , bg_blend_color_burn
    , bg_blend_color_dodge
    , bg_blend_darken
    , bg_blend_difference
    , bg_blend_exclusion
    , bg_blend_hard_light
    , bg_blend_hue
    , bg_blend_lighten
    , bg_blend_luminosity
    , bg_blend_multiply
    , bg_blend_normal
    , bg_blend_overlay
    , bg_blend_saturation
    , bg_blend_screen
    , bg_blend_soft_light
    , bg_bottom
    , bg_center
    , bg_clip_border
    , bg_clip_content
    , bg_clip_padding
    , bg_clip_text
    , bg_contain
    , bg_cover
    , bg_fixed
    , bg_gradient_to_b
    , bg_gradient_to_bl
    , bg_gradient_to_br
    , bg_gradient_to_l
    , bg_gradient_to_r
    , bg_gradient_to_t
    , bg_gradient_to_tl
    , bg_gradient_to_tr
    , bg_left
    , bg_left_bottom
    , bg_left_top
    , bg_local
    , bg_no_repeat
    , bg_none
    , bg_origin_border
    , bg_origin_content
    , bg_origin_padding
    , bg_repeat
    , bg_repeat_round
    , bg_repeat_space
    , bg_repeat_x
    , bg_repeat_y
    , bg_right
    , bg_right_bottom
    , bg_right_top
    , bg_scroll
    , bg_top
    , block
    , blur_none
    , border_collapse
    , border_dashed
    , border_dotted
    , border_double
    , border_hidden
    , border_none
    , border_separate
    , border_solid
    , border_spacing_px
    , border_spacing_x_px
    , border_spacing_y_px
    , bottom_auto
    , bottom_full
    , bottom_px
    , box_border
    , box_content
    , box_decoration_clone
    , box_decoration_slice
    , break_after_all
    , break_after_auto
    , break_after_avoid
    , break_after_avoid_page
    , break_after_column
    , break_after_left
    , break_after_page
    , break_after_right
    , break_all
    , break_before_all
    , break_before_auto
    , break_before_avoid
    , break_before_avoid_page
    , break_before_column
    , break_before_left
    , break_before_page
    , break_before_right
    , break_inside_auto
    , break_inside_avoid
    , break_inside_avoid_column
    , break_inside_avoid_page
    , break_keep
    , break_normal
    , break_words
    , capitalize
    , caption_bottom
    , caption_top
    , clear_both
    , clear_end
    , clear_left
    , clear_none
    , clear_right
    , clear_start
    , col_auto
    , col_end_auto
    , col_span_full
    , col_start_auto
    , collapse
    , columns_auto
    , contain_content
    , contain_inline_size
    , contain_layout
    , contain_none
    , contain_paint
    , contain_size
    , contain_strict
    , contain_style
    , container
    , content_around
    , content_baseline
    , content_between
    , content_center
    , content_end
    , content_evenly
    , content_none
    , content_normal
    , content_start
    , content_stretch
    , contents
    , cursor_alias
    , cursor_all_scroll
    , cursor_auto
    , cursor_cell
    , cursor_col_resize
    , cursor_context_menu
    , cursor_copy
    , cursor_crosshair
    , cursor_default
    , cursor_e_resize
    , cursor_ew_resize
    , cursor_grab
    , cursor_grabbing
    , cursor_help
    , cursor_move
    , cursor_n_resize
    , cursor_ne_resize
    , cursor_nesw_resize
    , cursor_no_drop
    , cursor_none
    , cursor_not_allowed
    , cursor_ns_resize
    , cursor_nw_resize
    , cursor_nwse_resize
    , cursor_pointer
    , cursor_progress
    , cursor_row_resize
    , cursor_s_resize
    , cursor_se_resize
    , cursor_sw_resize
    , cursor_text
    , cursor_vertical_text
    , cursor_w_resize
    , cursor_wait
    , cursor_zoom_in
    , cursor_zoom_out
    , decoration_auto
    , decoration_clone
    , decoration_dashed
    , decoration_dotted
    , decoration_double
    , decoration_from_font
    , decoration_slice
    , decoration_solid
    , decoration_wavy
    , diagonal_fractions
    , divide_dashed
    , divide_dotted
    , divide_double
    , divide_none
    , divide_solid
    , divide_x_reverse
    , divide_y_reverse
    , drop_shadow_none
    , duration_initial
    , ease_initial
    , ease_linear
    , end_auto
    , end_full
    , end_px
    , field_sizing_content
    , field_sizing_fixed
    , fill_none
    , fixed
    , flex
    , flex_auto
    , flex_col
    , flex_col_reverse
    , flex_initial
    , flex_none
    , flex_nowrap
    , flex_row
    , flex_row_reverse
    , flex_wrap
    , flex_wrap_reverse
    , float_end
    , float_left
    , float_none
    , float_right
    , float_start
    , flow_root
    , font_stretch_condensed
    , font_stretch_expanded
    , font_stretch_extra_condensed
    , font_stretch_extra_expanded
    , font_stretch_normal
    , font_stretch_semi_condensed
    , font_stretch_semi_expanded
    , font_stretch_ultra_condensed
    , font_stretch_ultra_expanded
    , forced_color_adjust_auto
    , forced_color_adjust_none
    , gap_px
    , gap_x_px
    , gap_y_px
    , grid
    , grid_cols_none
    , grid_cols_subgrid
    , grid_flow_col
    , grid_flow_col_dense
    , grid_flow_dense
    , grid_flow_row
    , grid_flow_row_dense
    , grid_rows_none
    , grid_rows_subgrid
    , h_dvh
    , h_dvw
    , h_lvh
    , h_lvw
    , h_px
    , h_svh
    , h_svw
    , hidden
    , hyphens_auto
    , hyphens_manual
    , hyphens_none
    , indent_px
    , inline
    , inline_block
    , inline_flex
    , inline_grid
    , inline_table
    , inset_auto
    , inset_full
    , inset_px
    , inset_shadow_initial
    , inset_x_auto
    , inset_x_full
    , inset_x_px
    , inset_y_auto
    , inset_y_full
    , inset_y_px
    , invisible
    , isolate
    , isolation_auto
    , italic
    , items_baseline
    , items_center
    , items_end
    , items_start
    , items_stretch
    , justify_around
    , justify_baseline
    , justify_between
    , justify_center
    , justify_end
    , justify_evenly
    , justify_items_center
    , justify_items_end
    , justify_items_normal
    , justify_items_start
    , justify_items_stretch
    , justify_normal
    , justify_self_auto
    , justify_self_center
    , justify_self_end
    , justify_self_start
    , justify_self_stretch
    , justify_start
    , justify_stretch
    , leading_none
    , leading_px
    , left_auto
    , left_full
    , left_px
    , line_clamp_none
    , line_through
    , lining_nums
    , list_decimal
    , list_disc
    , list_image_none
    , list_inside
    , list_item
    , list_none
    , list_outside
    , lowercase
    , m_auto
    , m_px
    , max_h_auto
    , max_h_dvh
    , max_h_dvw
    , max_h_fit
    , max_h_full
    , max_h_lvh
    , max_h_lvw
    , max_h_max
    , max_h_min
    , max_h_none
    , max_h_px
    , max_h_screen
    , max_h_svh
    , max_h_svw
    , max_w_auto
    , max_w_dvh
    , max_w_dvw
    , max_w_fit
    , max_w_full
    , max_w_lvh
    , max_w_lvw
    , max_w_max
    , max_w_min
    , max_w_none
    , max_w_px
    , max_w_screen
    , max_w_svh
    , max_w_svw
    , mb_auto
    , mb_px
    , me_auto
    , me_px
    , min_h_auto
    , min_h_dvh
    , min_h_dvw
    , min_h_fit
    , min_h_full
    , min_h_lvh
    , min_h_lvw
    , min_h_max
    , min_h_min
    , min_h_none
    , min_h_px
    , min_h_screen
    , min_h_svh
    , min_h_svw
    , min_w_auto
    , min_w_dvh
    , min_w_dvw
    , min_w_fit
    , min_w_full
    , min_w_lvh
    , min_w_lvw
    , min_w_max
    , min_w_min
    , min_w_none
    , min_w_px
    , min_w_screen
    , min_w_svh
    , min_w_svw
    , mix_blend_color
    , mix_blend_color_burn
    , mix_blend_color_dodge
    , mix_blend_darken
    , mix_blend_difference
    , mix_blend_exclusion
    , mix_blend_hard_light
    , mix_blend_hue
    , mix_blend_lighten
    , mix_blend_luminosity
    , mix_blend_multiply
    , mix_blend_normal
    , mix_blend_overlay
    , mix_blend_plus_darker
    , mix_blend_plus_lighter
    , mix_blend_saturation
    , mix_blend_screen
    , mix_blend_soft_light
    , ml_auto
    , ml_px
    , mr_auto
    , mr_px
    , ms_auto
    , ms_px
    , mt_auto
    , mt_px
    , mx_auto
    , mx_px
    , my_auto
    , my_px
    , no_underline
    , normal_case
    , normal_nums
    , not_italic
    , not_sr_only
    , object_bottom
    , object_center
    , object_contain
    , object_cover
    , object_fill
    , object_left
    , object_left_bottom
    , object_left_top
    , object_none
    , object_right
    , object_right_bottom
    , object_right_top
    , object_scale_down
    , object_top
    , oldstyle_nums
    , order_first
    , order_last
    , order_none
    , ordinal
    , origin_bottom
    , origin_bottom_left
    , origin_bottom_right
    , origin_center
    , origin_left
    , origin_right
    , origin_top
    , origin_top_left
    , origin_top_right
    , outline_dashed
    , outline_dotted
    , outline_double
    , outline_hidden
    , outline_none
    , outline_solid
    , overflow_auto
    , overflow_clip
    , overflow_ellipsis
    , overflow_hidden
    , overflow_scroll
    , overflow_visible
    , overflow_x_auto
    , overflow_x_clip
    , overflow_x_hidden
    , overflow_x_scroll
    , overflow_x_visible
    , overflow_y_auto
    , overflow_y_clip
    , overflow_y_hidden
    , overflow_y_scroll
    , overflow_y_visible
    , overline
    , overscroll_auto
    , overscroll_contain
    , overscroll_none
    , overscroll_x_auto
    , overscroll_x_contain
    , overscroll_x_none
    , overscroll_y_auto
    , overscroll_y_contain
    , overscroll_y_none
    , p_px
    , pb_px
    , pe_px
    , perspective_none
    , perspective_origin_bottom
    , perspective_origin_bottom_left
    , perspective_origin_bottom_right
    , perspective_origin_center
    , perspective_origin_left
    , perspective_origin_right
    , perspective_origin_top
    , perspective_origin_top_left
    , perspective_origin_top_right
    , pl_px
    , place_content_around
    , place_content_baseline
    , place_content_between
    , place_content_center
    , place_content_end
    , place_content_evenly
    , place_content_start
    , place_content_stretch
    , place_items_baseline
    , place_items_center
    , place_items_end
    , place_items_start
    , place_items_stretch
    , place_self_auto
    , place_self_center
    , place_self_end
    , place_self_start
    , place_self_stretch
    , pointer_events_auto
    , pointer_events_none
    , pr_px
    , proportional_nums
    , ps_px
    , pt_px
    , px_px
    , py_px
    , relative
    , resize
    , resize_none
    , resize_x
    , resize_y
    , right_auto
    , right_full
    , right_px
    , ring_inset
    , rotate_none
    , rounded_b_full
    , rounded_b_none
    , rounded_bl_full
    , rounded_bl_none
    , rounded_br_full
    , rounded_br_none
    , rounded_e_full
    , rounded_e_none
    , rounded_ee_full
    , rounded_ee_none
    , rounded_es_full
    , rounded_es_none
    , rounded_full
    , rounded_l_full
    , rounded_l_none
    , rounded_none
    , rounded_r_full
    , rounded_r_none
    , rounded_s_full
    , rounded_s_none
    , rounded_se_full
    , rounded_se_none
    , rounded_ss_full
    , rounded_ss_none
    , rounded_t_full
    , rounded_t_none
    , rounded_tl_full
    , rounded_tl_none
    , rounded_tr_full
    , rounded_tr_none
    , row_auto
    , row_end_auto
    , row_span_full
    , row_start_auto
    , scale_3d
    , scale_none
    , scheme_dark
    , scheme_light
    , scheme_light_dark
    , scheme_normal
    , scheme_only_dark
    , scheme_only_light
    , scroll_auto
    , scroll_m_px
    , scroll_mb_px
    , scroll_me_px
    , scroll_ml_px
    , scroll_mr_px
    , scroll_ms_px
    , scroll_mt_px
    , scroll_mx_px
    , scroll_my_px
    , scroll_p_px
    , scroll_pb_px
    , scroll_pe_px
    , scroll_pl_px
    , scroll_pr_px
    , scroll_ps_px
    , scroll_pt_px
    , scroll_px_px
    , scroll_py_px
    , scroll_smooth
    , select_all
    , select_auto
    , select_none
    , select_text
    , self_auto
    , self_baseline
    , self_center
    , self_end
    , self_start
    , self_stretch
    , shadow_initial
    , size_auto
    , size_dvh
    , size_dvw
    , size_fit
    , size_full
    , size_lvh
    , size_lvw
    , size_max
    , size_min
    , size_px
    , size_svh
    , size_svw
    , slashed_zero
    , snap_align_none
    , snap_always
    , snap_both
    , snap_center
    , snap_end
    , snap_mandatory
    , snap_none
    , snap_normal
    , snap_proximity
    , snap_start
    , snap_x
    , snap_y
    , space_x_px
    , space_x_reverse
    , space_y_px
    , space_y_reverse
    , sr_only
    , stacked_fractions
    , start_auto
    , start_full
    , start_px
    , static
    , sticky
    , stroke_none
    , subpixel_antialiased
    , table
    , table_auto
    , table_caption
    , table_cell
    , table_column
    , table_column_group
    , table_fixed
    , table_footer_group
    , table_header_group
    , table_row
    , table_row_group
    , tabular_nums
    , text_balance
    , text_center
    , text_clip
    , text_ellipsis
    , text_end
    , text_justify
    , text_left
    , text_nowrap
    , text_pretty
    , text_right
    , text_start
    , text_wrap
    , top_auto
    , top_full
    , top_px
    , touch_auto
    , touch_manipulation
    , touch_none
    , touch_pan_down
    , touch_pan_left
    , touch_pan_right
    , touch_pan_up
    , touch_pan_x
    , touch_pan_y
    , touch_pinch_zoom
    , transform_3d
    , transform_border
    , transform_content
    , transform_cpu
    , transform_fill
    , transform_flat
    , transform_gpu
    , transform_none
    , transform_stroke
    , transform_view
    , transition_all
    , transition_colors
    , transition_discrete
    , transition_none
    , transition_normal
    , transition_opacity
    , transition_shadow
    , transition_transform
    , translate_3d
    , translate_full
    , translate_none
    , translate_px
    , translate_x_full
    , translate_x_px
    , translate_y_full
    , translate_y_px
    , translate_z_px
    , truncate
    , underline
    , underline_offset_auto
    , uppercase
    , via_none
    , visible
    , w_dvh
    , w_dvw
    , w_lvh
    , w_lvw
    , w_px
    , w_svh
    , w_svw
    , whitespace_break_spaces
    , whitespace_normal
    , whitespace_nowrap
    , whitespace_pre
    , whitespace_pre_line
    , whitespace_pre_wrap
    , will_change_auto
    , will_change_contents
    , will_change_scroll
    , will_change_transform
    )

{-| Tailwind CSS utility classes as Elm functions.

All functions return the opaque `Tailwind` type. Use `Tailwind.classes` to
convert a list of Tailwind values to an Html.Attribute.

Following elm-tailwind-modules naming conventions:

  - Hyphens become underscores: `flex-col` → `flex_col`
  - Numeric prefixes get 'n': `2xl` → `n2xl`
  - Fractions use 'over': `w-1/2` → `w_1over2`
  - Decimals use '_dot_': `p-0.5` → `p_0_dot_5`


## Spacing

@docs p, px, py, pt, pr, pb, pl, m, mx, my, mt, mr, mb, ml, neg_m, neg_mx, neg_my, neg_mt, neg_mr, neg_mb, neg_ml, gap, gap_x, gap_y


## Layout

@docs 


## Sizing

@docs w, w_1over2, w_1over3, w_2over3, w_1over4, w_2over4, w_3over4, w_1over5, w_2over5, w_3over5, w_4over5, w_1over6, w_2over6, w_3over6, w_4over6, w_5over6, w_1over12, w_2over12, w_3over12, w_4over12, w_5over12, w_6over12, w_7over12, w_8over12, w_9over12, w_10over12, w_11over12, w_full, w_screen, w_auto, w_min, w_max, w_fit, h, h_1over2, h_1over3, h_2over3, h_1over4, h_2over4, h_3over4, h_1over5, h_2over5, h_3over5, h_4over5, h_1over6, h_2over6, h_3over6, h_4over6, h_5over6, h_1over12, h_2over12, h_3over12, h_4over12, h_5over12, h_6over12, h_7over12, h_8over12, h_9over12, h_10over12, h_11over12, h_full, h_screen, h_auto, h_min, h_max, h_fit, min_w, max_w, min_h, max_h


## Typography

@docs 


## Font Sizes

@docs text_xs, text_sm, text_base, text_lg, text_xl, text_n2xl, text_n3xl, text_n4xl, text_n5xl, text_n6xl, text_n7xl, text_n8xl, text_n9xl


## Font Weights

@docs font_thin, font_extralight, font_light, font_normal, font_medium, font_semibold, font_bold, font_extrabold, font_black


## Borders

@docs 


## Border Radius

@docs rounded_xs, rounded_sm, rounded_md, rounded_lg, rounded_xl, rounded_n2xl, rounded_n3xl, rounded_n4xl


## Effects

@docs 


## Shadows

@docs shadow_n2xs, shadow_xs, shadow_sm, shadow_md, shadow_lg, shadow_xl, shadow_n2xl, shadow_inner


## Colors

@docs text_color, bg_color, border_color, ring_color, placeholder_color


## Opacity

@docs opacity_0, opacity_5, opacity_10, opacity_20, opacity_25, opacity_30, opacity_40, opacity_50, opacity_60, opacity_70, opacity_75, opacity_80, opacity_90, opacity_95, opacity_100


## Z-Index

@docs z_0, z_10, z_20, z_30, z_40, z_50, z_auto



## Additional Utilities

@docs neg_bottom_full, neg_bottom_px, neg_end_full, neg_end_px, neg_indent_px, neg_inset_full, neg_inset_px, neg_inset_x_full, neg_inset_x_px, neg_inset_y_full, neg_inset_y_px, neg_left_full, neg_left_px, neg_m_px, neg_mb_px, neg_me_px, neg_ml_px, neg_mr_px, neg_ms_px, neg_mt_px, neg_mx_px, neg_my_px, neg_right_full, neg_right_px, neg_scroll_m_px, neg_scroll_mb_px, neg_scroll_me_px, neg_scroll_ml_px, neg_scroll_mr_px, neg_scroll_ms_px, neg_scroll_mt_px, neg_scroll_mx_px, neg_scroll_my_px, neg_space_x_px, neg_space_y_px, neg_start_full, neg_start_px, neg_top_full, neg_top_px, neg_translate_full, neg_translate_px, neg_translate_x_full, neg_translate_x_px, neg_translate_y_full, neg_translate_y_px, neg_translate_z_px, absolute, accent_auto, align_baseline, align_bottom, align_middle, align_sub, align_super, align_text_bottom, align_text_top, align_top, animate_none, antialiased, appearance_auto, appearance_none, aspect_auto, aspect_square, auto_cols_auto, auto_cols_fr, auto_cols_max, auto_cols_min, auto_rows_auto, auto_rows_fr, auto_rows_max, auto_rows_min, backdrop_blur_none, backface_hidden, backface_visible, basis_auto, basis_full, basis_px, bg_auto, bg_blend_color, bg_blend_color_burn, bg_blend_color_dodge, bg_blend_darken, bg_blend_difference, bg_blend_exclusion, bg_blend_hard_light, bg_blend_hue, bg_blend_lighten, bg_blend_luminosity, bg_blend_multiply, bg_blend_normal, bg_blend_overlay, bg_blend_saturation, bg_blend_screen, bg_blend_soft_light, bg_bottom, bg_center, bg_clip_border, bg_clip_content, bg_clip_padding, bg_clip_text, bg_contain, bg_cover, bg_fixed, bg_gradient_to_b, bg_gradient_to_bl, bg_gradient_to_br, bg_gradient_to_l, bg_gradient_to_r, bg_gradient_to_t, bg_gradient_to_tl, bg_gradient_to_tr, bg_left, bg_left_bottom, bg_left_top, bg_local, bg_no_repeat, bg_none, bg_origin_border, bg_origin_content, bg_origin_padding, bg_repeat, bg_repeat_round, bg_repeat_space, bg_repeat_x, bg_repeat_y, bg_right, bg_right_bottom, bg_right_top, bg_scroll, bg_top, block, blur_none, border_collapse, border_dashed, border_dotted, border_double, border_hidden, border_none, border_separate, border_solid, border_spacing_px, border_spacing_x_px, border_spacing_y_px, bottom_auto, bottom_full, bottom_px, box_border, box_content, box_decoration_clone, box_decoration_slice, break_after_all, break_after_auto, break_after_avoid, break_after_avoid_page, break_after_column, break_after_left, break_after_page, break_after_right, break_all, break_before_all, break_before_auto, break_before_avoid, break_before_avoid_page, break_before_column, break_before_left, break_before_page, break_before_right, break_inside_auto, break_inside_avoid, break_inside_avoid_column, break_inside_avoid_page, break_keep, break_normal, break_words, capitalize, caption_bottom, caption_top, clear_both, clear_end, clear_left, clear_none, clear_right, clear_start, col_auto, col_end_auto, col_span_full, col_start_auto, collapse, columns_auto, contain_content, contain_inline_size, contain_layout, contain_none, contain_paint, contain_size, contain_strict, contain_style, container, content_around, content_baseline, content_between, content_center, content_end, content_evenly, content_none, content_normal, content_start, content_stretch, contents, cursor_alias, cursor_all_scroll, cursor_auto, cursor_cell, cursor_col_resize, cursor_context_menu, cursor_copy, cursor_crosshair, cursor_default, cursor_e_resize, cursor_ew_resize, cursor_grab, cursor_grabbing, cursor_help, cursor_move, cursor_n_resize, cursor_ne_resize, cursor_nesw_resize, cursor_no_drop, cursor_none, cursor_not_allowed, cursor_ns_resize, cursor_nw_resize, cursor_nwse_resize, cursor_pointer, cursor_progress, cursor_row_resize, cursor_s_resize, cursor_se_resize, cursor_sw_resize, cursor_text, cursor_vertical_text, cursor_w_resize, cursor_wait, cursor_zoom_in, cursor_zoom_out, decoration_auto, decoration_clone, decoration_dashed, decoration_dotted, decoration_double, decoration_from_font, decoration_slice, decoration_solid, decoration_wavy, diagonal_fractions, divide_dashed, divide_dotted, divide_double, divide_none, divide_solid, divide_x_reverse, divide_y_reverse, drop_shadow_none, duration_initial, ease_initial, ease_linear, end_auto, end_full, end_px, field_sizing_content, field_sizing_fixed, fill_none, fixed, flex, flex_auto, flex_col, flex_col_reverse, flex_initial, flex_none, flex_nowrap, flex_row, flex_row_reverse, flex_wrap, flex_wrap_reverse, float_end, float_left, float_none, float_right, float_start, flow_root, font_stretch_condensed, font_stretch_expanded, font_stretch_extra_condensed, font_stretch_extra_expanded, font_stretch_normal, font_stretch_semi_condensed, font_stretch_semi_expanded, font_stretch_ultra_condensed, font_stretch_ultra_expanded, forced_color_adjust_auto, forced_color_adjust_none, gap_px, gap_x_px, gap_y_px, grid, grid_cols_none, grid_cols_subgrid, grid_flow_col, grid_flow_col_dense, grid_flow_dense, grid_flow_row, grid_flow_row_dense, grid_rows_none, grid_rows_subgrid, h_dvh, h_dvw, h_lvh, h_lvw, h_px, h_svh, h_svw, hidden, hyphens_auto, hyphens_manual, hyphens_none, indent_px, inline, inline_block, inline_flex, inline_grid, inline_table, inset_auto, inset_full, inset_px, inset_shadow_initial, inset_x_auto, inset_x_full, inset_x_px, inset_y_auto, inset_y_full, inset_y_px, invisible, isolate, isolation_auto, italic, items_baseline, items_center, items_end, items_start, items_stretch, justify_around, justify_baseline, justify_between, justify_center, justify_end, justify_evenly, justify_items_center, justify_items_end, justify_items_normal, justify_items_start, justify_items_stretch, justify_normal, justify_self_auto, justify_self_center, justify_self_end, justify_self_start, justify_self_stretch, justify_start, justify_stretch, leading_none, leading_px, left_auto, left_full, left_px, line_clamp_none, line_through, lining_nums, list_decimal, list_disc, list_image_none, list_inside, list_item, list_none, list_outside, lowercase, m_auto, m_px, max_h_auto, max_h_dvh, max_h_dvw, max_h_fit, max_h_full, max_h_lvh, max_h_lvw, max_h_max, max_h_min, max_h_none, max_h_px, max_h_screen, max_h_svh, max_h_svw, max_w_auto, max_w_dvh, max_w_dvw, max_w_fit, max_w_full, max_w_lvh, max_w_lvw, max_w_max, max_w_min, max_w_none, max_w_px, max_w_screen, max_w_svh, max_w_svw, mb_auto, mb_px, me_auto, me_px, min_h_auto, min_h_dvh, min_h_dvw, min_h_fit, min_h_full, min_h_lvh, min_h_lvw, min_h_max, min_h_min, min_h_none, min_h_px, min_h_screen, min_h_svh, min_h_svw, min_w_auto, min_w_dvh, min_w_dvw, min_w_fit, min_w_full, min_w_lvh, min_w_lvw, min_w_max, min_w_min, min_w_none, min_w_px, min_w_screen, min_w_svh, min_w_svw, mix_blend_color, mix_blend_color_burn, mix_blend_color_dodge, mix_blend_darken, mix_blend_difference, mix_blend_exclusion, mix_blend_hard_light, mix_blend_hue, mix_blend_lighten, mix_blend_luminosity, mix_blend_multiply, mix_blend_normal, mix_blend_overlay, mix_blend_plus_darker, mix_blend_plus_lighter, mix_blend_saturation, mix_blend_screen, mix_blend_soft_light, ml_auto, ml_px, mr_auto, mr_px, ms_auto, ms_px, mt_auto, mt_px, mx_auto, mx_px, my_auto, my_px, no_underline, normal_case, normal_nums, not_italic, not_sr_only, object_bottom, object_center, object_contain, object_cover, object_fill, object_left, object_left_bottom, object_left_top, object_none, object_right, object_right_bottom, object_right_top, object_scale_down, object_top, oldstyle_nums, order_first, order_last, order_none, ordinal, origin_bottom, origin_bottom_left, origin_bottom_right, origin_center, origin_left, origin_right, origin_top, origin_top_left, origin_top_right, outline_dashed, outline_dotted, outline_double, outline_hidden, outline_none, outline_solid, overflow_auto, overflow_clip, overflow_ellipsis, overflow_hidden, overflow_scroll, overflow_visible, overflow_x_auto, overflow_x_clip, overflow_x_hidden, overflow_x_scroll, overflow_x_visible, overflow_y_auto, overflow_y_clip, overflow_y_hidden, overflow_y_scroll, overflow_y_visible, overline, overscroll_auto, overscroll_contain, overscroll_none, overscroll_x_auto, overscroll_x_contain, overscroll_x_none, overscroll_y_auto, overscroll_y_contain, overscroll_y_none, p_px, pb_px, pe_px, perspective_none, perspective_origin_bottom, perspective_origin_bottom_left, perspective_origin_bottom_right, perspective_origin_center, perspective_origin_left, perspective_origin_right, perspective_origin_top, perspective_origin_top_left, perspective_origin_top_right, pl_px, place_content_around, place_content_baseline, place_content_between, place_content_center, place_content_end, place_content_evenly, place_content_start, place_content_stretch, place_items_baseline, place_items_center, place_items_end, place_items_start, place_items_stretch, place_self_auto, place_self_center, place_self_end, place_self_start, place_self_stretch, pointer_events_auto, pointer_events_none, pr_px, proportional_nums, ps_px, pt_px, px_px, py_px, relative, resize, resize_none, resize_x, resize_y, right_auto, right_full, right_px, ring_inset, rotate_none, rounded_b_full, rounded_b_none, rounded_bl_full, rounded_bl_none, rounded_br_full, rounded_br_none, rounded_e_full, rounded_e_none, rounded_ee_full, rounded_ee_none, rounded_es_full, rounded_es_none, rounded_full, rounded_l_full, rounded_l_none, rounded_none, rounded_r_full, rounded_r_none, rounded_s_full, rounded_s_none, rounded_se_full, rounded_se_none, rounded_ss_full, rounded_ss_none, rounded_t_full, rounded_t_none, rounded_tl_full, rounded_tl_none, rounded_tr_full, rounded_tr_none, row_auto, row_end_auto, row_span_full, row_start_auto, scale_3d, scale_none, scheme_dark, scheme_light, scheme_light_dark, scheme_normal, scheme_only_dark, scheme_only_light, scroll_auto, scroll_m_px, scroll_mb_px, scroll_me_px, scroll_ml_px, scroll_mr_px, scroll_ms_px, scroll_mt_px, scroll_mx_px, scroll_my_px, scroll_p_px, scroll_pb_px, scroll_pe_px, scroll_pl_px, scroll_pr_px, scroll_ps_px, scroll_pt_px, scroll_px_px, scroll_py_px, scroll_smooth, select_all, select_auto, select_none, select_text, self_auto, self_baseline, self_center, self_end, self_start, self_stretch, shadow_initial, size_auto, size_dvh, size_dvw, size_fit, size_full, size_lvh, size_lvw, size_max, size_min, size_px, size_svh, size_svw, slashed_zero, snap_align_none, snap_always, snap_both, snap_center, snap_end, snap_mandatory, snap_none, snap_normal, snap_proximity, snap_start, snap_x, snap_y, space_x_px, space_x_reverse, space_y_px, space_y_reverse, sr_only, stacked_fractions, start_auto, start_full, start_px, static, sticky, stroke_none, subpixel_antialiased, table, table_auto, table_caption, table_cell, table_column, table_column_group, table_fixed, table_footer_group, table_header_group, table_row, table_row_group, tabular_nums, text_balance, text_center, text_clip, text_ellipsis, text_end, text_justify, text_left, text_nowrap, text_pretty, text_right, text_start, text_wrap, top_auto, top_full, top_px, touch_auto, touch_manipulation, touch_none, touch_pan_down, touch_pan_left, touch_pan_right, touch_pan_up, touch_pan_x, touch_pan_y, touch_pinch_zoom, transform_3d, transform_border, transform_content, transform_cpu, transform_fill, transform_flat, transform_gpu, transform_none, transform_stroke, transform_view, transition_all, transition_colors, transition_discrete, transition_none, transition_normal, transition_opacity, transition_shadow, transition_transform, translate_3d, translate_full, translate_none, translate_px, translate_x_full, translate_x_px, translate_y_full, translate_y_px, translate_z_px, truncate, underline, underline_offset_auto, uppercase, via_none, visible, w_dvh, w_dvw, w_lvh, w_lvw, w_px, w_svh, w_svw, whitespace_break_spaces, whitespace_normal, whitespace_nowrap, whitespace_pre, whitespace_pre_line, whitespace_pre_wrap, will_change_auto, will_change_contents, will_change_scroll, will_change_transform


-}

import Tailwind exposing (Tailwind(..))
import Tailwind.Theme exposing (Color, Spacing(..), colorToString, spacingToString)


-- SPACING

-- PADDING

{-| Padding on all sides.

    p s4  -- produces "p-4" (1rem)

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

    m s4  -- produces "m-4" (1rem)

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

    gap s4  -- produces "gap-4"

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




-- SIZING

-- WIDTH (using Spacing)

{-| Width from spacing scale.

    w s64  -- produces "w-64" (16rem)

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

    h s32  -- produces "h-32" (8rem)

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

-- ADDITIONAL UTILITIES (from Tailwind design system)

{-| bottom: -100%;
-}
neg_bottom_full : Tailwind
neg_bottom_full =
    Tailwind "-bottom-full"

{-| bottom: -1px;
-}
neg_bottom_px : Tailwind
neg_bottom_px =
    Tailwind "-bottom-px"

{-| inset-inline-end: -100%;
-}
neg_end_full : Tailwind
neg_end_full =
    Tailwind "-end-full"

{-| inset-inline-end: -1px;
-}
neg_end_px : Tailwind
neg_end_px =
    Tailwind "-end-px"

{-| text-indent: -1px;
-}
neg_indent_px : Tailwind
neg_indent_px =
    Tailwind "-indent-px"

{-| inset: -100%;
-}
neg_inset_full : Tailwind
neg_inset_full =
    Tailwind "-inset-full"

{-| inset: -1px;
-}
neg_inset_px : Tailwind
neg_inset_px =
    Tailwind "-inset-px"

{-| inset-inline: -100%;
-}
neg_inset_x_full : Tailwind
neg_inset_x_full =
    Tailwind "-inset-x-full"

{-| inset-inline: -1px;
-}
neg_inset_x_px : Tailwind
neg_inset_x_px =
    Tailwind "-inset-x-px"

{-| inset-block: -100%;
-}
neg_inset_y_full : Tailwind
neg_inset_y_full =
    Tailwind "-inset-y-full"

{-| inset-block: -1px;
-}
neg_inset_y_px : Tailwind
neg_inset_y_px =
    Tailwind "-inset-y-px"

{-| left: -100%;
-}
neg_left_full : Tailwind
neg_left_full =
    Tailwind "-left-full"

{-| left: -1px;
-}
neg_left_px : Tailwind
neg_left_px =
    Tailwind "-left-px"

{-| margin: -1px;
-}
neg_m_px : Tailwind
neg_m_px =
    Tailwind "-m-px"

{-| margin-bottom: -1px;
-}
neg_mb_px : Tailwind
neg_mb_px =
    Tailwind "-mb-px"

{-| margin-inline-end: -1px;
-}
neg_me_px : Tailwind
neg_me_px =
    Tailwind "-me-px"

{-| margin-left: -1px;
-}
neg_ml_px : Tailwind
neg_ml_px =
    Tailwind "-ml-px"

{-| margin-right: -1px;
-}
neg_mr_px : Tailwind
neg_mr_px =
    Tailwind "-mr-px"

{-| margin-inline-start: -1px;
-}
neg_ms_px : Tailwind
neg_ms_px =
    Tailwind "-ms-px"

{-| margin-top: -1px;
-}
neg_mt_px : Tailwind
neg_mt_px =
    Tailwind "-mt-px"

{-| margin-inline: -1px;
-}
neg_mx_px : Tailwind
neg_mx_px =
    Tailwind "-mx-px"

{-| margin-block: -1px;
-}
neg_my_px : Tailwind
neg_my_px =
    Tailwind "-my-px"

{-| right: -100%;
-}
neg_right_full : Tailwind
neg_right_full =
    Tailwind "-right-full"

{-| right: -1px;
-}
neg_right_px : Tailwind
neg_right_px =
    Tailwind "-right-px"

{-| scroll-margin: -1px;
-}
neg_scroll_m_px : Tailwind
neg_scroll_m_px =
    Tailwind "-scroll-m-px"

{-| scroll-margin-bottom: -1px;
-}
neg_scroll_mb_px : Tailwind
neg_scroll_mb_px =
    Tailwind "-scroll-mb-px"

{-| scroll-margin-inline-end: -1px;
-}
neg_scroll_me_px : Tailwind
neg_scroll_me_px =
    Tailwind "-scroll-me-px"

{-| scroll-margin-left: -1px;
-}
neg_scroll_ml_px : Tailwind
neg_scroll_ml_px =
    Tailwind "-scroll-ml-px"

{-| scroll-margin-right: -1px;
-}
neg_scroll_mr_px : Tailwind
neg_scroll_mr_px =
    Tailwind "-scroll-mr-px"

{-| scroll-margin-inline-start: -1px;
-}
neg_scroll_ms_px : Tailwind
neg_scroll_ms_px =
    Tailwind "-scroll-ms-px"

{-| scroll-margin-top: -1px;
-}
neg_scroll_mt_px : Tailwind
neg_scroll_mt_px =
    Tailwind "-scroll-mt-px"

{-| scroll-margin-inline: -1px;
-}
neg_scroll_mx_px : Tailwind
neg_scroll_mx_px =
    Tailwind "-scroll-mx-px"

{-| scroll-margin-block: -1px;
-}
neg_scroll_my_px : Tailwind
neg_scroll_my_px =
    Tailwind "-scroll-my-px"

{-| :where(& > :not(:last-child)) {
    --tw-space-x-reverse: 0;
    margin-inline-start: calc(-1px * var(--tw-space-x-reverse));
    margin-inline-end: calc(-1px * calc(1 - var(--tw-space-x-reverse)));
-}
neg_space_x_px : Tailwind
neg_space_x_px =
    Tailwind "-space-x-px"

{-| :where(& > :not(:last-child)) {
    --tw-space-y-reverse: 0;
    margin-block-start: calc(-1px * var(--tw-space-y-reverse));
    margin-block-end: calc(-1px * calc(1 - var(--tw-space-y-reverse)));
-}
neg_space_y_px : Tailwind
neg_space_y_px =
    Tailwind "-space-y-px"

{-| inset-inline-start: -100%;
-}
neg_start_full : Tailwind
neg_start_full =
    Tailwind "-start-full"

{-| inset-inline-start: -1px;
-}
neg_start_px : Tailwind
neg_start_px =
    Tailwind "-start-px"

{-| top: -100%;
-}
neg_top_full : Tailwind
neg_top_full =
    Tailwind "-top-full"

{-| top: -1px;
-}
neg_top_px : Tailwind
neg_top_px =
    Tailwind "-top-px"

{-| --tw-translate-x: -100%;
  --tw-translate-y: -100%;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
neg_translate_full : Tailwind
neg_translate_full =
    Tailwind "-translate-full"

{-| --tw-translate-x: -1px;
  --tw-translate-y: -1px;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
neg_translate_px : Tailwind
neg_translate_px =
    Tailwind "-translate-px"

{-| --tw-translate-x: -100%;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
neg_translate_x_full : Tailwind
neg_translate_x_full =
    Tailwind "-translate-x-full"

{-| --tw-translate-x: -1px;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
neg_translate_x_px : Tailwind
neg_translate_x_px =
    Tailwind "-translate-x-px"

{-| --tw-translate-y: -100%;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
neg_translate_y_full : Tailwind
neg_translate_y_full =
    Tailwind "-translate-y-full"

{-| --tw-translate-y: -1px;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
neg_translate_y_px : Tailwind
neg_translate_y_px =
    Tailwind "-translate-y-px"

{-| --tw-translate-z: -1px;
  translate: var(--tw-translate-x) var(--tw-translate-y) var(--tw-translate-z);
-}
neg_translate_z_px : Tailwind
neg_translate_z_px =
    Tailwind "-translate-z-px"

{-| position: absolute;
-}
absolute : Tailwind
absolute =
    Tailwind "absolute"

{-| accent-color: auto;
-}
accent_auto : Tailwind
accent_auto =
    Tailwind "accent-auto"

{-| vertical-align: baseline;
-}
align_baseline : Tailwind
align_baseline =
    Tailwind "align-baseline"

{-| vertical-align: bottom;
-}
align_bottom : Tailwind
align_bottom =
    Tailwind "align-bottom"

{-| vertical-align: middle;
-}
align_middle : Tailwind
align_middle =
    Tailwind "align-middle"

{-| vertical-align: sub;
-}
align_sub : Tailwind
align_sub =
    Tailwind "align-sub"

{-| vertical-align: super;
-}
align_super : Tailwind
align_super =
    Tailwind "align-super"

{-| vertical-align: text-bottom;
-}
align_text_bottom : Tailwind
align_text_bottom =
    Tailwind "align-text-bottom"

{-| vertical-align: text-top;
-}
align_text_top : Tailwind
align_text_top =
    Tailwind "align-text-top"

{-| vertical-align: top;
-}
align_top : Tailwind
align_top =
    Tailwind "align-top"

{-| animation: none;
-}
animate_none : Tailwind
animate_none =
    Tailwind "animate-none"

{-| -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
-}
antialiased : Tailwind
antialiased =
    Tailwind "antialiased"

{-| appearance: auto;
-}
appearance_auto : Tailwind
appearance_auto =
    Tailwind "appearance-auto"

{-| appearance: none;
-}
appearance_none : Tailwind
appearance_none =
    Tailwind "appearance-none"

{-| aspect-ratio: auto;
-}
aspect_auto : Tailwind
aspect_auto =
    Tailwind "aspect-auto"

{-| aspect-ratio: 1 / 1;
-}
aspect_square : Tailwind
aspect_square =
    Tailwind "aspect-square"

{-| grid-auto-columns: auto;
-}
auto_cols_auto : Tailwind
auto_cols_auto =
    Tailwind "auto-cols-auto"

{-| grid-auto-columns: minmax(0, 1fr);
-}
auto_cols_fr : Tailwind
auto_cols_fr =
    Tailwind "auto-cols-fr"

{-| grid-auto-columns: max-content;
-}
auto_cols_max : Tailwind
auto_cols_max =
    Tailwind "auto-cols-max"

{-| grid-auto-columns: min-content;
-}
auto_cols_min : Tailwind
auto_cols_min =
    Tailwind "auto-cols-min"

{-| grid-auto-rows: auto;
-}
auto_rows_auto : Tailwind
auto_rows_auto =
    Tailwind "auto-rows-auto"

{-| grid-auto-rows: minmax(0, 1fr);
-}
auto_rows_fr : Tailwind
auto_rows_fr =
    Tailwind "auto-rows-fr"

{-| grid-auto-rows: max-content;
-}
auto_rows_max : Tailwind
auto_rows_max =
    Tailwind "auto-rows-max"

{-| grid-auto-rows: min-content;
-}
auto_rows_min : Tailwind
auto_rows_min =
    Tailwind "auto-rows-min"

{-| --tw-backdrop-blur:  ;
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_none : Tailwind
backdrop_blur_none =
    Tailwind "backdrop-blur-none"

{-| backface-visibility: hidden;
-}
backface_hidden : Tailwind
backface_hidden =
    Tailwind "backface-hidden"

{-| backface-visibility: visible;
-}
backface_visible : Tailwind
backface_visible =
    Tailwind "backface-visible"

{-| flex-basis: auto;
-}
basis_auto : Tailwind
basis_auto =
    Tailwind "basis-auto"

{-| flex-basis: 100%;
-}
basis_full : Tailwind
basis_full =
    Tailwind "basis-full"

{-| flex-basis: 1px;
-}
basis_px : Tailwind
basis_px =
    Tailwind "basis-px"

{-| background-size: auto;
-}
bg_auto : Tailwind
bg_auto =
    Tailwind "bg-auto"

{-| background-blend-mode: color;
-}
bg_blend_color : Tailwind
bg_blend_color =
    Tailwind "bg-blend-color"

{-| background-blend-mode: color-burn;
-}
bg_blend_color_burn : Tailwind
bg_blend_color_burn =
    Tailwind "bg-blend-color-burn"

{-| background-blend-mode: color-dodge;
-}
bg_blend_color_dodge : Tailwind
bg_blend_color_dodge =
    Tailwind "bg-blend-color-dodge"

{-| background-blend-mode: darken;
-}
bg_blend_darken : Tailwind
bg_blend_darken =
    Tailwind "bg-blend-darken"

{-| background-blend-mode: difference;
-}
bg_blend_difference : Tailwind
bg_blend_difference =
    Tailwind "bg-blend-difference"

{-| background-blend-mode: exclusion;
-}
bg_blend_exclusion : Tailwind
bg_blend_exclusion =
    Tailwind "bg-blend-exclusion"

{-| background-blend-mode: hard-light;
-}
bg_blend_hard_light : Tailwind
bg_blend_hard_light =
    Tailwind "bg-blend-hard-light"

{-| background-blend-mode: hue;
-}
bg_blend_hue : Tailwind
bg_blend_hue =
    Tailwind "bg-blend-hue"

{-| background-blend-mode: lighten;
-}
bg_blend_lighten : Tailwind
bg_blend_lighten =
    Tailwind "bg-blend-lighten"

{-| background-blend-mode: luminosity;
-}
bg_blend_luminosity : Tailwind
bg_blend_luminosity =
    Tailwind "bg-blend-luminosity"

{-| background-blend-mode: multiply;
-}
bg_blend_multiply : Tailwind
bg_blend_multiply =
    Tailwind "bg-blend-multiply"

{-| background-blend-mode: normal;
-}
bg_blend_normal : Tailwind
bg_blend_normal =
    Tailwind "bg-blend-normal"

{-| background-blend-mode: overlay;
-}
bg_blend_overlay : Tailwind
bg_blend_overlay =
    Tailwind "bg-blend-overlay"

{-| background-blend-mode: saturation;
-}
bg_blend_saturation : Tailwind
bg_blend_saturation =
    Tailwind "bg-blend-saturation"

{-| background-blend-mode: screen;
-}
bg_blend_screen : Tailwind
bg_blend_screen =
    Tailwind "bg-blend-screen"

{-| background-blend-mode: soft-light;
-}
bg_blend_soft_light : Tailwind
bg_blend_soft_light =
    Tailwind "bg-blend-soft-light"

{-| background-position: bottom;
-}
bg_bottom : Tailwind
bg_bottom =
    Tailwind "bg-bottom"

{-| background-position: center;
-}
bg_center : Tailwind
bg_center =
    Tailwind "bg-center"

{-| background-clip: border-box;
-}
bg_clip_border : Tailwind
bg_clip_border =
    Tailwind "bg-clip-border"

{-| background-clip: content-box;
-}
bg_clip_content : Tailwind
bg_clip_content =
    Tailwind "bg-clip-content"

{-| background-clip: padding-box;
-}
bg_clip_padding : Tailwind
bg_clip_padding =
    Tailwind "bg-clip-padding"

{-| background-clip: text;
-}
bg_clip_text : Tailwind
bg_clip_text =
    Tailwind "bg-clip-text"

{-| background-size: contain;
-}
bg_contain : Tailwind
bg_contain =
    Tailwind "bg-contain"

{-| background-size: cover;
-}
bg_cover : Tailwind
bg_cover =
    Tailwind "bg-cover"

{-| background-attachment: fixed;
-}
bg_fixed : Tailwind
bg_fixed =
    Tailwind "bg-fixed"

{-| --tw-gradient-position: to bottom in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_b : Tailwind
bg_gradient_to_b =
    Tailwind "bg-gradient-to-b"

{-| --tw-gradient-position: to bottom left in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_bl : Tailwind
bg_gradient_to_bl =
    Tailwind "bg-gradient-to-bl"

{-| --tw-gradient-position: to bottom right in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_br : Tailwind
bg_gradient_to_br =
    Tailwind "bg-gradient-to-br"

{-| --tw-gradient-position: to left in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_l : Tailwind
bg_gradient_to_l =
    Tailwind "bg-gradient-to-l"

{-| --tw-gradient-position: to right in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_r : Tailwind
bg_gradient_to_r =
    Tailwind "bg-gradient-to-r"

{-| --tw-gradient-position: to top in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_t : Tailwind
bg_gradient_to_t =
    Tailwind "bg-gradient-to-t"

{-| --tw-gradient-position: to top left in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_tl : Tailwind
bg_gradient_to_tl =
    Tailwind "bg-gradient-to-tl"

{-| --tw-gradient-position: to top right in oklab,;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_tr : Tailwind
bg_gradient_to_tr =
    Tailwind "bg-gradient-to-tr"

{-| background-position: left;
-}
bg_left : Tailwind
bg_left =
    Tailwind "bg-left"

{-| background-position: left bottom;
-}
bg_left_bottom : Tailwind
bg_left_bottom =
    Tailwind "bg-left-bottom"

{-| background-position: left top;
-}
bg_left_top : Tailwind
bg_left_top =
    Tailwind "bg-left-top"

{-| background-attachment: local;
-}
bg_local : Tailwind
bg_local =
    Tailwind "bg-local"

{-| background-repeat: no-repeat;
-}
bg_no_repeat : Tailwind
bg_no_repeat =
    Tailwind "bg-no-repeat"

{-| background-image: none;
-}
bg_none : Tailwind
bg_none =
    Tailwind "bg-none"

{-| background-origin: border-box;
-}
bg_origin_border : Tailwind
bg_origin_border =
    Tailwind "bg-origin-border"

{-| background-origin: content-box;
-}
bg_origin_content : Tailwind
bg_origin_content =
    Tailwind "bg-origin-content"

{-| background-origin: padding-box;
-}
bg_origin_padding : Tailwind
bg_origin_padding =
    Tailwind "bg-origin-padding"

{-| background-repeat: repeat;
-}
bg_repeat : Tailwind
bg_repeat =
    Tailwind "bg-repeat"

{-| background-repeat: round;
-}
bg_repeat_round : Tailwind
bg_repeat_round =
    Tailwind "bg-repeat-round"

{-| background-repeat: space;
-}
bg_repeat_space : Tailwind
bg_repeat_space =
    Tailwind "bg-repeat-space"

{-| background-repeat: repeat-x;
-}
bg_repeat_x : Tailwind
bg_repeat_x =
    Tailwind "bg-repeat-x"

{-| background-repeat: repeat-y;
-}
bg_repeat_y : Tailwind
bg_repeat_y =
    Tailwind "bg-repeat-y"

{-| background-position: right;
-}
bg_right : Tailwind
bg_right =
    Tailwind "bg-right"

{-| background-position: right bottom;
-}
bg_right_bottom : Tailwind
bg_right_bottom =
    Tailwind "bg-right-bottom"

{-| background-position: right top;
-}
bg_right_top : Tailwind
bg_right_top =
    Tailwind "bg-right-top"

{-| background-attachment: scroll;
-}
bg_scroll : Tailwind
bg_scroll =
    Tailwind "bg-scroll"

{-| background-position: top;
-}
bg_top : Tailwind
bg_top =
    Tailwind "bg-top"

{-| display: block;
-}
block : Tailwind
block =
    Tailwind "block"

{-| --tw-blur:  ;
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_none : Tailwind
blur_none =
    Tailwind "blur-none"

{-| border-collapse: collapse;
-}
border_collapse : Tailwind
border_collapse =
    Tailwind "border-collapse"

{-| --tw-border-style: dashed;
  border-style: dashed;
-}
border_dashed : Tailwind
border_dashed =
    Tailwind "border-dashed"

{-| --tw-border-style: dotted;
  border-style: dotted;
-}
border_dotted : Tailwind
border_dotted =
    Tailwind "border-dotted"

{-| --tw-border-style: double;
  border-style: double;
-}
border_double : Tailwind
border_double =
    Tailwind "border-double"

{-| --tw-border-style: hidden;
  border-style: hidden;
-}
border_hidden : Tailwind
border_hidden =
    Tailwind "border-hidden"

{-| --tw-border-style: none;
  border-style: none;
-}
border_none : Tailwind
border_none =
    Tailwind "border-none"

{-| border-collapse: separate;
-}
border_separate : Tailwind
border_separate =
    Tailwind "border-separate"

{-| --tw-border-style: solid;
  border-style: solid;
-}
border_solid : Tailwind
border_solid =
    Tailwind "border-solid"

{-| --tw-border-spacing-x: 1px;
  --tw-border-spacing-y: 1px;
  border-spacing: var(--tw-border-spacing-x) var(--tw-border-spacing-y);
-}
border_spacing_px : Tailwind
border_spacing_px =
    Tailwind "border-spacing-px"

{-| --tw-border-spacing-x: 1px;
  border-spacing: var(--tw-border-spacing-x) var(--tw-border-spacing-y);
-}
border_spacing_x_px : Tailwind
border_spacing_x_px =
    Tailwind "border-spacing-x-px"

{-| --tw-border-spacing-y: 1px;
  border-spacing: var(--tw-border-spacing-x) var(--tw-border-spacing-y);
-}
border_spacing_y_px : Tailwind
border_spacing_y_px =
    Tailwind "border-spacing-y-px"

{-| bottom: auto;
-}
bottom_auto : Tailwind
bottom_auto =
    Tailwind "bottom-auto"

{-| bottom: 100%;
-}
bottom_full : Tailwind
bottom_full =
    Tailwind "bottom-full"

{-| bottom: 1px;
-}
bottom_px : Tailwind
bottom_px =
    Tailwind "bottom-px"

{-| box-sizing: border-box;
-}
box_border : Tailwind
box_border =
    Tailwind "box-border"

{-| box-sizing: content-box;
-}
box_content : Tailwind
box_content =
    Tailwind "box-content"

{-| -webkit-box-decoration-break: clone;
  box-decoration-break: clone;
-}
box_decoration_clone : Tailwind
box_decoration_clone =
    Tailwind "box-decoration-clone"

{-| -webkit-box-decoration-break: slice;
  box-decoration-break: slice;
-}
box_decoration_slice : Tailwind
box_decoration_slice =
    Tailwind "box-decoration-slice"

{-| break-after: all;
-}
break_after_all : Tailwind
break_after_all =
    Tailwind "break-after-all"

{-| break-after: auto;
-}
break_after_auto : Tailwind
break_after_auto =
    Tailwind "break-after-auto"

{-| break-after: avoid;
-}
break_after_avoid : Tailwind
break_after_avoid =
    Tailwind "break-after-avoid"

{-| break-after: avoid-page;
-}
break_after_avoid_page : Tailwind
break_after_avoid_page =
    Tailwind "break-after-avoid-page"

{-| break-after: column;
-}
break_after_column : Tailwind
break_after_column =
    Tailwind "break-after-column"

{-| break-after: left;
-}
break_after_left : Tailwind
break_after_left =
    Tailwind "break-after-left"

{-| break-after: page;
-}
break_after_page : Tailwind
break_after_page =
    Tailwind "break-after-page"

{-| break-after: right;
-}
break_after_right : Tailwind
break_after_right =
    Tailwind "break-after-right"

{-| word-break: break-all;
-}
break_all : Tailwind
break_all =
    Tailwind "break-all"

{-| break-before: all;
-}
break_before_all : Tailwind
break_before_all =
    Tailwind "break-before-all"

{-| break-before: auto;
-}
break_before_auto : Tailwind
break_before_auto =
    Tailwind "break-before-auto"

{-| break-before: avoid;
-}
break_before_avoid : Tailwind
break_before_avoid =
    Tailwind "break-before-avoid"

{-| break-before: avoid-page;
-}
break_before_avoid_page : Tailwind
break_before_avoid_page =
    Tailwind "break-before-avoid-page"

{-| break-before: column;
-}
break_before_column : Tailwind
break_before_column =
    Tailwind "break-before-column"

{-| break-before: left;
-}
break_before_left : Tailwind
break_before_left =
    Tailwind "break-before-left"

{-| break-before: page;
-}
break_before_page : Tailwind
break_before_page =
    Tailwind "break-before-page"

{-| break-before: right;
-}
break_before_right : Tailwind
break_before_right =
    Tailwind "break-before-right"

{-| break-inside: auto;
-}
break_inside_auto : Tailwind
break_inside_auto =
    Tailwind "break-inside-auto"

{-| break-inside: avoid;
-}
break_inside_avoid : Tailwind
break_inside_avoid =
    Tailwind "break-inside-avoid"

{-| break-inside: avoid-column;
-}
break_inside_avoid_column : Tailwind
break_inside_avoid_column =
    Tailwind "break-inside-avoid-column"

{-| break-inside: avoid-page;
-}
break_inside_avoid_page : Tailwind
break_inside_avoid_page =
    Tailwind "break-inside-avoid-page"

{-| word-break: keep-all;
-}
break_keep : Tailwind
break_keep =
    Tailwind "break-keep"

{-| overflow-wrap: normal;
  word-break: normal;
-}
break_normal : Tailwind
break_normal =
    Tailwind "break-normal"

{-| overflow-wrap: break-word;
-}
break_words : Tailwind
break_words =
    Tailwind "break-words"

{-| text-transform: capitalize;
-}
capitalize : Tailwind
capitalize =
    Tailwind "capitalize"

{-| caption-side: bottom;
-}
caption_bottom : Tailwind
caption_bottom =
    Tailwind "caption-bottom"

{-| caption-side: top;
-}
caption_top : Tailwind
caption_top =
    Tailwind "caption-top"

{-| clear: both;
-}
clear_both : Tailwind
clear_both =
    Tailwind "clear-both"

{-| clear: inline-end;
-}
clear_end : Tailwind
clear_end =
    Tailwind "clear-end"

{-| clear: left;
-}
clear_left : Tailwind
clear_left =
    Tailwind "clear-left"

{-| clear: none;
-}
clear_none : Tailwind
clear_none =
    Tailwind "clear-none"

{-| clear: right;
-}
clear_right : Tailwind
clear_right =
    Tailwind "clear-right"

{-| clear: inline-start;
-}
clear_start : Tailwind
clear_start =
    Tailwind "clear-start"

{-| grid-column: auto;
-}
col_auto : Tailwind
col_auto =
    Tailwind "col-auto"

{-| grid-column-end: auto;
-}
col_end_auto : Tailwind
col_end_auto =
    Tailwind "col-end-auto"

{-| grid-column: 1 / -1;
-}
col_span_full : Tailwind
col_span_full =
    Tailwind "col-span-full"

{-| grid-column-start: auto;
-}
col_start_auto : Tailwind
col_start_auto =
    Tailwind "col-start-auto"

{-| visibility: collapse;
-}
collapse : Tailwind
collapse =
    Tailwind "collapse"

{-| columns: auto;
-}
columns_auto : Tailwind
columns_auto =
    Tailwind "columns-auto"

{-| contain: content;
-}
contain_content : Tailwind
contain_content =
    Tailwind "contain-content"

{-| --tw-contain-size: inline-size;
  contain: var(--tw-contain-size,) var(--tw-contain-layout,) var(--tw-contain-paint,) var(--tw-contain-style,);
-}
contain_inline_size : Tailwind
contain_inline_size =
    Tailwind "contain-inline-size"

{-| --tw-contain-layout: layout;
  contain: var(--tw-contain-size,) var(--tw-contain-layout,) var(--tw-contain-paint,) var(--tw-contain-style,);
-}
contain_layout : Tailwind
contain_layout =
    Tailwind "contain-layout"

{-| contain: none;
-}
contain_none : Tailwind
contain_none =
    Tailwind "contain-none"

{-| --tw-contain-paint: paint;
  contain: var(--tw-contain-size,) var(--tw-contain-layout,) var(--tw-contain-paint,) var(--tw-contain-style,);
-}
contain_paint : Tailwind
contain_paint =
    Tailwind "contain-paint"

{-| --tw-contain-size: size;
  contain: var(--tw-contain-size,) var(--tw-contain-layout,) var(--tw-contain-paint,) var(--tw-contain-style,);
-}
contain_size : Tailwind
contain_size =
    Tailwind "contain-size"

{-| contain: strict;
-}
contain_strict : Tailwind
contain_strict =
    Tailwind "contain-strict"

{-| --tw-contain-style: style;
  contain: var(--tw-contain-size,) var(--tw-contain-layout,) var(--tw-contain-paint,) var(--tw-contain-style,);
-}
contain_style : Tailwind
contain_style =
    Tailwind "contain-style"

{-| width: 100%;
  @media (width >= 40rem) {
    max-width: 40rem;
-}
container : Tailwind
container =
    Tailwind "container"

{-| align-content: space-around;
-}
content_around : Tailwind
content_around =
    Tailwind "content-around"

{-| align-content: baseline;
-}
content_baseline : Tailwind
content_baseline =
    Tailwind "content-baseline"

{-| align-content: space-between;
-}
content_between : Tailwind
content_between =
    Tailwind "content-between"

{-| align-content: center;
-}
content_center : Tailwind
content_center =
    Tailwind "content-center"

{-| align-content: flex-end;
-}
content_end : Tailwind
content_end =
    Tailwind "content-end"

{-| align-content: space-evenly;
-}
content_evenly : Tailwind
content_evenly =
    Tailwind "content-evenly"

{-| --tw-content: none;
  content: none;
-}
content_none : Tailwind
content_none =
    Tailwind "content-none"

{-| align-content: normal;
-}
content_normal : Tailwind
content_normal =
    Tailwind "content-normal"

{-| align-content: flex-start;
-}
content_start : Tailwind
content_start =
    Tailwind "content-start"

{-| align-content: stretch;
-}
content_stretch : Tailwind
content_stretch =
    Tailwind "content-stretch"

{-| display: contents;
-}
contents : Tailwind
contents =
    Tailwind "contents"

{-| cursor: alias;
-}
cursor_alias : Tailwind
cursor_alias =
    Tailwind "cursor-alias"

{-| cursor: all-scroll;
-}
cursor_all_scroll : Tailwind
cursor_all_scroll =
    Tailwind "cursor-all-scroll"

{-| cursor: auto;
-}
cursor_auto : Tailwind
cursor_auto =
    Tailwind "cursor-auto"

{-| cursor: cell;
-}
cursor_cell : Tailwind
cursor_cell =
    Tailwind "cursor-cell"

{-| cursor: col-resize;
-}
cursor_col_resize : Tailwind
cursor_col_resize =
    Tailwind "cursor-col-resize"

{-| cursor: context-menu;
-}
cursor_context_menu : Tailwind
cursor_context_menu =
    Tailwind "cursor-context-menu"

{-| cursor: copy;
-}
cursor_copy : Tailwind
cursor_copy =
    Tailwind "cursor-copy"

{-| cursor: crosshair;
-}
cursor_crosshair : Tailwind
cursor_crosshair =
    Tailwind "cursor-crosshair"

{-| cursor: default;
-}
cursor_default : Tailwind
cursor_default =
    Tailwind "cursor-default"

{-| cursor: e-resize;
-}
cursor_e_resize : Tailwind
cursor_e_resize =
    Tailwind "cursor-e-resize"

{-| cursor: ew-resize;
-}
cursor_ew_resize : Tailwind
cursor_ew_resize =
    Tailwind "cursor-ew-resize"

{-| cursor: grab;
-}
cursor_grab : Tailwind
cursor_grab =
    Tailwind "cursor-grab"

{-| cursor: grabbing;
-}
cursor_grabbing : Tailwind
cursor_grabbing =
    Tailwind "cursor-grabbing"

{-| cursor: help;
-}
cursor_help : Tailwind
cursor_help =
    Tailwind "cursor-help"

{-| cursor: move;
-}
cursor_move : Tailwind
cursor_move =
    Tailwind "cursor-move"

{-| cursor: n-resize;
-}
cursor_n_resize : Tailwind
cursor_n_resize =
    Tailwind "cursor-n-resize"

{-| cursor: ne-resize;
-}
cursor_ne_resize : Tailwind
cursor_ne_resize =
    Tailwind "cursor-ne-resize"

{-| cursor: nesw-resize;
-}
cursor_nesw_resize : Tailwind
cursor_nesw_resize =
    Tailwind "cursor-nesw-resize"

{-| cursor: no-drop;
-}
cursor_no_drop : Tailwind
cursor_no_drop =
    Tailwind "cursor-no-drop"

{-| cursor: none;
-}
cursor_none : Tailwind
cursor_none =
    Tailwind "cursor-none"

{-| cursor: not-allowed;
-}
cursor_not_allowed : Tailwind
cursor_not_allowed =
    Tailwind "cursor-not-allowed"

{-| cursor: ns-resize;
-}
cursor_ns_resize : Tailwind
cursor_ns_resize =
    Tailwind "cursor-ns-resize"

{-| cursor: nw-resize;
-}
cursor_nw_resize : Tailwind
cursor_nw_resize =
    Tailwind "cursor-nw-resize"

{-| cursor: nwse-resize;
-}
cursor_nwse_resize : Tailwind
cursor_nwse_resize =
    Tailwind "cursor-nwse-resize"

{-| cursor: pointer;
-}
cursor_pointer : Tailwind
cursor_pointer =
    Tailwind "cursor-pointer"

{-| cursor: progress;
-}
cursor_progress : Tailwind
cursor_progress =
    Tailwind "cursor-progress"

{-| cursor: row-resize;
-}
cursor_row_resize : Tailwind
cursor_row_resize =
    Tailwind "cursor-row-resize"

{-| cursor: s-resize;
-}
cursor_s_resize : Tailwind
cursor_s_resize =
    Tailwind "cursor-s-resize"

{-| cursor: se-resize;
-}
cursor_se_resize : Tailwind
cursor_se_resize =
    Tailwind "cursor-se-resize"

{-| cursor: sw-resize;
-}
cursor_sw_resize : Tailwind
cursor_sw_resize =
    Tailwind "cursor-sw-resize"

{-| cursor: text;
-}
cursor_text : Tailwind
cursor_text =
    Tailwind "cursor-text"

{-| cursor: vertical-text;
-}
cursor_vertical_text : Tailwind
cursor_vertical_text =
    Tailwind "cursor-vertical-text"

{-| cursor: w-resize;
-}
cursor_w_resize : Tailwind
cursor_w_resize =
    Tailwind "cursor-w-resize"

{-| cursor: wait;
-}
cursor_wait : Tailwind
cursor_wait =
    Tailwind "cursor-wait"

{-| cursor: zoom-in;
-}
cursor_zoom_in : Tailwind
cursor_zoom_in =
    Tailwind "cursor-zoom-in"

{-| cursor: zoom-out;
-}
cursor_zoom_out : Tailwind
cursor_zoom_out =
    Tailwind "cursor-zoom-out"

{-| text-decoration-thickness: auto;
-}
decoration_auto : Tailwind
decoration_auto =
    Tailwind "decoration-auto"

{-| -webkit-box-decoration-break: clone;
  box-decoration-break: clone;
-}
decoration_clone : Tailwind
decoration_clone =
    Tailwind "decoration-clone"

{-| text-decoration-style: dashed;
-}
decoration_dashed : Tailwind
decoration_dashed =
    Tailwind "decoration-dashed"

{-| text-decoration-style: dotted;
-}
decoration_dotted : Tailwind
decoration_dotted =
    Tailwind "decoration-dotted"

{-| text-decoration-style: double;
-}
decoration_double : Tailwind
decoration_double =
    Tailwind "decoration-double"

{-| text-decoration-thickness: from-font;
-}
decoration_from_font : Tailwind
decoration_from_font =
    Tailwind "decoration-from-font"

{-| -webkit-box-decoration-break: slice;
  box-decoration-break: slice;
-}
decoration_slice : Tailwind
decoration_slice =
    Tailwind "decoration-slice"

{-| text-decoration-style: solid;
-}
decoration_solid : Tailwind
decoration_solid =
    Tailwind "decoration-solid"

{-| text-decoration-style: wavy;
-}
decoration_wavy : Tailwind
decoration_wavy =
    Tailwind "decoration-wavy"

{-| --tw-numeric-fraction: diagonal-fractions;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
diagonal_fractions : Tailwind
diagonal_fractions =
    Tailwind "diagonal-fractions"

{-| :where(& > :not(:last-child)) {
    --tw-border-style: dashed;
    border-style: dashed;
-}
divide_dashed : Tailwind
divide_dashed =
    Tailwind "divide-dashed"

{-| :where(& > :not(:last-child)) {
    --tw-border-style: dotted;
    border-style: dotted;
-}
divide_dotted : Tailwind
divide_dotted =
    Tailwind "divide-dotted"

{-| :where(& > :not(:last-child)) {
    --tw-border-style: double;
    border-style: double;
-}
divide_double : Tailwind
divide_double =
    Tailwind "divide-double"

{-| :where(& > :not(:last-child)) {
    --tw-border-style: none;
    border-style: none;
-}
divide_none : Tailwind
divide_none =
    Tailwind "divide-none"

{-| :where(& > :not(:last-child)) {
    --tw-border-style: solid;
    border-style: solid;
-}
divide_solid : Tailwind
divide_solid =
    Tailwind "divide-solid"

{-| :where(& > :not(:last-child)) {
    --tw-divide-x-reverse: 1;
-}
divide_x_reverse : Tailwind
divide_x_reverse =
    Tailwind "divide-x-reverse"

{-| :where(& > :not(:last-child)) {
    --tw-divide-y-reverse: 1;
-}
divide_y_reverse : Tailwind
divide_y_reverse =
    Tailwind "divide-y-reverse"

{-| --tw-drop-shadow:  ;
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_none : Tailwind
drop_shadow_none =
    Tailwind "drop-shadow-none"

{-| --tw-duration: initial;
-}
duration_initial : Tailwind
duration_initial =
    Tailwind "duration-initial"

{-| --tw-ease: initial;
-}
ease_initial : Tailwind
ease_initial =
    Tailwind "ease-initial"

{-| --tw-ease: linear;
  transition-timing-function: linear;
-}
ease_linear : Tailwind
ease_linear =
    Tailwind "ease-linear"

{-| inset-inline-end: auto;
-}
end_auto : Tailwind
end_auto =
    Tailwind "end-auto"

{-| inset-inline-end: 100%;
-}
end_full : Tailwind
end_full =
    Tailwind "end-full"

{-| inset-inline-end: 1px;
-}
end_px : Tailwind
end_px =
    Tailwind "end-px"

{-| field-sizing: content;
-}
field_sizing_content : Tailwind
field_sizing_content =
    Tailwind "field-sizing-content"

{-| field-sizing: fixed;
-}
field_sizing_fixed : Tailwind
field_sizing_fixed =
    Tailwind "field-sizing-fixed"

{-| fill: none;
-}
fill_none : Tailwind
fill_none =
    Tailwind "fill-none"

{-| position: fixed;
-}
fixed : Tailwind
fixed =
    Tailwind "fixed"

{-| display: flex;
-}
flex : Tailwind
flex =
    Tailwind "flex"

{-| flex: auto;
-}
flex_auto : Tailwind
flex_auto =
    Tailwind "flex-auto"

{-| flex-direction: column;
-}
flex_col : Tailwind
flex_col =
    Tailwind "flex-col"

{-| flex-direction: column-reverse;
-}
flex_col_reverse : Tailwind
flex_col_reverse =
    Tailwind "flex-col-reverse"

{-| flex: 0 auto;
-}
flex_initial : Tailwind
flex_initial =
    Tailwind "flex-initial"

{-| flex: none;
-}
flex_none : Tailwind
flex_none =
    Tailwind "flex-none"

{-| flex-wrap: nowrap;
-}
flex_nowrap : Tailwind
flex_nowrap =
    Tailwind "flex-nowrap"

{-| flex-direction: row;
-}
flex_row : Tailwind
flex_row =
    Tailwind "flex-row"

{-| flex-direction: row-reverse;
-}
flex_row_reverse : Tailwind
flex_row_reverse =
    Tailwind "flex-row-reverse"

{-| flex-wrap: wrap;
-}
flex_wrap : Tailwind
flex_wrap =
    Tailwind "flex-wrap"

{-| flex-wrap: wrap-reverse;
-}
flex_wrap_reverse : Tailwind
flex_wrap_reverse =
    Tailwind "flex-wrap-reverse"

{-| float: inline-end;
-}
float_end : Tailwind
float_end =
    Tailwind "float-end"

{-| float: left;
-}
float_left : Tailwind
float_left =
    Tailwind "float-left"

{-| float: none;
-}
float_none : Tailwind
float_none =
    Tailwind "float-none"

{-| float: right;
-}
float_right : Tailwind
float_right =
    Tailwind "float-right"

{-| float: inline-start;
-}
float_start : Tailwind
float_start =
    Tailwind "float-start"

{-| display: flow-root;
-}
flow_root : Tailwind
flow_root =
    Tailwind "flow-root"

{-| font-stretch: condensed;
-}
font_stretch_condensed : Tailwind
font_stretch_condensed =
    Tailwind "font-stretch-condensed"

{-| font-stretch: expanded;
-}
font_stretch_expanded : Tailwind
font_stretch_expanded =
    Tailwind "font-stretch-expanded"

{-| font-stretch: extra-condensed;
-}
font_stretch_extra_condensed : Tailwind
font_stretch_extra_condensed =
    Tailwind "font-stretch-extra-condensed"

{-| font-stretch: extra-expanded;
-}
font_stretch_extra_expanded : Tailwind
font_stretch_extra_expanded =
    Tailwind "font-stretch-extra-expanded"

{-| font-stretch: normal;
-}
font_stretch_normal : Tailwind
font_stretch_normal =
    Tailwind "font-stretch-normal"

{-| font-stretch: semi-condensed;
-}
font_stretch_semi_condensed : Tailwind
font_stretch_semi_condensed =
    Tailwind "font-stretch-semi-condensed"

{-| font-stretch: semi-expanded;
-}
font_stretch_semi_expanded : Tailwind
font_stretch_semi_expanded =
    Tailwind "font-stretch-semi-expanded"

{-| font-stretch: ultra-condensed;
-}
font_stretch_ultra_condensed : Tailwind
font_stretch_ultra_condensed =
    Tailwind "font-stretch-ultra-condensed"

{-| font-stretch: ultra-expanded;
-}
font_stretch_ultra_expanded : Tailwind
font_stretch_ultra_expanded =
    Tailwind "font-stretch-ultra-expanded"

{-| forced-color-adjust: auto;
-}
forced_color_adjust_auto : Tailwind
forced_color_adjust_auto =
    Tailwind "forced-color-adjust-auto"

{-| forced-color-adjust: none;
-}
forced_color_adjust_none : Tailwind
forced_color_adjust_none =
    Tailwind "forced-color-adjust-none"

{-| gap: 1px;
-}
gap_px : Tailwind
gap_px =
    Tailwind "gap-px"

{-| column-gap: 1px;
-}
gap_x_px : Tailwind
gap_x_px =
    Tailwind "gap-x-px"

{-| row-gap: 1px;
-}
gap_y_px : Tailwind
gap_y_px =
    Tailwind "gap-y-px"

{-| display: grid;
-}
grid : Tailwind
grid =
    Tailwind "grid"

{-| grid-template-columns: none;
-}
grid_cols_none : Tailwind
grid_cols_none =
    Tailwind "grid-cols-none"

{-| grid-template-columns: subgrid;
-}
grid_cols_subgrid : Tailwind
grid_cols_subgrid =
    Tailwind "grid-cols-subgrid"

{-| grid-auto-flow: column;
-}
grid_flow_col : Tailwind
grid_flow_col =
    Tailwind "grid-flow-col"

{-| grid-auto-flow: column dense;
-}
grid_flow_col_dense : Tailwind
grid_flow_col_dense =
    Tailwind "grid-flow-col-dense"

{-| grid-auto-flow: dense;
-}
grid_flow_dense : Tailwind
grid_flow_dense =
    Tailwind "grid-flow-dense"

{-| grid-auto-flow: row;
-}
grid_flow_row : Tailwind
grid_flow_row =
    Tailwind "grid-flow-row"

{-| grid-auto-flow: row dense;
-}
grid_flow_row_dense : Tailwind
grid_flow_row_dense =
    Tailwind "grid-flow-row-dense"

{-| grid-template-rows: none;
-}
grid_rows_none : Tailwind
grid_rows_none =
    Tailwind "grid-rows-none"

{-| grid-template-rows: subgrid;
-}
grid_rows_subgrid : Tailwind
grid_rows_subgrid =
    Tailwind "grid-rows-subgrid"

{-| height: 100dvh;
-}
h_dvh : Tailwind
h_dvh =
    Tailwind "h-dvh"

{-| height: 100dvw;
-}
h_dvw : Tailwind
h_dvw =
    Tailwind "h-dvw"

{-| height: 100lvh;
-}
h_lvh : Tailwind
h_lvh =
    Tailwind "h-lvh"

{-| height: 100lvw;
-}
h_lvw : Tailwind
h_lvw =
    Tailwind "h-lvw"

{-| height: 1px;
-}
h_px : Tailwind
h_px =
    Tailwind "h-px"

{-| height: 100svh;
-}
h_svh : Tailwind
h_svh =
    Tailwind "h-svh"

{-| height: 100svw;
-}
h_svw : Tailwind
h_svw =
    Tailwind "h-svw"

{-| display: none;
-}
hidden : Tailwind
hidden =
    Tailwind "hidden"

{-| -webkit-hyphens: auto;
  hyphens: auto;
-}
hyphens_auto : Tailwind
hyphens_auto =
    Tailwind "hyphens-auto"

{-| -webkit-hyphens: manual;
  hyphens: manual;
-}
hyphens_manual : Tailwind
hyphens_manual =
    Tailwind "hyphens-manual"

{-| -webkit-hyphens: none;
  hyphens: none;
-}
hyphens_none : Tailwind
hyphens_none =
    Tailwind "hyphens-none"

{-| text-indent: 1px;
-}
indent_px : Tailwind
indent_px =
    Tailwind "indent-px"

{-| display: inline;
-}
inline : Tailwind
inline =
    Tailwind "inline"

{-| display: inline-block;
-}
inline_block : Tailwind
inline_block =
    Tailwind "inline-block"

{-| display: inline-flex;
-}
inline_flex : Tailwind
inline_flex =
    Tailwind "inline-flex"

{-| display: inline-grid;
-}
inline_grid : Tailwind
inline_grid =
    Tailwind "inline-grid"

{-| display: inline-table;
-}
inline_table : Tailwind
inline_table =
    Tailwind "inline-table"

{-| inset: auto;
-}
inset_auto : Tailwind
inset_auto =
    Tailwind "inset-auto"

{-| inset: 100%;
-}
inset_full : Tailwind
inset_full =
    Tailwind "inset-full"

{-| inset: 1px;
-}
inset_px : Tailwind
inset_px =
    Tailwind "inset-px"

{-| --tw-inset-shadow-color: initial;
-}
inset_shadow_initial : Tailwind
inset_shadow_initial =
    Tailwind "inset-shadow-initial"

{-| inset-inline: auto;
-}
inset_x_auto : Tailwind
inset_x_auto =
    Tailwind "inset-x-auto"

{-| inset-inline: 100%;
-}
inset_x_full : Tailwind
inset_x_full =
    Tailwind "inset-x-full"

{-| inset-inline: 1px;
-}
inset_x_px : Tailwind
inset_x_px =
    Tailwind "inset-x-px"

{-| inset-block: auto;
-}
inset_y_auto : Tailwind
inset_y_auto =
    Tailwind "inset-y-auto"

{-| inset-block: 100%;
-}
inset_y_full : Tailwind
inset_y_full =
    Tailwind "inset-y-full"

{-| inset-block: 1px;
-}
inset_y_px : Tailwind
inset_y_px =
    Tailwind "inset-y-px"

{-| visibility: hidden;
-}
invisible : Tailwind
invisible =
    Tailwind "invisible"

{-| isolation: isolate;
-}
isolate : Tailwind
isolate =
    Tailwind "isolate"

{-| isolation: auto;
-}
isolation_auto : Tailwind
isolation_auto =
    Tailwind "isolation-auto"

{-| font-style: italic;
-}
italic : Tailwind
italic =
    Tailwind "italic"

{-| align-items: baseline;
-}
items_baseline : Tailwind
items_baseline =
    Tailwind "items-baseline"

{-| align-items: center;
-}
items_center : Tailwind
items_center =
    Tailwind "items-center"

{-| align-items: flex-end;
-}
items_end : Tailwind
items_end =
    Tailwind "items-end"

{-| align-items: flex-start;
-}
items_start : Tailwind
items_start =
    Tailwind "items-start"

{-| align-items: stretch;
-}
items_stretch : Tailwind
items_stretch =
    Tailwind "items-stretch"

{-| justify-content: space-around;
-}
justify_around : Tailwind
justify_around =
    Tailwind "justify-around"

{-| justify-content: baseline;
-}
justify_baseline : Tailwind
justify_baseline =
    Tailwind "justify-baseline"

{-| justify-content: space-between;
-}
justify_between : Tailwind
justify_between =
    Tailwind "justify-between"

{-| justify-content: center;
-}
justify_center : Tailwind
justify_center =
    Tailwind "justify-center"

{-| justify-content: flex-end;
-}
justify_end : Tailwind
justify_end =
    Tailwind "justify-end"

{-| justify-content: space-evenly;
-}
justify_evenly : Tailwind
justify_evenly =
    Tailwind "justify-evenly"

{-| justify-items: center;
-}
justify_items_center : Tailwind
justify_items_center =
    Tailwind "justify-items-center"

{-| justify-items: end;
-}
justify_items_end : Tailwind
justify_items_end =
    Tailwind "justify-items-end"

{-| justify-items: normal;
-}
justify_items_normal : Tailwind
justify_items_normal =
    Tailwind "justify-items-normal"

{-| justify-items: start;
-}
justify_items_start : Tailwind
justify_items_start =
    Tailwind "justify-items-start"

{-| justify-items: stretch;
-}
justify_items_stretch : Tailwind
justify_items_stretch =
    Tailwind "justify-items-stretch"

{-| justify-content: normal;
-}
justify_normal : Tailwind
justify_normal =
    Tailwind "justify-normal"

{-| justify-self: auto;
-}
justify_self_auto : Tailwind
justify_self_auto =
    Tailwind "justify-self-auto"

{-| justify-self: center;
-}
justify_self_center : Tailwind
justify_self_center =
    Tailwind "justify-self-center"

{-| justify-self: flex-end;
-}
justify_self_end : Tailwind
justify_self_end =
    Tailwind "justify-self-end"

{-| justify-self: flex-start;
-}
justify_self_start : Tailwind
justify_self_start =
    Tailwind "justify-self-start"

{-| justify-self: stretch;
-}
justify_self_stretch : Tailwind
justify_self_stretch =
    Tailwind "justify-self-stretch"

{-| justify-content: flex-start;
-}
justify_start : Tailwind
justify_start =
    Tailwind "justify-start"

{-| justify-content: stretch;
-}
justify_stretch : Tailwind
justify_stretch =
    Tailwind "justify-stretch"

{-| --tw-leading: 1;
  line-height: 1;
-}
leading_none : Tailwind
leading_none =
    Tailwind "leading-none"

{-| --tw-leading: 1px;
  line-height: 1px;
-}
leading_px : Tailwind
leading_px =
    Tailwind "leading-px"

{-| left: auto;
-}
left_auto : Tailwind
left_auto =
    Tailwind "left-auto"

{-| left: 100%;
-}
left_full : Tailwind
left_full =
    Tailwind "left-full"

{-| left: 1px;
-}
left_px : Tailwind
left_px =
    Tailwind "left-px"

{-| overflow: visible;
  display: block;
  -webkit-box-orient: horizontal;
  -webkit-line-clamp: unset;
-}
line_clamp_none : Tailwind
line_clamp_none =
    Tailwind "line-clamp-none"

{-| text-decoration-line: line-through;
-}
line_through : Tailwind
line_through =
    Tailwind "line-through"

{-| --tw-numeric-figure: lining-nums;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
lining_nums : Tailwind
lining_nums =
    Tailwind "lining-nums"

{-| list-style-type: decimal;
-}
list_decimal : Tailwind
list_decimal =
    Tailwind "list-decimal"

{-| list-style-type: disc;
-}
list_disc : Tailwind
list_disc =
    Tailwind "list-disc"

{-| list-style-image: none;
-}
list_image_none : Tailwind
list_image_none =
    Tailwind "list-image-none"

{-| list-style-position: inside;
-}
list_inside : Tailwind
list_inside =
    Tailwind "list-inside"

{-| display: list-item;
-}
list_item : Tailwind
list_item =
    Tailwind "list-item"

{-| list-style-type: none;
-}
list_none : Tailwind
list_none =
    Tailwind "list-none"

{-| list-style-position: outside;
-}
list_outside : Tailwind
list_outside =
    Tailwind "list-outside"

{-| text-transform: lowercase;
-}
lowercase : Tailwind
lowercase =
    Tailwind "lowercase"

{-| margin: auto;
-}
m_auto : Tailwind
m_auto =
    Tailwind "m-auto"

{-| margin: 1px;
-}
m_px : Tailwind
m_px =
    Tailwind "m-px"

{-| max-height: auto;
-}
max_h_auto : Tailwind
max_h_auto =
    Tailwind "max-h-auto"

{-| max-height: 100dvh;
-}
max_h_dvh : Tailwind
max_h_dvh =
    Tailwind "max-h-dvh"

{-| max-height: 100dvw;
-}
max_h_dvw : Tailwind
max_h_dvw =
    Tailwind "max-h-dvw"

{-| max-height: fit-content;
-}
max_h_fit : Tailwind
max_h_fit =
    Tailwind "max-h-fit"

{-| max-height: 100%;
-}
max_h_full : Tailwind
max_h_full =
    Tailwind "max-h-full"

{-| max-height: 100lvh;
-}
max_h_lvh : Tailwind
max_h_lvh =
    Tailwind "max-h-lvh"

{-| max-height: 100lvw;
-}
max_h_lvw : Tailwind
max_h_lvw =
    Tailwind "max-h-lvw"

{-| max-height: max-content;
-}
max_h_max : Tailwind
max_h_max =
    Tailwind "max-h-max"

{-| max-height: min-content;
-}
max_h_min : Tailwind
max_h_min =
    Tailwind "max-h-min"

{-| max-height: none;
-}
max_h_none : Tailwind
max_h_none =
    Tailwind "max-h-none"

{-| max-height: 1px;
-}
max_h_px : Tailwind
max_h_px =
    Tailwind "max-h-px"

{-| max-height: 100vh;
-}
max_h_screen : Tailwind
max_h_screen =
    Tailwind "max-h-screen"

{-| max-height: 100svh;
-}
max_h_svh : Tailwind
max_h_svh =
    Tailwind "max-h-svh"

{-| max-height: 100svw;
-}
max_h_svw : Tailwind
max_h_svw =
    Tailwind "max-h-svw"

{-| max-width: auto;
-}
max_w_auto : Tailwind
max_w_auto =
    Tailwind "max-w-auto"

{-| max-width: 100dvh;
-}
max_w_dvh : Tailwind
max_w_dvh =
    Tailwind "max-w-dvh"

{-| max-width: 100dvw;
-}
max_w_dvw : Tailwind
max_w_dvw =
    Tailwind "max-w-dvw"

{-| max-width: fit-content;
-}
max_w_fit : Tailwind
max_w_fit =
    Tailwind "max-w-fit"

{-| max-width: 100%;
-}
max_w_full : Tailwind
max_w_full =
    Tailwind "max-w-full"

{-| max-width: 100lvh;
-}
max_w_lvh : Tailwind
max_w_lvh =
    Tailwind "max-w-lvh"

{-| max-width: 100lvw;
-}
max_w_lvw : Tailwind
max_w_lvw =
    Tailwind "max-w-lvw"

{-| max-width: max-content;
-}
max_w_max : Tailwind
max_w_max =
    Tailwind "max-w-max"

{-| max-width: min-content;
-}
max_w_min : Tailwind
max_w_min =
    Tailwind "max-w-min"

{-| max-width: none;
-}
max_w_none : Tailwind
max_w_none =
    Tailwind "max-w-none"

{-| max-width: 1px;
-}
max_w_px : Tailwind
max_w_px =
    Tailwind "max-w-px"

{-| max-width: 100vw;
-}
max_w_screen : Tailwind
max_w_screen =
    Tailwind "max-w-screen"

{-| max-width: 100svh;
-}
max_w_svh : Tailwind
max_w_svh =
    Tailwind "max-w-svh"

{-| max-width: 100svw;
-}
max_w_svw : Tailwind
max_w_svw =
    Tailwind "max-w-svw"

{-| margin-bottom: auto;
-}
mb_auto : Tailwind
mb_auto =
    Tailwind "mb-auto"

{-| margin-bottom: 1px;
-}
mb_px : Tailwind
mb_px =
    Tailwind "mb-px"

{-| margin-inline-end: auto;
-}
me_auto : Tailwind
me_auto =
    Tailwind "me-auto"

{-| margin-inline-end: 1px;
-}
me_px : Tailwind
me_px =
    Tailwind "me-px"

{-| min-height: auto;
-}
min_h_auto : Tailwind
min_h_auto =
    Tailwind "min-h-auto"

{-| min-height: 100dvh;
-}
min_h_dvh : Tailwind
min_h_dvh =
    Tailwind "min-h-dvh"

{-| min-height: 100dvw;
-}
min_h_dvw : Tailwind
min_h_dvw =
    Tailwind "min-h-dvw"

{-| min-height: fit-content;
-}
min_h_fit : Tailwind
min_h_fit =
    Tailwind "min-h-fit"

{-| min-height: 100%;
-}
min_h_full : Tailwind
min_h_full =
    Tailwind "min-h-full"

{-| min-height: 100lvh;
-}
min_h_lvh : Tailwind
min_h_lvh =
    Tailwind "min-h-lvh"

{-| min-height: 100lvw;
-}
min_h_lvw : Tailwind
min_h_lvw =
    Tailwind "min-h-lvw"

{-| min-height: max-content;
-}
min_h_max : Tailwind
min_h_max =
    Tailwind "min-h-max"

{-| min-height: min-content;
-}
min_h_min : Tailwind
min_h_min =
    Tailwind "min-h-min"

{-| min-height: none;
-}
min_h_none : Tailwind
min_h_none =
    Tailwind "min-h-none"

{-| min-height: 1px;
-}
min_h_px : Tailwind
min_h_px =
    Tailwind "min-h-px"

{-| min-height: 100vh;
-}
min_h_screen : Tailwind
min_h_screen =
    Tailwind "min-h-screen"

{-| min-height: 100svh;
-}
min_h_svh : Tailwind
min_h_svh =
    Tailwind "min-h-svh"

{-| min-height: 100svw;
-}
min_h_svw : Tailwind
min_h_svw =
    Tailwind "min-h-svw"

{-| min-width: auto;
-}
min_w_auto : Tailwind
min_w_auto =
    Tailwind "min-w-auto"

{-| min-width: 100dvh;
-}
min_w_dvh : Tailwind
min_w_dvh =
    Tailwind "min-w-dvh"

{-| min-width: 100dvw;
-}
min_w_dvw : Tailwind
min_w_dvw =
    Tailwind "min-w-dvw"

{-| min-width: fit-content;
-}
min_w_fit : Tailwind
min_w_fit =
    Tailwind "min-w-fit"

{-| min-width: 100%;
-}
min_w_full : Tailwind
min_w_full =
    Tailwind "min-w-full"

{-| min-width: 100lvh;
-}
min_w_lvh : Tailwind
min_w_lvh =
    Tailwind "min-w-lvh"

{-| min-width: 100lvw;
-}
min_w_lvw : Tailwind
min_w_lvw =
    Tailwind "min-w-lvw"

{-| min-width: max-content;
-}
min_w_max : Tailwind
min_w_max =
    Tailwind "min-w-max"

{-| min-width: min-content;
-}
min_w_min : Tailwind
min_w_min =
    Tailwind "min-w-min"

{-| min-width: none;
-}
min_w_none : Tailwind
min_w_none =
    Tailwind "min-w-none"

{-| min-width: 1px;
-}
min_w_px : Tailwind
min_w_px =
    Tailwind "min-w-px"

{-| min-width: 100vw;
-}
min_w_screen : Tailwind
min_w_screen =
    Tailwind "min-w-screen"

{-| min-width: 100svh;
-}
min_w_svh : Tailwind
min_w_svh =
    Tailwind "min-w-svh"

{-| min-width: 100svw;
-}
min_w_svw : Tailwind
min_w_svw =
    Tailwind "min-w-svw"

{-| mix-blend-mode: color;
-}
mix_blend_color : Tailwind
mix_blend_color =
    Tailwind "mix-blend-color"

{-| mix-blend-mode: color-burn;
-}
mix_blend_color_burn : Tailwind
mix_blend_color_burn =
    Tailwind "mix-blend-color-burn"

{-| mix-blend-mode: color-dodge;
-}
mix_blend_color_dodge : Tailwind
mix_blend_color_dodge =
    Tailwind "mix-blend-color-dodge"

{-| mix-blend-mode: darken;
-}
mix_blend_darken : Tailwind
mix_blend_darken =
    Tailwind "mix-blend-darken"

{-| mix-blend-mode: difference;
-}
mix_blend_difference : Tailwind
mix_blend_difference =
    Tailwind "mix-blend-difference"

{-| mix-blend-mode: exclusion;
-}
mix_blend_exclusion : Tailwind
mix_blend_exclusion =
    Tailwind "mix-blend-exclusion"

{-| mix-blend-mode: hard-light;
-}
mix_blend_hard_light : Tailwind
mix_blend_hard_light =
    Tailwind "mix-blend-hard-light"

{-| mix-blend-mode: hue;
-}
mix_blend_hue : Tailwind
mix_blend_hue =
    Tailwind "mix-blend-hue"

{-| mix-blend-mode: lighten;
-}
mix_blend_lighten : Tailwind
mix_blend_lighten =
    Tailwind "mix-blend-lighten"

{-| mix-blend-mode: luminosity;
-}
mix_blend_luminosity : Tailwind
mix_blend_luminosity =
    Tailwind "mix-blend-luminosity"

{-| mix-blend-mode: multiply;
-}
mix_blend_multiply : Tailwind
mix_blend_multiply =
    Tailwind "mix-blend-multiply"

{-| mix-blend-mode: normal;
-}
mix_blend_normal : Tailwind
mix_blend_normal =
    Tailwind "mix-blend-normal"

{-| mix-blend-mode: overlay;
-}
mix_blend_overlay : Tailwind
mix_blend_overlay =
    Tailwind "mix-blend-overlay"

{-| mix-blend-mode: plus-darker;
-}
mix_blend_plus_darker : Tailwind
mix_blend_plus_darker =
    Tailwind "mix-blend-plus-darker"

{-| mix-blend-mode: plus-lighter;
-}
mix_blend_plus_lighter : Tailwind
mix_blend_plus_lighter =
    Tailwind "mix-blend-plus-lighter"

{-| mix-blend-mode: saturation;
-}
mix_blend_saturation : Tailwind
mix_blend_saturation =
    Tailwind "mix-blend-saturation"

{-| mix-blend-mode: screen;
-}
mix_blend_screen : Tailwind
mix_blend_screen =
    Tailwind "mix-blend-screen"

{-| mix-blend-mode: soft-light;
-}
mix_blend_soft_light : Tailwind
mix_blend_soft_light =
    Tailwind "mix-blend-soft-light"

{-| margin-left: auto;
-}
ml_auto : Tailwind
ml_auto =
    Tailwind "ml-auto"

{-| margin-left: 1px;
-}
ml_px : Tailwind
ml_px =
    Tailwind "ml-px"

{-| margin-right: auto;
-}
mr_auto : Tailwind
mr_auto =
    Tailwind "mr-auto"

{-| margin-right: 1px;
-}
mr_px : Tailwind
mr_px =
    Tailwind "mr-px"

{-| margin-inline-start: auto;
-}
ms_auto : Tailwind
ms_auto =
    Tailwind "ms-auto"

{-| margin-inline-start: 1px;
-}
ms_px : Tailwind
ms_px =
    Tailwind "ms-px"

{-| margin-top: auto;
-}
mt_auto : Tailwind
mt_auto =
    Tailwind "mt-auto"

{-| margin-top: 1px;
-}
mt_px : Tailwind
mt_px =
    Tailwind "mt-px"

{-| margin-inline: auto;
-}
mx_auto : Tailwind
mx_auto =
    Tailwind "mx-auto"

{-| margin-inline: 1px;
-}
mx_px : Tailwind
mx_px =
    Tailwind "mx-px"

{-| margin-block: auto;
-}
my_auto : Tailwind
my_auto =
    Tailwind "my-auto"

{-| margin-block: 1px;
-}
my_px : Tailwind
my_px =
    Tailwind "my-px"

{-| text-decoration-line: none;
-}
no_underline : Tailwind
no_underline =
    Tailwind "no-underline"

{-| text-transform: none;
-}
normal_case : Tailwind
normal_case =
    Tailwind "normal-case"

{-| font-variant-numeric: normal;
-}
normal_nums : Tailwind
normal_nums =
    Tailwind "normal-nums"

{-| font-style: normal;
-}
not_italic : Tailwind
not_italic =
    Tailwind "not-italic"

{-| position: static;
  width: auto;
  height: auto;
  padding: 0;
  margin: 0;
  overflow: visible;
  clip: auto;
  white-space: normal;
-}
not_sr_only : Tailwind
not_sr_only =
    Tailwind "not-sr-only"

{-| object-position: bottom;
-}
object_bottom : Tailwind
object_bottom =
    Tailwind "object-bottom"

{-| object-position: center;
-}
object_center : Tailwind
object_center =
    Tailwind "object-center"

{-| object-fit: contain;
-}
object_contain : Tailwind
object_contain =
    Tailwind "object-contain"

{-| object-fit: cover;
-}
object_cover : Tailwind
object_cover =
    Tailwind "object-cover"

{-| object-fit: fill;
-}
object_fill : Tailwind
object_fill =
    Tailwind "object-fill"

{-| object-position: left;
-}
object_left : Tailwind
object_left =
    Tailwind "object-left"

{-| object-position: left bottom;
-}
object_left_bottom : Tailwind
object_left_bottom =
    Tailwind "object-left-bottom"

{-| object-position: left top;
-}
object_left_top : Tailwind
object_left_top =
    Tailwind "object-left-top"

{-| object-fit: none;
-}
object_none : Tailwind
object_none =
    Tailwind "object-none"

{-| object-position: right;
-}
object_right : Tailwind
object_right =
    Tailwind "object-right"

{-| object-position: right bottom;
-}
object_right_bottom : Tailwind
object_right_bottom =
    Tailwind "object-right-bottom"

{-| object-position: right top;
-}
object_right_top : Tailwind
object_right_top =
    Tailwind "object-right-top"

{-| object-fit: scale-down;
-}
object_scale_down : Tailwind
object_scale_down =
    Tailwind "object-scale-down"

{-| object-position: top;
-}
object_top : Tailwind
object_top =
    Tailwind "object-top"

{-| --tw-numeric-figure: oldstyle-nums;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
oldstyle_nums : Tailwind
oldstyle_nums =
    Tailwind "oldstyle-nums"

{-| order: calc(-infinity);
-}
order_first : Tailwind
order_first =
    Tailwind "order-first"

{-| order: calc(infinity);
-}
order_last : Tailwind
order_last =
    Tailwind "order-last"

{-| order: 0;
-}
order_none : Tailwind
order_none =
    Tailwind "order-none"

{-| --tw-ordinal: ordinal;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
ordinal : Tailwind
ordinal =
    Tailwind "ordinal"

{-| transform-origin: bottom;
-}
origin_bottom : Tailwind
origin_bottom =
    Tailwind "origin-bottom"

{-| transform-origin: bottom left;
-}
origin_bottom_left : Tailwind
origin_bottom_left =
    Tailwind "origin-bottom-left"

{-| transform-origin: bottom right;
-}
origin_bottom_right : Tailwind
origin_bottom_right =
    Tailwind "origin-bottom-right"

{-| transform-origin: center;
-}
origin_center : Tailwind
origin_center =
    Tailwind "origin-center"

{-| transform-origin: left;
-}
origin_left : Tailwind
origin_left =
    Tailwind "origin-left"

{-| transform-origin: right;
-}
origin_right : Tailwind
origin_right =
    Tailwind "origin-right"

{-| transform-origin: top;
-}
origin_top : Tailwind
origin_top =
    Tailwind "origin-top"

{-| transform-origin: top left;
-}
origin_top_left : Tailwind
origin_top_left =
    Tailwind "origin-top-left"

{-| transform-origin: top right;
-}
origin_top_right : Tailwind
origin_top_right =
    Tailwind "origin-top-right"

{-| --tw-outline-style: dashed;
  outline-style: dashed;
-}
outline_dashed : Tailwind
outline_dashed =
    Tailwind "outline-dashed"

{-| --tw-outline-style: dotted;
  outline-style: dotted;
-}
outline_dotted : Tailwind
outline_dotted =
    Tailwind "outline-dotted"

{-| --tw-outline-style: double;
  outline-style: double;
-}
outline_double : Tailwind
outline_double =
    Tailwind "outline-double"

{-| outline-style: none;
  @media (forced-colors: active) {
    outline: 2px solid transparent;
    outline-offset: 2px;
-}
outline_hidden : Tailwind
outline_hidden =
    Tailwind "outline-hidden"

{-| --tw-outline-style: none;
  outline-style: none;
-}
outline_none : Tailwind
outline_none =
    Tailwind "outline-none"

{-| --tw-outline-style: solid;
  outline-style: solid;
-}
outline_solid : Tailwind
outline_solid =
    Tailwind "outline-solid"

{-| overflow: auto;
-}
overflow_auto : Tailwind
overflow_auto =
    Tailwind "overflow-auto"

{-| overflow: clip;
-}
overflow_clip : Tailwind
overflow_clip =
    Tailwind "overflow-clip"

{-| text-overflow: ellipsis;
-}
overflow_ellipsis : Tailwind
overflow_ellipsis =
    Tailwind "overflow-ellipsis"

{-| overflow: hidden;
-}
overflow_hidden : Tailwind
overflow_hidden =
    Tailwind "overflow-hidden"

{-| overflow: scroll;
-}
overflow_scroll : Tailwind
overflow_scroll =
    Tailwind "overflow-scroll"

{-| overflow: visible;
-}
overflow_visible : Tailwind
overflow_visible =
    Tailwind "overflow-visible"

{-| overflow-x: auto;
-}
overflow_x_auto : Tailwind
overflow_x_auto =
    Tailwind "overflow-x-auto"

{-| overflow-x: clip;
-}
overflow_x_clip : Tailwind
overflow_x_clip =
    Tailwind "overflow-x-clip"

{-| overflow-x: hidden;
-}
overflow_x_hidden : Tailwind
overflow_x_hidden =
    Tailwind "overflow-x-hidden"

{-| overflow-x: scroll;
-}
overflow_x_scroll : Tailwind
overflow_x_scroll =
    Tailwind "overflow-x-scroll"

{-| overflow-x: visible;
-}
overflow_x_visible : Tailwind
overflow_x_visible =
    Tailwind "overflow-x-visible"

{-| overflow-y: auto;
-}
overflow_y_auto : Tailwind
overflow_y_auto =
    Tailwind "overflow-y-auto"

{-| overflow-y: clip;
-}
overflow_y_clip : Tailwind
overflow_y_clip =
    Tailwind "overflow-y-clip"

{-| overflow-y: hidden;
-}
overflow_y_hidden : Tailwind
overflow_y_hidden =
    Tailwind "overflow-y-hidden"

{-| overflow-y: scroll;
-}
overflow_y_scroll : Tailwind
overflow_y_scroll =
    Tailwind "overflow-y-scroll"

{-| overflow-y: visible;
-}
overflow_y_visible : Tailwind
overflow_y_visible =
    Tailwind "overflow-y-visible"

{-| text-decoration-line: overline;
-}
overline : Tailwind
overline =
    Tailwind "overline"

{-| overscroll-behavior: auto;
-}
overscroll_auto : Tailwind
overscroll_auto =
    Tailwind "overscroll-auto"

{-| overscroll-behavior: contain;
-}
overscroll_contain : Tailwind
overscroll_contain =
    Tailwind "overscroll-contain"

{-| overscroll-behavior: none;
-}
overscroll_none : Tailwind
overscroll_none =
    Tailwind "overscroll-none"

{-| overscroll-behavior-x: auto;
-}
overscroll_x_auto : Tailwind
overscroll_x_auto =
    Tailwind "overscroll-x-auto"

{-| overscroll-behavior-x: contain;
-}
overscroll_x_contain : Tailwind
overscroll_x_contain =
    Tailwind "overscroll-x-contain"

{-| overscroll-behavior-x: none;
-}
overscroll_x_none : Tailwind
overscroll_x_none =
    Tailwind "overscroll-x-none"

{-| overscroll-behavior-y: auto;
-}
overscroll_y_auto : Tailwind
overscroll_y_auto =
    Tailwind "overscroll-y-auto"

{-| overscroll-behavior-y: contain;
-}
overscroll_y_contain : Tailwind
overscroll_y_contain =
    Tailwind "overscroll-y-contain"

{-| overscroll-behavior-y: none;
-}
overscroll_y_none : Tailwind
overscroll_y_none =
    Tailwind "overscroll-y-none"

{-| padding: 1px;
-}
p_px : Tailwind
p_px =
    Tailwind "p-px"

{-| padding-bottom: 1px;
-}
pb_px : Tailwind
pb_px =
    Tailwind "pb-px"

{-| padding-inline-end: 1px;
-}
pe_px : Tailwind
pe_px =
    Tailwind "pe-px"

{-| perspective: none;
-}
perspective_none : Tailwind
perspective_none =
    Tailwind "perspective-none"

{-| perspective-origin: bottom;
-}
perspective_origin_bottom : Tailwind
perspective_origin_bottom =
    Tailwind "perspective-origin-bottom"

{-| perspective-origin: bottom left;
-}
perspective_origin_bottom_left : Tailwind
perspective_origin_bottom_left =
    Tailwind "perspective-origin-bottom-left"

{-| perspective-origin: bottom right;
-}
perspective_origin_bottom_right : Tailwind
perspective_origin_bottom_right =
    Tailwind "perspective-origin-bottom-right"

{-| perspective-origin: center;
-}
perspective_origin_center : Tailwind
perspective_origin_center =
    Tailwind "perspective-origin-center"

{-| perspective-origin: left;
-}
perspective_origin_left : Tailwind
perspective_origin_left =
    Tailwind "perspective-origin-left"

{-| perspective-origin: right;
-}
perspective_origin_right : Tailwind
perspective_origin_right =
    Tailwind "perspective-origin-right"

{-| perspective-origin: top;
-}
perspective_origin_top : Tailwind
perspective_origin_top =
    Tailwind "perspective-origin-top"

{-| perspective-origin: top left;
-}
perspective_origin_top_left : Tailwind
perspective_origin_top_left =
    Tailwind "perspective-origin-top-left"

{-| perspective-origin: top right;
-}
perspective_origin_top_right : Tailwind
perspective_origin_top_right =
    Tailwind "perspective-origin-top-right"

{-| padding-left: 1px;
-}
pl_px : Tailwind
pl_px =
    Tailwind "pl-px"

{-| place-content: space-around;
-}
place_content_around : Tailwind
place_content_around =
    Tailwind "place-content-around"

{-| place-content: baseline;
-}
place_content_baseline : Tailwind
place_content_baseline =
    Tailwind "place-content-baseline"

{-| place-content: space-between;
-}
place_content_between : Tailwind
place_content_between =
    Tailwind "place-content-between"

{-| place-content: center;
-}
place_content_center : Tailwind
place_content_center =
    Tailwind "place-content-center"

{-| place-content: end;
-}
place_content_end : Tailwind
place_content_end =
    Tailwind "place-content-end"

{-| place-content: space-evenly;
-}
place_content_evenly : Tailwind
place_content_evenly =
    Tailwind "place-content-evenly"

{-| place-content: start;
-}
place_content_start : Tailwind
place_content_start =
    Tailwind "place-content-start"

{-| place-content: stretch;
-}
place_content_stretch : Tailwind
place_content_stretch =
    Tailwind "place-content-stretch"

{-| place-items: baseline;
-}
place_items_baseline : Tailwind
place_items_baseline =
    Tailwind "place-items-baseline"

{-| place-items: center;
-}
place_items_center : Tailwind
place_items_center =
    Tailwind "place-items-center"

{-| place-items: end;
-}
place_items_end : Tailwind
place_items_end =
    Tailwind "place-items-end"

{-| place-items: start;
-}
place_items_start : Tailwind
place_items_start =
    Tailwind "place-items-start"

{-| place-items: stretch;
-}
place_items_stretch : Tailwind
place_items_stretch =
    Tailwind "place-items-stretch"

{-| place-self: auto;
-}
place_self_auto : Tailwind
place_self_auto =
    Tailwind "place-self-auto"

{-| place-self: center;
-}
place_self_center : Tailwind
place_self_center =
    Tailwind "place-self-center"

{-| place-self: end;
-}
place_self_end : Tailwind
place_self_end =
    Tailwind "place-self-end"

{-| place-self: start;
-}
place_self_start : Tailwind
place_self_start =
    Tailwind "place-self-start"

{-| place-self: stretch;
-}
place_self_stretch : Tailwind
place_self_stretch =
    Tailwind "place-self-stretch"

{-| pointer-events: auto;
-}
pointer_events_auto : Tailwind
pointer_events_auto =
    Tailwind "pointer-events-auto"

{-| pointer-events: none;
-}
pointer_events_none : Tailwind
pointer_events_none =
    Tailwind "pointer-events-none"

{-| padding-right: 1px;
-}
pr_px : Tailwind
pr_px =
    Tailwind "pr-px"

{-| --tw-numeric-spacing: proportional-nums;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
proportional_nums : Tailwind
proportional_nums =
    Tailwind "proportional-nums"

{-| padding-inline-start: 1px;
-}
ps_px : Tailwind
ps_px =
    Tailwind "ps-px"

{-| padding-top: 1px;
-}
pt_px : Tailwind
pt_px =
    Tailwind "pt-px"

{-| padding-inline: 1px;
-}
px_px : Tailwind
px_px =
    Tailwind "px-px"

{-| padding-block: 1px;
-}
py_px : Tailwind
py_px =
    Tailwind "py-px"

{-| position: relative;
-}
relative : Tailwind
relative =
    Tailwind "relative"

{-| resize: both;
-}
resize : Tailwind
resize =
    Tailwind "resize"

{-| resize: none;
-}
resize_none : Tailwind
resize_none =
    Tailwind "resize-none"

{-| resize: horizontal;
-}
resize_x : Tailwind
resize_x =
    Tailwind "resize-x"

{-| resize: vertical;
-}
resize_y : Tailwind
resize_y =
    Tailwind "resize-y"

{-| right: auto;
-}
right_auto : Tailwind
right_auto =
    Tailwind "right-auto"

{-| right: 100%;
-}
right_full : Tailwind
right_full =
    Tailwind "right-full"

{-| right: 1px;
-}
right_px : Tailwind
right_px =
    Tailwind "right-px"

{-| --tw-ring-inset: inset;
-}
ring_inset : Tailwind
ring_inset =
    Tailwind "ring-inset"

{-| rotate: none;
-}
rotate_none : Tailwind
rotate_none =
    Tailwind "rotate-none"

{-| border-bottom-right-radius: calc(infinity * 1px);
  border-bottom-left-radius: calc(infinity * 1px);
-}
rounded_b_full : Tailwind
rounded_b_full =
    Tailwind "rounded-b-full"

{-| border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
-}
rounded_b_none : Tailwind
rounded_b_none =
    Tailwind "rounded-b-none"

{-| border-bottom-left-radius: calc(infinity * 1px);
-}
rounded_bl_full : Tailwind
rounded_bl_full =
    Tailwind "rounded-bl-full"

{-| border-bottom-left-radius: 0;
-}
rounded_bl_none : Tailwind
rounded_bl_none =
    Tailwind "rounded-bl-none"

{-| border-bottom-right-radius: calc(infinity * 1px);
-}
rounded_br_full : Tailwind
rounded_br_full =
    Tailwind "rounded-br-full"

{-| border-bottom-right-radius: 0;
-}
rounded_br_none : Tailwind
rounded_br_none =
    Tailwind "rounded-br-none"

{-| border-start-end-radius: calc(infinity * 1px);
  border-end-end-radius: calc(infinity * 1px);
-}
rounded_e_full : Tailwind
rounded_e_full =
    Tailwind "rounded-e-full"

{-| border-start-end-radius: 0;
  border-end-end-radius: 0;
-}
rounded_e_none : Tailwind
rounded_e_none =
    Tailwind "rounded-e-none"

{-| border-end-end-radius: calc(infinity * 1px);
-}
rounded_ee_full : Tailwind
rounded_ee_full =
    Tailwind "rounded-ee-full"

{-| border-end-end-radius: 0;
-}
rounded_ee_none : Tailwind
rounded_ee_none =
    Tailwind "rounded-ee-none"

{-| border-end-start-radius: calc(infinity * 1px);
-}
rounded_es_full : Tailwind
rounded_es_full =
    Tailwind "rounded-es-full"

{-| border-end-start-radius: 0;
-}
rounded_es_none : Tailwind
rounded_es_none =
    Tailwind "rounded-es-none"

{-| border-radius: calc(infinity * 1px);
-}
rounded_full : Tailwind
rounded_full =
    Tailwind "rounded-full"

{-| border-top-left-radius: calc(infinity * 1px);
  border-bottom-left-radius: calc(infinity * 1px);
-}
rounded_l_full : Tailwind
rounded_l_full =
    Tailwind "rounded-l-full"

{-| border-top-left-radius: 0;
  border-bottom-left-radius: 0;
-}
rounded_l_none : Tailwind
rounded_l_none =
    Tailwind "rounded-l-none"

{-| border-radius: 0;
-}
rounded_none : Tailwind
rounded_none =
    Tailwind "rounded-none"

{-| border-top-right-radius: calc(infinity * 1px);
  border-bottom-right-radius: calc(infinity * 1px);
-}
rounded_r_full : Tailwind
rounded_r_full =
    Tailwind "rounded-r-full"

{-| border-top-right-radius: 0;
  border-bottom-right-radius: 0;
-}
rounded_r_none : Tailwind
rounded_r_none =
    Tailwind "rounded-r-none"

{-| border-start-start-radius: calc(infinity * 1px);
  border-end-start-radius: calc(infinity * 1px);
-}
rounded_s_full : Tailwind
rounded_s_full =
    Tailwind "rounded-s-full"

{-| border-start-start-radius: 0;
  border-end-start-radius: 0;
-}
rounded_s_none : Tailwind
rounded_s_none =
    Tailwind "rounded-s-none"

{-| border-start-end-radius: calc(infinity * 1px);
-}
rounded_se_full : Tailwind
rounded_se_full =
    Tailwind "rounded-se-full"

{-| border-start-end-radius: 0;
-}
rounded_se_none : Tailwind
rounded_se_none =
    Tailwind "rounded-se-none"

{-| border-start-start-radius: calc(infinity * 1px);
-}
rounded_ss_full : Tailwind
rounded_ss_full =
    Tailwind "rounded-ss-full"

{-| border-start-start-radius: 0;
-}
rounded_ss_none : Tailwind
rounded_ss_none =
    Tailwind "rounded-ss-none"

{-| border-top-left-radius: calc(infinity * 1px);
  border-top-right-radius: calc(infinity * 1px);
-}
rounded_t_full : Tailwind
rounded_t_full =
    Tailwind "rounded-t-full"

{-| border-top-left-radius: 0;
  border-top-right-radius: 0;
-}
rounded_t_none : Tailwind
rounded_t_none =
    Tailwind "rounded-t-none"

{-| border-top-left-radius: calc(infinity * 1px);
-}
rounded_tl_full : Tailwind
rounded_tl_full =
    Tailwind "rounded-tl-full"

{-| border-top-left-radius: 0;
-}
rounded_tl_none : Tailwind
rounded_tl_none =
    Tailwind "rounded-tl-none"

{-| border-top-right-radius: calc(infinity * 1px);
-}
rounded_tr_full : Tailwind
rounded_tr_full =
    Tailwind "rounded-tr-full"

{-| border-top-right-radius: 0;
-}
rounded_tr_none : Tailwind
rounded_tr_none =
    Tailwind "rounded-tr-none"

{-| grid-row: auto;
-}
row_auto : Tailwind
row_auto =
    Tailwind "row-auto"

{-| grid-row-end: auto;
-}
row_end_auto : Tailwind
row_end_auto =
    Tailwind "row-end-auto"

{-| grid-row: 1 / -1;
-}
row_span_full : Tailwind
row_span_full =
    Tailwind "row-span-full"

{-| grid-row-start: auto;
-}
row_start_auto : Tailwind
row_start_auto =
    Tailwind "row-start-auto"

{-| scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_3d : Tailwind
scale_3d =
    Tailwind "scale-3d"

{-| scale: none;
-}
scale_none : Tailwind
scale_none =
    Tailwind "scale-none"

{-| color-scheme: dark;
-}
scheme_dark : Tailwind
scheme_dark =
    Tailwind "scheme-dark"

{-| color-scheme: light;
-}
scheme_light : Tailwind
scheme_light =
    Tailwind "scheme-light"

{-| color-scheme: light dark;
-}
scheme_light_dark : Tailwind
scheme_light_dark =
    Tailwind "scheme-light-dark"

{-| color-scheme: normal;
-}
scheme_normal : Tailwind
scheme_normal =
    Tailwind "scheme-normal"

{-| color-scheme: only dark;
-}
scheme_only_dark : Tailwind
scheme_only_dark =
    Tailwind "scheme-only-dark"

{-| color-scheme: only light;
-}
scheme_only_light : Tailwind
scheme_only_light =
    Tailwind "scheme-only-light"

{-| scroll-behavior: auto;
-}
scroll_auto : Tailwind
scroll_auto =
    Tailwind "scroll-auto"

{-| scroll-margin: 1px;
-}
scroll_m_px : Tailwind
scroll_m_px =
    Tailwind "scroll-m-px"

{-| scroll-margin-bottom: 1px;
-}
scroll_mb_px : Tailwind
scroll_mb_px =
    Tailwind "scroll-mb-px"

{-| scroll-margin-inline-end: 1px;
-}
scroll_me_px : Tailwind
scroll_me_px =
    Tailwind "scroll-me-px"

{-| scroll-margin-left: 1px;
-}
scroll_ml_px : Tailwind
scroll_ml_px =
    Tailwind "scroll-ml-px"

{-| scroll-margin-right: 1px;
-}
scroll_mr_px : Tailwind
scroll_mr_px =
    Tailwind "scroll-mr-px"

{-| scroll-margin-inline-start: 1px;
-}
scroll_ms_px : Tailwind
scroll_ms_px =
    Tailwind "scroll-ms-px"

{-| scroll-margin-top: 1px;
-}
scroll_mt_px : Tailwind
scroll_mt_px =
    Tailwind "scroll-mt-px"

{-| scroll-margin-inline: 1px;
-}
scroll_mx_px : Tailwind
scroll_mx_px =
    Tailwind "scroll-mx-px"

{-| scroll-margin-block: 1px;
-}
scroll_my_px : Tailwind
scroll_my_px =
    Tailwind "scroll-my-px"

{-| scroll-padding: 1px;
-}
scroll_p_px : Tailwind
scroll_p_px =
    Tailwind "scroll-p-px"

{-| scroll-padding-bottom: 1px;
-}
scroll_pb_px : Tailwind
scroll_pb_px =
    Tailwind "scroll-pb-px"

{-| scroll-padding-inline-end: 1px;
-}
scroll_pe_px : Tailwind
scroll_pe_px =
    Tailwind "scroll-pe-px"

{-| scroll-padding-left: 1px;
-}
scroll_pl_px : Tailwind
scroll_pl_px =
    Tailwind "scroll-pl-px"

{-| scroll-padding-right: 1px;
-}
scroll_pr_px : Tailwind
scroll_pr_px =
    Tailwind "scroll-pr-px"

{-| scroll-padding-inline-start: 1px;
-}
scroll_ps_px : Tailwind
scroll_ps_px =
    Tailwind "scroll-ps-px"

{-| scroll-padding-top: 1px;
-}
scroll_pt_px : Tailwind
scroll_pt_px =
    Tailwind "scroll-pt-px"

{-| scroll-padding-inline: 1px;
-}
scroll_px_px : Tailwind
scroll_px_px =
    Tailwind "scroll-px-px"

{-| scroll-padding-block: 1px;
-}
scroll_py_px : Tailwind
scroll_py_px =
    Tailwind "scroll-py-px"

{-| scroll-behavior: smooth;
-}
scroll_smooth : Tailwind
scroll_smooth =
    Tailwind "scroll-smooth"

{-| -webkit-user-select: all;
  user-select: all;
-}
select_all : Tailwind
select_all =
    Tailwind "select-all"

{-| -webkit-user-select: auto;
  user-select: auto;
-}
select_auto : Tailwind
select_auto =
    Tailwind "select-auto"

{-| -webkit-user-select: none;
  user-select: none;
-}
select_none : Tailwind
select_none =
    Tailwind "select-none"

{-| -webkit-user-select: text;
  user-select: text;
-}
select_text : Tailwind
select_text =
    Tailwind "select-text"

{-| align-self: auto;
-}
self_auto : Tailwind
self_auto =
    Tailwind "self-auto"

{-| align-self: baseline;
-}
self_baseline : Tailwind
self_baseline =
    Tailwind "self-baseline"

{-| align-self: center;
-}
self_center : Tailwind
self_center =
    Tailwind "self-center"

{-| align-self: flex-end;
-}
self_end : Tailwind
self_end =
    Tailwind "self-end"

{-| align-self: flex-start;
-}
self_start : Tailwind
self_start =
    Tailwind "self-start"

{-| align-self: stretch;
-}
self_stretch : Tailwind
self_stretch =
    Tailwind "self-stretch"

{-| --tw-shadow-color: initial;
-}
shadow_initial : Tailwind
shadow_initial =
    Tailwind "shadow-initial"

{-| width: auto;
  height: auto;
-}
size_auto : Tailwind
size_auto =
    Tailwind "size-auto"

{-| width: 100dvh;
  height: 100dvh;
-}
size_dvh : Tailwind
size_dvh =
    Tailwind "size-dvh"

{-| width: 100dvw;
  height: 100dvw;
-}
size_dvw : Tailwind
size_dvw =
    Tailwind "size-dvw"

{-| width: fit-content;
  height: fit-content;
-}
size_fit : Tailwind
size_fit =
    Tailwind "size-fit"

{-| width: 100%;
  height: 100%;
-}
size_full : Tailwind
size_full =
    Tailwind "size-full"

{-| width: 100lvh;
  height: 100lvh;
-}
size_lvh : Tailwind
size_lvh =
    Tailwind "size-lvh"

{-| width: 100lvw;
  height: 100lvw;
-}
size_lvw : Tailwind
size_lvw =
    Tailwind "size-lvw"

{-| width: max-content;
  height: max-content;
-}
size_max : Tailwind
size_max =
    Tailwind "size-max"

{-| width: min-content;
  height: min-content;
-}
size_min : Tailwind
size_min =
    Tailwind "size-min"

{-| width: 1px;
  height: 1px;
-}
size_px : Tailwind
size_px =
    Tailwind "size-px"

{-| width: 100svh;
  height: 100svh;
-}
size_svh : Tailwind
size_svh =
    Tailwind "size-svh"

{-| width: 100svw;
  height: 100svw;
-}
size_svw : Tailwind
size_svw =
    Tailwind "size-svw"

{-| --tw-slashed-zero: slashed-zero;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
slashed_zero : Tailwind
slashed_zero =
    Tailwind "slashed-zero"

{-| scroll-snap-align: none;
-}
snap_align_none : Tailwind
snap_align_none =
    Tailwind "snap-align-none"

{-| scroll-snap-stop: always;
-}
snap_always : Tailwind
snap_always =
    Tailwind "snap-always"

{-| scroll-snap-type: both var(--tw-scroll-snap-strictness);
-}
snap_both : Tailwind
snap_both =
    Tailwind "snap-both"

{-| scroll-snap-align: center;
-}
snap_center : Tailwind
snap_center =
    Tailwind "snap-center"

{-| scroll-snap-align: end;
-}
snap_end : Tailwind
snap_end =
    Tailwind "snap-end"

{-| --tw-scroll-snap-strictness: mandatory;
-}
snap_mandatory : Tailwind
snap_mandatory =
    Tailwind "snap-mandatory"

{-| scroll-snap-type: none;
-}
snap_none : Tailwind
snap_none =
    Tailwind "snap-none"

{-| scroll-snap-stop: normal;
-}
snap_normal : Tailwind
snap_normal =
    Tailwind "snap-normal"

{-| --tw-scroll-snap-strictness: proximity;
-}
snap_proximity : Tailwind
snap_proximity =
    Tailwind "snap-proximity"

{-| scroll-snap-align: start;
-}
snap_start : Tailwind
snap_start =
    Tailwind "snap-start"

{-| scroll-snap-type: x var(--tw-scroll-snap-strictness);
-}
snap_x : Tailwind
snap_x =
    Tailwind "snap-x"

{-| scroll-snap-type: y var(--tw-scroll-snap-strictness);
-}
snap_y : Tailwind
snap_y =
    Tailwind "snap-y"

{-| :where(& > :not(:last-child)) {
    --tw-space-x-reverse: 0;
    margin-inline-start: calc(1px * var(--tw-space-x-reverse));
    margin-inline-end: calc(1px * calc(1 - var(--tw-space-x-reverse)));
-}
space_x_px : Tailwind
space_x_px =
    Tailwind "space-x-px"

{-| :where(& > :not(:last-child)) {
    --tw-space-x-reverse: 1;
-}
space_x_reverse : Tailwind
space_x_reverse =
    Tailwind "space-x-reverse"

{-| :where(& > :not(:last-child)) {
    --tw-space-y-reverse: 0;
    margin-block-start: calc(1px * var(--tw-space-y-reverse));
    margin-block-end: calc(1px * calc(1 - var(--tw-space-y-reverse)));
-}
space_y_px : Tailwind
space_y_px =
    Tailwind "space-y-px"

{-| :where(& > :not(:last-child)) {
    --tw-space-y-reverse: 1;
-}
space_y_reverse : Tailwind
space_y_reverse =
    Tailwind "space-y-reverse"

{-| position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
-}
sr_only : Tailwind
sr_only =
    Tailwind "sr-only"

{-| --tw-numeric-fraction: stacked-fractions;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
stacked_fractions : Tailwind
stacked_fractions =
    Tailwind "stacked-fractions"

{-| inset-inline-start: auto;
-}
start_auto : Tailwind
start_auto =
    Tailwind "start-auto"

{-| inset-inline-start: 100%;
-}
start_full : Tailwind
start_full =
    Tailwind "start-full"

{-| inset-inline-start: 1px;
-}
start_px : Tailwind
start_px =
    Tailwind "start-px"

{-| position: static;
-}
static : Tailwind
static =
    Tailwind "static"

{-| position: sticky;
-}
sticky : Tailwind
sticky =
    Tailwind "sticky"

{-| stroke: none;
-}
stroke_none : Tailwind
stroke_none =
    Tailwind "stroke-none"

{-| -webkit-font-smoothing: auto;
  -moz-osx-font-smoothing: auto;
-}
subpixel_antialiased : Tailwind
subpixel_antialiased =
    Tailwind "subpixel-antialiased"

{-| display: table;
-}
table : Tailwind
table =
    Tailwind "table"

{-| table-layout: auto;
-}
table_auto : Tailwind
table_auto =
    Tailwind "table-auto"

{-| display: table-caption;
-}
table_caption : Tailwind
table_caption =
    Tailwind "table-caption"

{-| display: table-cell;
-}
table_cell : Tailwind
table_cell =
    Tailwind "table-cell"

{-| display: table-column;
-}
table_column : Tailwind
table_column =
    Tailwind "table-column"

{-| display: table-column-group;
-}
table_column_group : Tailwind
table_column_group =
    Tailwind "table-column-group"

{-| table-layout: fixed;
-}
table_fixed : Tailwind
table_fixed =
    Tailwind "table-fixed"

{-| display: table-footer-group;
-}
table_footer_group : Tailwind
table_footer_group =
    Tailwind "table-footer-group"

{-| display: table-header-group;
-}
table_header_group : Tailwind
table_header_group =
    Tailwind "table-header-group"

{-| display: table-row;
-}
table_row : Tailwind
table_row =
    Tailwind "table-row"

{-| display: table-row-group;
-}
table_row_group : Tailwind
table_row_group =
    Tailwind "table-row-group"

{-| --tw-numeric-spacing: tabular-nums;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
tabular_nums : Tailwind
tabular_nums =
    Tailwind "tabular-nums"

{-| text-wrap: balance;
-}
text_balance : Tailwind
text_balance =
    Tailwind "text-balance"

{-| text-align: center;
-}
text_center : Tailwind
text_center =
    Tailwind "text-center"

{-| text-overflow: clip;
-}
text_clip : Tailwind
text_clip =
    Tailwind "text-clip"

{-| text-overflow: ellipsis;
-}
text_ellipsis : Tailwind
text_ellipsis =
    Tailwind "text-ellipsis"

{-| text-align: end;
-}
text_end : Tailwind
text_end =
    Tailwind "text-end"

{-| text-align: justify;
-}
text_justify : Tailwind
text_justify =
    Tailwind "text-justify"

{-| text-align: left;
-}
text_left : Tailwind
text_left =
    Tailwind "text-left"

{-| text-wrap: nowrap;
-}
text_nowrap : Tailwind
text_nowrap =
    Tailwind "text-nowrap"

{-| text-wrap: pretty;
-}
text_pretty : Tailwind
text_pretty =
    Tailwind "text-pretty"

{-| text-align: right;
-}
text_right : Tailwind
text_right =
    Tailwind "text-right"

{-| text-align: start;
-}
text_start : Tailwind
text_start =
    Tailwind "text-start"

{-| text-wrap: wrap;
-}
text_wrap : Tailwind
text_wrap =
    Tailwind "text-wrap"

{-| top: auto;
-}
top_auto : Tailwind
top_auto =
    Tailwind "top-auto"

{-| top: 100%;
-}
top_full : Tailwind
top_full =
    Tailwind "top-full"

{-| top: 1px;
-}
top_px : Tailwind
top_px =
    Tailwind "top-px"

{-| touch-action: auto;
-}
touch_auto : Tailwind
touch_auto =
    Tailwind "touch-auto"

{-| touch-action: manipulation;
-}
touch_manipulation : Tailwind
touch_manipulation =
    Tailwind "touch-manipulation"

{-| touch-action: none;
-}
touch_none : Tailwind
touch_none =
    Tailwind "touch-none"

{-| --tw-pan-y: pan-down;
  touch-action: var(--tw-pan-x,) var(--tw-pan-y,) var(--tw-pinch-zoom,);
-}
touch_pan_down : Tailwind
touch_pan_down =
    Tailwind "touch-pan-down"

{-| --tw-pan-x: pan-left;
  touch-action: var(--tw-pan-x,) var(--tw-pan-y,) var(--tw-pinch-zoom,);
-}
touch_pan_left : Tailwind
touch_pan_left =
    Tailwind "touch-pan-left"

{-| --tw-pan-x: pan-right;
  touch-action: var(--tw-pan-x,) var(--tw-pan-y,) var(--tw-pinch-zoom,);
-}
touch_pan_right : Tailwind
touch_pan_right =
    Tailwind "touch-pan-right"

{-| --tw-pan-y: pan-up;
  touch-action: var(--tw-pan-x,) var(--tw-pan-y,) var(--tw-pinch-zoom,);
-}
touch_pan_up : Tailwind
touch_pan_up =
    Tailwind "touch-pan-up"

{-| --tw-pan-x: pan-x;
  touch-action: var(--tw-pan-x,) var(--tw-pan-y,) var(--tw-pinch-zoom,);
-}
touch_pan_x : Tailwind
touch_pan_x =
    Tailwind "touch-pan-x"

{-| --tw-pan-y: pan-y;
  touch-action: var(--tw-pan-x,) var(--tw-pan-y,) var(--tw-pinch-zoom,);
-}
touch_pan_y : Tailwind
touch_pan_y =
    Tailwind "touch-pan-y"

{-| --tw-pinch-zoom: pinch-zoom;
  touch-action: var(--tw-pan-x,) var(--tw-pan-y,) var(--tw-pinch-zoom,);
-}
touch_pinch_zoom : Tailwind
touch_pinch_zoom =
    Tailwind "touch-pinch-zoom"

{-| transform-style: preserve-3d;
-}
transform_3d : Tailwind
transform_3d =
    Tailwind "transform-3d"

{-| transform-box: border-box;
-}
transform_border : Tailwind
transform_border =
    Tailwind "transform-border"

{-| transform-box: content-box;
-}
transform_content : Tailwind
transform_content =
    Tailwind "transform-content"

{-| transform: var(--tw-rotate-x) var(--tw-rotate-y) var(--tw-rotate-z) var(--tw-skew-x) var(--tw-skew-y);
-}
transform_cpu : Tailwind
transform_cpu =
    Tailwind "transform-cpu"

{-| transform-box: fill-box;
-}
transform_fill : Tailwind
transform_fill =
    Tailwind "transform-fill"

{-| transform-style: flat;
-}
transform_flat : Tailwind
transform_flat =
    Tailwind "transform-flat"

{-| transform: translateZ(0) var(--tw-rotate-x) var(--tw-rotate-y) var(--tw-rotate-z) var(--tw-skew-x) var(--tw-skew-y);
-}
transform_gpu : Tailwind
transform_gpu =
    Tailwind "transform-gpu"

{-| transform: none;
-}
transform_none : Tailwind
transform_none =
    Tailwind "transform-none"

{-| transform-box: stroke-box;
-}
transform_stroke : Tailwind
transform_stroke =
    Tailwind "transform-stroke"

{-| transform-box: view-box;
-}
transform_view : Tailwind
transform_view =
    Tailwind "transform-view"

{-| transition-property: all;
  transition-timing-function: var(--tw-ease, var(--default-transition-timing-function));
  transition-duration: var(--tw-duration, var(--default-transition-duration));
-}
transition_all : Tailwind
transition_all =
    Tailwind "transition-all"

{-| transition-property: color, background-color, border-color, outline-color, text-decoration-color, fill, stroke, --tw-gradient-from, --tw-gradient-via, --tw-gradient-to;
  transition-timing-function: var(--tw-ease, var(--default-transition-timing-function));
  transition-duration: var(--tw-duration, var(--default-transition-duration));
-}
transition_colors : Tailwind
transition_colors =
    Tailwind "transition-colors"

{-| transition-behavior: allow-discrete;
-}
transition_discrete : Tailwind
transition_discrete =
    Tailwind "transition-discrete"

{-| transition-property: none;
-}
transition_none : Tailwind
transition_none =
    Tailwind "transition-none"

{-| transition-behavior: normal;
-}
transition_normal : Tailwind
transition_normal =
    Tailwind "transition-normal"

{-| transition-property: opacity;
  transition-timing-function: var(--tw-ease, var(--default-transition-timing-function));
  transition-duration: var(--tw-duration, var(--default-transition-duration));
-}
transition_opacity : Tailwind
transition_opacity =
    Tailwind "transition-opacity"

{-| transition-property: box-shadow;
  transition-timing-function: var(--tw-ease, var(--default-transition-timing-function));
  transition-duration: var(--tw-duration, var(--default-transition-duration));
-}
transition_shadow : Tailwind
transition_shadow =
    Tailwind "transition-shadow"

{-| transition-property: transform, translate, scale, rotate;
  transition-timing-function: var(--tw-ease, var(--default-transition-timing-function));
  transition-duration: var(--tw-duration, var(--default-transition-duration));
-}
transition_transform : Tailwind
transition_transform =
    Tailwind "transition-transform"

{-| translate: var(--tw-translate-x) var(--tw-translate-y) var(--tw-translate-z);
-}
translate_3d : Tailwind
translate_3d =
    Tailwind "translate-3d"

{-| --tw-translate-x: 100%;
  --tw-translate-y: 100%;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
translate_full : Tailwind
translate_full =
    Tailwind "translate-full"

{-| translate: none;
-}
translate_none : Tailwind
translate_none =
    Tailwind "translate-none"

{-| --tw-translate-x: 1px;
  --tw-translate-y: 1px;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
translate_px : Tailwind
translate_px =
    Tailwind "translate-px"

{-| --tw-translate-x: 100%;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
translate_x_full : Tailwind
translate_x_full =
    Tailwind "translate-x-full"

{-| --tw-translate-x: 1px;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
translate_x_px : Tailwind
translate_x_px =
    Tailwind "translate-x-px"

{-| --tw-translate-y: 100%;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
translate_y_full : Tailwind
translate_y_full =
    Tailwind "translate-y-full"

{-| --tw-translate-y: 1px;
  translate: var(--tw-translate-x) var(--tw-translate-y);
-}
translate_y_px : Tailwind
translate_y_px =
    Tailwind "translate-y-px"

{-| --tw-translate-z: 1px;
  translate: var(--tw-translate-x) var(--tw-translate-y) var(--tw-translate-z);
-}
translate_z_px : Tailwind
translate_z_px =
    Tailwind "translate-z-px"

{-| overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
-}
truncate : Tailwind
truncate =
    Tailwind "truncate"

{-| text-decoration-line: underline;
-}
underline : Tailwind
underline =
    Tailwind "underline"

{-| text-underline-offset: auto;
-}
underline_offset_auto : Tailwind
underline_offset_auto =
    Tailwind "underline-offset-auto"

{-| text-transform: uppercase;
-}
uppercase : Tailwind
uppercase =
    Tailwind "uppercase"

{-| --tw-gradient-via-stops: initial;
-}
via_none : Tailwind
via_none =
    Tailwind "via-none"

{-| visibility: visible;
-}
visible : Tailwind
visible =
    Tailwind "visible"

{-| width: 100dvh;
-}
w_dvh : Tailwind
w_dvh =
    Tailwind "w-dvh"

{-| width: 100dvw;
-}
w_dvw : Tailwind
w_dvw =
    Tailwind "w-dvw"

{-| width: 100lvh;
-}
w_lvh : Tailwind
w_lvh =
    Tailwind "w-lvh"

{-| width: 100lvw;
-}
w_lvw : Tailwind
w_lvw =
    Tailwind "w-lvw"

{-| width: 1px;
-}
w_px : Tailwind
w_px =
    Tailwind "w-px"

{-| width: 100svh;
-}
w_svh : Tailwind
w_svh =
    Tailwind "w-svh"

{-| width: 100svw;
-}
w_svw : Tailwind
w_svw =
    Tailwind "w-svw"

{-| white-space: break-spaces;
-}
whitespace_break_spaces : Tailwind
whitespace_break_spaces =
    Tailwind "whitespace-break-spaces"

{-| white-space: normal;
-}
whitespace_normal : Tailwind
whitespace_normal =
    Tailwind "whitespace-normal"

{-| white-space: nowrap;
-}
whitespace_nowrap : Tailwind
whitespace_nowrap =
    Tailwind "whitespace-nowrap"

{-| white-space: pre;
-}
whitespace_pre : Tailwind
whitespace_pre =
    Tailwind "whitespace-pre"

{-| white-space: pre-line;
-}
whitespace_pre_line : Tailwind
whitespace_pre_line =
    Tailwind "whitespace-pre-line"

{-| white-space: pre-wrap;
-}
whitespace_pre_wrap : Tailwind
whitespace_pre_wrap =
    Tailwind "whitespace-pre-wrap"

{-| will-change: auto;
-}
will_change_auto : Tailwind
will_change_auto =
    Tailwind "will-change-auto"

{-| will-change: contents;
-}
will_change_contents : Tailwind
will_change_contents =
    Tailwind "will-change-contents"

{-| will-change: scroll-position;
-}
will_change_scroll : Tailwind
will_change_scroll =
    Tailwind "will-change-scroll"

{-| will-change: transform;
-}
will_change_transform : Tailwind
will_change_transform =
    Tailwind "will-change-transform"
