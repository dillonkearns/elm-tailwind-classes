module Tailwind exposing
    ( Tailwind(..)
    , classes
    , batch
    , raw
    , toClass
    , p
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
    , text_simple
    , bg_simple
    , border_simple
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
    , neg_inset_be_full
    , neg_inset_be_px
    , neg_inset_bs_full
    , neg_inset_bs_px
    , neg_inset_e_full
    , neg_inset_e_px
    , neg_inset_full
    , neg_inset_px
    , neg_inset_s_full
    , neg_inset_s_px
    , neg_inset_x_full
    , neg_inset_x_px
    , neg_inset_y_full
    , neg_inset_y_px
    , neg_left_full
    , neg_left_px
    , neg_m_px
    , neg_mb_px
    , neg_mbe_px
    , neg_mbs_px
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
    , neg_scroll_mbe_px
    , neg_scroll_mbs_px
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
    , animate_bounce
    , animate_none
    , animate_ping
    , animate_pulse
    , animate_spin
    , antialiased
    , appearance_auto
    , appearance_none
    , aspect_auto
    , aspect_square
    , aspect_video
    , auto_cols_auto
    , auto_cols_fr
    , auto_cols_max
    , auto_cols_min
    , auto_rows_auto
    , auto_rows_fr
    , auto_rows_max
    , auto_rows_min
    , backdrop_blur_2xl
    , backdrop_blur_3xl
    , backdrop_blur_lg
    , backdrop_blur_md
    , backdrop_blur_none
    , backdrop_blur_sm
    , backdrop_blur_xl
    , backdrop_blur_xs
    , backdrop_brightness_0
    , backdrop_brightness_100
    , backdrop_brightness_105
    , backdrop_brightness_110
    , backdrop_brightness_125
    , backdrop_brightness_150
    , backdrop_brightness_200
    , backdrop_brightness_50
    , backdrop_brightness_75
    , backdrop_brightness_90
    , backdrop_brightness_95
    , backdrop_contrast_0
    , backdrop_contrast_100
    , backdrop_contrast_125
    , backdrop_contrast_150
    , backdrop_contrast_200
    , backdrop_contrast_50
    , backdrop_contrast_75
    , backdrop_grayscale
    , backdrop_grayscale_0
    , backdrop_grayscale_100
    , backdrop_grayscale_25
    , backdrop_grayscale_50
    , backdrop_grayscale_75
    , backdrop_hue_rotate_0
    , backdrop_hue_rotate_15
    , backdrop_hue_rotate_180
    , backdrop_hue_rotate_30
    , backdrop_hue_rotate_60
    , backdrop_hue_rotate_90
    , backdrop_invert
    , backdrop_invert_0
    , backdrop_invert_100
    , backdrop_invert_25
    , backdrop_invert_50
    , backdrop_invert_75
    , backdrop_saturate_0
    , backdrop_saturate_100
    , backdrop_saturate_150
    , backdrop_saturate_200
    , backdrop_saturate_50
    , backdrop_sepia
    , backdrop_sepia_0
    , backdrop_sepia_100
    , backdrop_sepia_50
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
    , bg_bottom_left
    , bg_bottom_right
    , bg_center
    , bg_clip_border
    , bg_clip_content
    , bg_clip_padding
    , bg_clip_text
    , bg_conic
    , bg_conic_0
    , bg_conic_120
    , bg_conic_150
    , bg_conic_180
    , bg_conic_210
    , bg_conic_240
    , bg_conic_270
    , bg_conic_30
    , bg_conic_300
    , bg_conic_330
    , bg_conic_60
    , bg_conic_90
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
    , bg_linear_0
    , bg_linear_120
    , bg_linear_150
    , bg_linear_180
    , bg_linear_210
    , bg_linear_240
    , bg_linear_270
    , bg_linear_30
    , bg_linear_300
    , bg_linear_330
    , bg_linear_60
    , bg_linear_90
    , bg_linear_to_b
    , bg_linear_to_bl
    , bg_linear_to_br
    , bg_linear_to_l
    , bg_linear_to_r
    , bg_linear_to_t
    , bg_linear_to_tl
    , bg_linear_to_tr
    , bg_local
    , bg_no_repeat
    , bg_none
    , bg_origin_border
    , bg_origin_content
    , bg_origin_padding
    , bg_radial
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
    , bg_top_left
    , bg_top_right
    , block
    , block_auto
    , block_dvh
    , block_fit
    , block_full
    , block_lh
    , block_lvh
    , block_max
    , block_min
    , block_px
    , block_screen
    , block_svh
    , blur_2xl
    , blur_3xl
    , blur_lg
    , blur_md
    , blur_none
    , blur_sm
    , blur_xl
    , blur_xs
    , border
    , border_0
    , border_2
    , border_4
    , border_8
    , border_b
    , border_b_0
    , border_b_2
    , border_b_4
    , border_b_8
    , border_be
    , border_be_0
    , border_be_2
    , border_be_4
    , border_be_8
    , border_bs
    , border_bs_0
    , border_bs_2
    , border_bs_4
    , border_bs_8
    , border_collapse
    , border_dashed
    , border_dotted
    , border_double
    , border_e
    , border_e_0
    , border_e_2
    , border_e_4
    , border_e_8
    , border_hidden
    , border_l
    , border_l_0
    , border_l_2
    , border_l_4
    , border_l_8
    , border_none
    , border_r
    , border_r_0
    , border_r_2
    , border_r_4
    , border_r_8
    , border_s
    , border_s_0
    , border_s_2
    , border_s_4
    , border_s_8
    , border_separate
    , border_solid
    , border_spacing_px
    , border_spacing_x_px
    , border_spacing_y_px
    , border_t
    , border_t_0
    , border_t_2
    , border_t_4
    , border_t_8
    , border_x
    , border_x_0
    , border_x_2
    , border_x_4
    , border_x_8
    , border_y
    , border_y_0
    , border_y_2
    , border_y_4
    , border_y_8
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
    , brightness_0
    , brightness_100
    , brightness_105
    , brightness_110
    , brightness_125
    , brightness_150
    , brightness_200
    , brightness_50
    , brightness_75
    , brightness_90
    , brightness_95
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
    , col_end_1
    , col_end_10
    , col_end_11
    , col_end_12
    , col_end_13
    , col_end_2
    , col_end_3
    , col_end_4
    , col_end_5
    , col_end_6
    , col_end_7
    , col_end_8
    , col_end_9
    , col_end_auto
    , col_span_1
    , col_span_10
    , col_span_11
    , col_span_12
    , col_span_2
    , col_span_3
    , col_span_4
    , col_span_5
    , col_span_6
    , col_span_7
    , col_span_8
    , col_span_9
    , col_span_full
    , col_start_1
    , col_start_10
    , col_start_11
    , col_start_12
    , col_start_13
    , col_start_2
    , col_start_3
    , col_start_4
    , col_start_5
    , col_start_6
    , col_start_7
    , col_start_8
    , col_start_9
    , col_start_auto
    , collapse
    , columns_2xl
    , columns_2xs
    , columns_3xl
    , columns_3xs
    , columns_4xl
    , columns_5xl
    , columns_6xl
    , columns_7xl
    , columns_auto
    , columns_lg
    , columns_md
    , columns_sm
    , columns_xl
    , columns_xs
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
    , content_center_safe
    , content_end
    , content_end_safe
    , content_evenly
    , content_none
    , content_normal
    , content_start
    , content_stretch
    , contents
    , contrast_0
    , contrast_100
    , contrast_125
    , contrast_150
    , contrast_200
    , contrast_50
    , contrast_75
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
    , decoration_0
    , decoration_1
    , decoration_2
    , decoration_auto
    , decoration_clone
    , decoration_dashed
    , decoration_dotted
    , decoration_double
    , decoration_from_font
    , decoration_slice
    , decoration_solid
    , decoration_wavy
    , delay_100
    , delay_1000
    , delay_150
    , delay_200
    , delay_300
    , delay_500
    , delay_700
    , delay_75
    , diagonal_fractions
    , divide_dashed
    , divide_dotted
    , divide_double
    , divide_none
    , divide_solid
    , divide_x
    , divide_x_0
    , divide_x_2
    , divide_x_4
    , divide_x_8
    , divide_x_reverse
    , divide_y
    , divide_y_0
    , divide_y_2
    , divide_y_4
    , divide_y_8
    , divide_y_reverse
    , drop_shadow_2xl
    , drop_shadow_lg
    , drop_shadow_md
    , drop_shadow_none
    , drop_shadow_sm
    , drop_shadow_xl
    , drop_shadow_xs
    , duration_100
    , duration_1000
    , duration_150
    , duration_200
    , duration_300
    , duration_500
    , duration_700
    , duration_75
    , duration_initial
    , ease_in
    , ease_in_out
    , ease_initial
    , ease_linear
    , ease_out
    , end_auto
    , end_full
    , end_px
    , field_sizing_content
    , field_sizing_fixed
    , fill_none
    , fixed
    , flex
    , flex_1
    , flex_10
    , flex_11
    , flex_12
    , flex_2
    , flex_3
    , flex_4
    , flex_5
    , flex_6
    , flex_7
    , flex_8
    , flex_9
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
    , font_mono
    , font_sans
    , font_serif
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
    , grayscale
    , grayscale_0
    , grayscale_100
    , grayscale_25
    , grayscale_50
    , grayscale_75
    , grid
    , grid_cols_1
    , grid_cols_10
    , grid_cols_11
    , grid_cols_12
    , grid_cols_2
    , grid_cols_3
    , grid_cols_4
    , grid_cols_5
    , grid_cols_6
    , grid_cols_7
    , grid_cols_8
    , grid_cols_9
    , grid_cols_none
    , grid_cols_subgrid
    , grid_flow_col
    , grid_flow_col_dense
    , grid_flow_dense
    , grid_flow_row
    , grid_flow_row_dense
    , grid_rows_1
    , grid_rows_10
    , grid_rows_11
    , grid_rows_12
    , grid_rows_2
    , grid_rows_3
    , grid_rows_4
    , grid_rows_5
    , grid_rows_6
    , grid_rows_7
    , grid_rows_8
    , grid_rows_9
    , grid_rows_none
    , grid_rows_subgrid
    , grow
    , grow_0
    , h_dvh
    , h_dvw
    , h_lh
    , h_lvh
    , h_lvw
    , h_px
    , h_svh
    , h_svw
    , hidden
    , hue_rotate_0
    , hue_rotate_15
    , hue_rotate_180
    , hue_rotate_30
    , hue_rotate_60
    , hue_rotate_90
    , hyphens_auto
    , hyphens_manual
    , hyphens_none
    , indent_px
    , inline
    , inline_auto
    , inline_block
    , inline_dvw
    , inline_fit
    , inline_flex
    , inline_full
    , inline_grid
    , inline_lvw
    , inline_max
    , inline_min
    , inline_px
    , inline_screen
    , inline_svw
    , inline_table
    , inset_auto
    , inset_be_auto
    , inset_be_full
    , inset_be_px
    , inset_bs_auto
    , inset_bs_full
    , inset_bs_px
    , inset_e_auto
    , inset_e_full
    , inset_e_px
    , inset_full
    , inset_px
    , inset_ring
    , inset_ring_0
    , inset_ring_1
    , inset_ring_2
    , inset_ring_4
    , inset_ring_8
    , inset_s_auto
    , inset_s_full
    , inset_s_px
    , inset_shadow_2xs
    , inset_shadow_initial
    , inset_shadow_none
    , inset_shadow_sm
    , inset_shadow_xs
    , inset_x_auto
    , inset_x_full
    , inset_x_px
    , inset_y_auto
    , inset_y_full
    , inset_y_px
    , invert
    , invert_0
    , invert_100
    , invert_25
    , invert_50
    , invert_75
    , invisible
    , isolate
    , isolation_auto
    , italic
    , items_baseline
    , items_baseline_last
    , items_center
    , items_center_safe
    , items_end
    , items_end_safe
    , items_start
    , items_stretch
    , justify_around
    , justify_baseline
    , justify_between
    , justify_center
    , justify_center_safe
    , justify_end
    , justify_end_safe
    , justify_evenly
    , justify_items_center
    , justify_items_center_safe
    , justify_items_end
    , justify_items_end_safe
    , justify_items_normal
    , justify_items_start
    , justify_items_stretch
    , justify_normal
    , justify_self_auto
    , justify_self_center
    , justify_self_center_safe
    , justify_self_end
    , justify_self_end_safe
    , justify_self_start
    , justify_self_stretch
    , justify_start
    , justify_stretch
    , leading_loose
    , leading_none
    , leading_normal
    , leading_px
    , leading_relaxed
    , leading_snug
    , leading_tight
    , left_auto
    , left_full
    , left_px
    , line_clamp_1
    , line_clamp_2
    , line_clamp_3
    , line_clamp_4
    , line_clamp_5
    , line_clamp_6
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
    , mask_add
    , mask_alpha
    , mask_auto
    , mask_bottom
    , mask_bottom_left
    , mask_bottom_right
    , mask_center
    , mask_circle
    , mask_clip_border
    , mask_clip_content
    , mask_clip_fill
    , mask_clip_padding
    , mask_clip_stroke
    , mask_clip_view
    , mask_conic_0
    , mask_conic_1
    , mask_conic_12
    , mask_conic_180
    , mask_conic_2
    , mask_conic_3
    , mask_conic_45
    , mask_conic_6
    , mask_conic_90
    , mask_contain
    , mask_cover
    , mask_ellipse
    , mask_exclude
    , mask_intersect
    , mask_left
    , mask_linear_0
    , mask_linear_1
    , mask_linear_12
    , mask_linear_180
    , mask_linear_2
    , mask_linear_3
    , mask_linear_45
    , mask_linear_6
    , mask_linear_90
    , mask_luminance
    , mask_match
    , mask_no_clip
    , mask_no_repeat
    , mask_none
    , mask_origin_border
    , mask_origin_content
    , mask_origin_fill
    , mask_origin_padding
    , mask_origin_stroke
    , mask_origin_view
    , mask_radial_at_bottom
    , mask_radial_at_bottom_left
    , mask_radial_at_bottom_right
    , mask_radial_at_center
    , mask_radial_at_left
    , mask_radial_at_right
    , mask_radial_at_top
    , mask_radial_at_top_left
    , mask_radial_at_top_right
    , mask_radial_closest_corner
    , mask_radial_closest_side
    , mask_radial_farthest_corner
    , mask_radial_farthest_side
    , mask_repeat
    , mask_repeat_round
    , mask_repeat_space
    , mask_repeat_x
    , mask_repeat_y
    , mask_right
    , mask_subtract
    , mask_top
    , mask_top_left
    , mask_top_right
    , mask_type_alpha
    , mask_type_luminance
    , max_block_dvh
    , max_block_fit
    , max_block_full
    , max_block_lh
    , max_block_lvh
    , max_block_max
    , max_block_min
    , max_block_none
    , max_block_px
    , max_block_screen
    , max_block_svh
    , max_h_dvh
    , max_h_dvw
    , max_h_fit
    , max_h_full
    , max_h_lh
    , max_h_lvh
    , max_h_lvw
    , max_h_max
    , max_h_min
    , max_h_none
    , max_h_px
    , max_h_screen
    , max_h_svh
    , max_h_svw
    , max_inline_dvw
    , max_inline_fit
    , max_inline_full
    , max_inline_lvw
    , max_inline_max
    , max_inline_min
    , max_inline_none
    , max_inline_px
    , max_inline_screen
    , max_inline_svw
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
    , mbe_auto
    , mbe_px
    , mbs_auto
    , mbs_px
    , me_auto
    , me_px
    , min_block_auto
    , min_block_dvh
    , min_block_fit
    , min_block_full
    , min_block_lh
    , min_block_lvh
    , min_block_max
    , min_block_min
    , min_block_px
    , min_block_screen
    , min_block_svh
    , min_h_auto
    , min_h_dvh
    , min_h_dvw
    , min_h_fit
    , min_h_full
    , min_h_lh
    , min_h_lvh
    , min_h_lvw
    , min_h_max
    , min_h_min
    , min_h_px
    , min_h_screen
    , min_h_svh
    , min_h_svw
    , min_inline_auto
    , min_inline_dvw
    , min_inline_fit
    , min_inline_full
    , min_inline_lvw
    , min_inline_max
    , min_inline_min
    , min_inline_px
    , min_inline_screen
    , min_inline_svw
    , min_w_auto
    , min_w_dvh
    , min_w_dvw
    , min_w_fit
    , min_w_full
    , min_w_lvh
    , min_w_lvw
    , min_w_max
    , min_w_min
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
    , object_bottom_left
    , object_bottom_right
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
    , object_top_left
    , object_top_right
    , oldstyle_nums
    , order_1
    , order_10
    , order_11
    , order_12
    , order_2
    , order_3
    , order_4
    , order_5
    , order_6
    , order_7
    , order_8
    , order_9
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
    , outline
    , outline_0
    , outline_1
    , outline_2
    , outline_4
    , outline_8
    , outline_dashed
    , outline_dotted
    , outline_double
    , outline_hidden
    , outline_none
    , outline_offset_0
    , outline_offset_1
    , outline_offset_2
    , outline_offset_4
    , outline_offset_8
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
    , pbe_px
    , pbs_px
    , pe_px
    , perspective_distant
    , perspective_dramatic
    , perspective_midrange
    , perspective_near
    , perspective_none
    , perspective_normal
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
    , place_content_center_safe
    , place_content_end
    , place_content_end_safe
    , place_content_evenly
    , place_content_start
    , place_content_stretch
    , place_items_baseline
    , place_items_center
    , place_items_center_safe
    , place_items_end
    , place_items_end_safe
    , place_items_start
    , place_items_stretch
    , place_self_auto
    , place_self_center
    , place_self_center_safe
    , place_self_end
    , place_self_end_safe
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
    , ring
    , ring_0
    , ring_1
    , ring_2
    , ring_4
    , ring_8
    , ring_inset
    , ring_offset_0
    , ring_offset_1
    , ring_offset_2
    , ring_offset_4
    , ring_offset_8
    , rotate_0
    , rotate_1
    , rotate_12
    , rotate_180
    , rotate_2
    , rotate_3
    , rotate_45
    , rotate_6
    , rotate_90
    , rotate_none
    , rotate_x_0
    , rotate_x_1
    , rotate_x_12
    , rotate_x_180
    , rotate_x_2
    , rotate_x_3
    , rotate_x_45
    , rotate_x_6
    , rotate_x_90
    , rotate_y_0
    , rotate_y_1
    , rotate_y_12
    , rotate_y_180
    , rotate_y_2
    , rotate_y_3
    , rotate_y_45
    , rotate_y_6
    , rotate_y_90
    , rotate_z_0
    , rotate_z_1
    , rotate_z_12
    , rotate_z_180
    , rotate_z_2
    , rotate_z_3
    , rotate_z_45
    , rotate_z_6
    , rotate_z_90
    , rounded_2xl
    , rounded_3xl
    , rounded_4xl
    , rounded_b_2xl
    , rounded_b_3xl
    , rounded_b_4xl
    , rounded_b_full
    , rounded_b_lg
    , rounded_b_md
    , rounded_b_none
    , rounded_b_sm
    , rounded_b_xl
    , rounded_b_xs
    , rounded_bl_2xl
    , rounded_bl_3xl
    , rounded_bl_4xl
    , rounded_bl_full
    , rounded_bl_lg
    , rounded_bl_md
    , rounded_bl_none
    , rounded_bl_sm
    , rounded_bl_xl
    , rounded_bl_xs
    , rounded_br_2xl
    , rounded_br_3xl
    , rounded_br_4xl
    , rounded_br_full
    , rounded_br_lg
    , rounded_br_md
    , rounded_br_none
    , rounded_br_sm
    , rounded_br_xl
    , rounded_br_xs
    , rounded_e_2xl
    , rounded_e_3xl
    , rounded_e_4xl
    , rounded_e_full
    , rounded_e_lg
    , rounded_e_md
    , rounded_e_none
    , rounded_e_sm
    , rounded_e_xl
    , rounded_e_xs
    , rounded_ee_2xl
    , rounded_ee_3xl
    , rounded_ee_4xl
    , rounded_ee_full
    , rounded_ee_lg
    , rounded_ee_md
    , rounded_ee_none
    , rounded_ee_sm
    , rounded_ee_xl
    , rounded_ee_xs
    , rounded_es_2xl
    , rounded_es_3xl
    , rounded_es_4xl
    , rounded_es_full
    , rounded_es_lg
    , rounded_es_md
    , rounded_es_none
    , rounded_es_sm
    , rounded_es_xl
    , rounded_es_xs
    , rounded_full
    , rounded_l_2xl
    , rounded_l_3xl
    , rounded_l_4xl
    , rounded_l_full
    , rounded_l_lg
    , rounded_l_md
    , rounded_l_none
    , rounded_l_sm
    , rounded_l_xl
    , rounded_l_xs
    , rounded_none
    , rounded_r_2xl
    , rounded_r_3xl
    , rounded_r_4xl
    , rounded_r_full
    , rounded_r_lg
    , rounded_r_md
    , rounded_r_none
    , rounded_r_sm
    , rounded_r_xl
    , rounded_r_xs
    , rounded_s_2xl
    , rounded_s_3xl
    , rounded_s_4xl
    , rounded_s_full
    , rounded_s_lg
    , rounded_s_md
    , rounded_s_none
    , rounded_s_sm
    , rounded_s_xl
    , rounded_s_xs
    , rounded_se_2xl
    , rounded_se_3xl
    , rounded_se_4xl
    , rounded_se_full
    , rounded_se_lg
    , rounded_se_md
    , rounded_se_none
    , rounded_se_sm
    , rounded_se_xl
    , rounded_se_xs
    , rounded_ss_2xl
    , rounded_ss_3xl
    , rounded_ss_4xl
    , rounded_ss_full
    , rounded_ss_lg
    , rounded_ss_md
    , rounded_ss_none
    , rounded_ss_sm
    , rounded_ss_xl
    , rounded_ss_xs
    , rounded_t_2xl
    , rounded_t_3xl
    , rounded_t_4xl
    , rounded_t_full
    , rounded_t_lg
    , rounded_t_md
    , rounded_t_none
    , rounded_t_sm
    , rounded_t_xl
    , rounded_t_xs
    , rounded_tl_2xl
    , rounded_tl_3xl
    , rounded_tl_4xl
    , rounded_tl_full
    , rounded_tl_lg
    , rounded_tl_md
    , rounded_tl_none
    , rounded_tl_sm
    , rounded_tl_xl
    , rounded_tl_xs
    , rounded_tr_2xl
    , rounded_tr_3xl
    , rounded_tr_4xl
    , rounded_tr_full
    , rounded_tr_lg
    , rounded_tr_md
    , rounded_tr_none
    , rounded_tr_sm
    , rounded_tr_xl
    , rounded_tr_xs
    , row_auto
    , row_end_1
    , row_end_10
    , row_end_11
    , row_end_12
    , row_end_13
    , row_end_2
    , row_end_3
    , row_end_4
    , row_end_5
    , row_end_6
    , row_end_7
    , row_end_8
    , row_end_9
    , row_end_auto
    , row_span_1
    , row_span_10
    , row_span_11
    , row_span_12
    , row_span_2
    , row_span_3
    , row_span_4
    , row_span_5
    , row_span_6
    , row_span_7
    , row_span_8
    , row_span_9
    , row_span_full
    , row_start_1
    , row_start_10
    , row_start_11
    , row_start_12
    , row_start_13
    , row_start_2
    , row_start_3
    , row_start_4
    , row_start_5
    , row_start_6
    , row_start_7
    , row_start_8
    , row_start_9
    , row_start_auto
    , saturate_0
    , saturate_100
    , saturate_150
    , saturate_200
    , saturate_50
    , scale_0
    , scale_100
    , scale_105
    , scale_110
    , scale_125
    , scale_150
    , scale_200
    , scale_3d
    , scale_50
    , scale_75
    , scale_90
    , scale_95
    , scale_none
    , scale_x_0
    , scale_x_100
    , scale_x_105
    , scale_x_110
    , scale_x_125
    , scale_x_150
    , scale_x_200
    , scale_x_50
    , scale_x_75
    , scale_x_90
    , scale_x_95
    , scale_y_0
    , scale_y_100
    , scale_y_105
    , scale_y_110
    , scale_y_125
    , scale_y_150
    , scale_y_200
    , scale_y_50
    , scale_y_75
    , scale_y_90
    , scale_y_95
    , scale_z_0
    , scale_z_100
    , scale_z_105
    , scale_z_110
    , scale_z_125
    , scale_z_150
    , scale_z_200
    , scale_z_50
    , scale_z_75
    , scale_z_90
    , scale_z_95
    , scheme_dark
    , scheme_light
    , scheme_light_dark
    , scheme_normal
    , scheme_only_dark
    , scheme_only_light
    , scroll_auto
    , scroll_m_px
    , scroll_mb_px
    , scroll_mbe_px
    , scroll_mbs_px
    , scroll_me_px
    , scroll_ml_px
    , scroll_mr_px
    , scroll_ms_px
    , scroll_mt_px
    , scroll_mx_px
    , scroll_my_px
    , scroll_p_px
    , scroll_pb_px
    , scroll_pbe_px
    , scroll_pbs_px
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
    , self_baseline_last
    , self_center
    , self_center_safe
    , self_end
    , self_end_safe
    , self_start
    , self_stretch
    , sepia
    , sepia_0
    , sepia_100
    , sepia_50
    , shadow
    , shadow_2xl
    , shadow_2xs
    , shadow_initial
    , shadow_none
    , shrink
    , shrink_0
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
    , skew_0
    , skew_1
    , skew_12
    , skew_2
    , skew_3
    , skew_6
    , skew_x_0
    , skew_x_1
    , skew_x_12
    , skew_x_2
    , skew_x_3
    , skew_x_6
    , skew_y_0
    , skew_y_1
    , skew_y_12
    , skew_y_2
    , skew_y_3
    , skew_y_6
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
    , stroke_0
    , stroke_1
    , stroke_2
    , stroke_3
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
    , text_2xl
    , text_3xl
    , text_4xl
    , text_5xl
    , text_6xl
    , text_7xl
    , text_8xl
    , text_9xl
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
    , text_shadow_2xs
    , text_shadow_initial
    , text_shadow_lg
    , text_shadow_md
    , text_shadow_none
    , text_shadow_sm
    , text_shadow_xs
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
    , tracking_normal
    , tracking_tight
    , tracking_tighter
    , tracking_wide
    , tracking_wider
    , tracking_widest
    , transform
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
    , transition
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
    , underline_offset_0
    , underline_offset_1
    , underline_offset_2
    , underline_offset_4
    , underline_offset_8
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
    , wrap_anywhere
    , wrap_break_word
    , wrap_normal
    )

{-| Type-safe Tailwind CSS for Elm.

This module provides the `Tailwind` type and all utility functions.
Use `classes` to convert a list of Tailwind values to an `Html.Attribute`.


## Core

@docs Tailwind, classes, batch, raw, toClass


## Utilities

@docs p, px, py, pt, pr, pb, pl, m, mx, my, mt, mr, mb, ml, neg_m, neg_mx, neg_my, neg_mt, neg_mr, neg_mb, neg_ml, gap, gap_x, gap_y, w, w_1over2, w_1over3, w_2over3, w_1over4, w_2over4, w_3over4, w_1over5, w_2over5, w_3over5, w_4over5, w_1over6, w_2over6, w_3over6, w_4over6, w_5over6, w_1over12, w_2over12, w_3over12, w_4over12, w_5over12, w_6over12, w_7over12, w_8over12, w_9over12, w_10over12, w_11over12, w_full, w_screen, w_auto, w_min, w_max, w_fit, h, h_1over2, h_1over3, h_2over3, h_1over4, h_2over4, h_3over4, h_1over5, h_2over5, h_3over5, h_4over5, h_1over6, h_2over6, h_3over6, h_4over6, h_5over6, h_1over12, h_2over12, h_3over12, h_4over12, h_5over12, h_6over12, h_7over12, h_8over12, h_9over12, h_10over12, h_11over12, h_full, h_screen, h_auto, h_min, h_max, h_fit, min_w, max_w, min_h, max_h, text_xs, text_sm, text_base, text_lg, text_xl, text_n2xl, text_n3xl, text_n4xl, text_n5xl, text_n6xl, text_n7xl, text_n8xl, text_n9xl, font_thin, font_extralight, font_light, font_normal, font_medium, font_semibold, font_bold, font_extrabold, font_black, rounded_xs, rounded_sm, rounded_md, rounded_lg, rounded_xl, rounded_n2xl, rounded_n3xl, rounded_n4xl, shadow_n2xs, shadow_xs, shadow_sm, shadow_md, shadow_lg, shadow_xl, shadow_n2xl, shadow_inner, text_color, bg_color, border_color, ring_color, placeholder_color, text_simple, bg_simple, border_simple, opacity_0, opacity_5, opacity_10, opacity_20, opacity_25, opacity_30, opacity_40, opacity_50, opacity_60, opacity_70, opacity_75, opacity_80, opacity_90, opacity_95, opacity_100, z_0, z_10, z_20, z_30, z_40, z_50, z_auto, neg_bottom_full, neg_bottom_px, neg_end_full, neg_end_px, neg_indent_px, neg_inset_be_full, neg_inset_be_px, neg_inset_bs_full, neg_inset_bs_px, neg_inset_e_full, neg_inset_e_px, neg_inset_full, neg_inset_px, neg_inset_s_full, neg_inset_s_px, neg_inset_x_full, neg_inset_x_px, neg_inset_y_full, neg_inset_y_px, neg_left_full, neg_left_px, neg_m_px, neg_mb_px, neg_mbe_px, neg_mbs_px, neg_me_px, neg_ml_px, neg_mr_px, neg_ms_px, neg_mt_px, neg_mx_px, neg_my_px, neg_right_full, neg_right_px, neg_scroll_m_px, neg_scroll_mb_px, neg_scroll_mbe_px, neg_scroll_mbs_px, neg_scroll_me_px, neg_scroll_ml_px, neg_scroll_mr_px, neg_scroll_ms_px, neg_scroll_mt_px, neg_scroll_mx_px, neg_scroll_my_px, neg_space_x_px, neg_space_y_px, neg_start_full, neg_start_px, neg_top_full, neg_top_px, neg_translate_full, neg_translate_px, neg_translate_x_full, neg_translate_x_px, neg_translate_y_full, neg_translate_y_px, neg_translate_z_px, absolute, accent_auto, align_baseline, align_bottom, align_middle, align_sub, align_super, align_text_bottom, align_text_top, align_top, animate_bounce, animate_none, animate_ping, animate_pulse, animate_spin, antialiased, appearance_auto, appearance_none, aspect_auto, aspect_square, aspect_video, auto_cols_auto, auto_cols_fr, auto_cols_max, auto_cols_min, auto_rows_auto, auto_rows_fr, auto_rows_max, auto_rows_min, backdrop_blur_2xl, backdrop_blur_3xl, backdrop_blur_lg, backdrop_blur_md, backdrop_blur_none, backdrop_blur_sm, backdrop_blur_xl, backdrop_blur_xs, backdrop_brightness_0, backdrop_brightness_100, backdrop_brightness_105, backdrop_brightness_110, backdrop_brightness_125, backdrop_brightness_150, backdrop_brightness_200, backdrop_brightness_50, backdrop_brightness_75, backdrop_brightness_90, backdrop_brightness_95, backdrop_contrast_0, backdrop_contrast_100, backdrop_contrast_125, backdrop_contrast_150, backdrop_contrast_200, backdrop_contrast_50, backdrop_contrast_75, backdrop_grayscale, backdrop_grayscale_0, backdrop_grayscale_100, backdrop_grayscale_25, backdrop_grayscale_50, backdrop_grayscale_75, backdrop_hue_rotate_0, backdrop_hue_rotate_15, backdrop_hue_rotate_180, backdrop_hue_rotate_30, backdrop_hue_rotate_60, backdrop_hue_rotate_90, backdrop_invert, backdrop_invert_0, backdrop_invert_100, backdrop_invert_25, backdrop_invert_50, backdrop_invert_75, backdrop_saturate_0, backdrop_saturate_100, backdrop_saturate_150, backdrop_saturate_200, backdrop_saturate_50, backdrop_sepia, backdrop_sepia_0, backdrop_sepia_100, backdrop_sepia_50, backface_hidden, backface_visible, basis_auto, basis_full, basis_px, bg_auto, bg_blend_color, bg_blend_color_burn, bg_blend_color_dodge, bg_blend_darken, bg_blend_difference, bg_blend_exclusion, bg_blend_hard_light, bg_blend_hue, bg_blend_lighten, bg_blend_luminosity, bg_blend_multiply, bg_blend_normal, bg_blend_overlay, bg_blend_saturation, bg_blend_screen, bg_blend_soft_light, bg_bottom, bg_bottom_left, bg_bottom_right, bg_center, bg_clip_border, bg_clip_content, bg_clip_padding, bg_clip_text, bg_conic, bg_conic_0, bg_conic_120, bg_conic_150, bg_conic_180, bg_conic_210, bg_conic_240, bg_conic_270, bg_conic_30, bg_conic_300, bg_conic_330, bg_conic_60, bg_conic_90, bg_contain, bg_cover, bg_fixed, bg_gradient_to_b, bg_gradient_to_bl, bg_gradient_to_br, bg_gradient_to_l, bg_gradient_to_r, bg_gradient_to_t, bg_gradient_to_tl, bg_gradient_to_tr, bg_left, bg_left_bottom, bg_left_top, bg_linear_0, bg_linear_120, bg_linear_150, bg_linear_180, bg_linear_210, bg_linear_240, bg_linear_270, bg_linear_30, bg_linear_300, bg_linear_330, bg_linear_60, bg_linear_90, bg_linear_to_b, bg_linear_to_bl, bg_linear_to_br, bg_linear_to_l, bg_linear_to_r, bg_linear_to_t, bg_linear_to_tl, bg_linear_to_tr, bg_local, bg_no_repeat, bg_none, bg_origin_border, bg_origin_content, bg_origin_padding, bg_radial, bg_repeat, bg_repeat_round, bg_repeat_space, bg_repeat_x, bg_repeat_y, bg_right, bg_right_bottom, bg_right_top, bg_scroll, bg_top, bg_top_left, bg_top_right, block, block_auto, block_dvh, block_fit, block_full, block_lh, block_lvh, block_max, block_min, block_px, block_screen, block_svh, blur_2xl, blur_3xl, blur_lg, blur_md, blur_none, blur_sm, blur_xl, blur_xs, border, border_0, border_2, border_4, border_8, border_b, border_b_0, border_b_2, border_b_4, border_b_8, border_be, border_be_0, border_be_2, border_be_4, border_be_8, border_bs, border_bs_0, border_bs_2, border_bs_4, border_bs_8, border_collapse, border_dashed, border_dotted, border_double, border_e, border_e_0, border_e_2, border_e_4, border_e_8, border_hidden, border_l, border_l_0, border_l_2, border_l_4, border_l_8, border_none, border_r, border_r_0, border_r_2, border_r_4, border_r_8, border_s, border_s_0, border_s_2, border_s_4, border_s_8, border_separate, border_solid, border_spacing_px, border_spacing_x_px, border_spacing_y_px, border_t, border_t_0, border_t_2, border_t_4, border_t_8, border_x, border_x_0, border_x_2, border_x_4, border_x_8, border_y, border_y_0, border_y_2, border_y_4, border_y_8, bottom_auto, bottom_full, bottom_px, box_border, box_content, box_decoration_clone, box_decoration_slice, break_after_all, break_after_auto, break_after_avoid, break_after_avoid_page, break_after_column, break_after_left, break_after_page, break_after_right, break_all, break_before_all, break_before_auto, break_before_avoid, break_before_avoid_page, break_before_column, break_before_left, break_before_page, break_before_right, break_inside_auto, break_inside_avoid, break_inside_avoid_column, break_inside_avoid_page, break_keep, break_normal, break_words, brightness_0, brightness_100, brightness_105, brightness_110, brightness_125, brightness_150, brightness_200, brightness_50, brightness_75, brightness_90, brightness_95, capitalize, caption_bottom, caption_top, clear_both, clear_end, clear_left, clear_none, clear_right, clear_start, col_auto, col_end_1, col_end_10, col_end_11, col_end_12, col_end_13, col_end_2, col_end_3, col_end_4, col_end_5, col_end_6, col_end_7, col_end_8, col_end_9, col_end_auto, col_span_1, col_span_10, col_span_11, col_span_12, col_span_2, col_span_3, col_span_4, col_span_5, col_span_6, col_span_7, col_span_8, col_span_9, col_span_full, col_start_1, col_start_10, col_start_11, col_start_12, col_start_13, col_start_2, col_start_3, col_start_4, col_start_5, col_start_6, col_start_7, col_start_8, col_start_9, col_start_auto, collapse, columns_2xl, columns_2xs, columns_3xl, columns_3xs, columns_4xl, columns_5xl, columns_6xl, columns_7xl, columns_auto, columns_lg, columns_md, columns_sm, columns_xl, columns_xs, contain_content, contain_inline_size, contain_layout, contain_none, contain_paint, contain_size, contain_strict, contain_style, container, content_around, content_baseline, content_between, content_center, content_center_safe, content_end, content_end_safe, content_evenly, content_none, content_normal, content_start, content_stretch, contents, contrast_0, contrast_100, contrast_125, contrast_150, contrast_200, contrast_50, contrast_75, cursor_alias, cursor_all_scroll, cursor_auto, cursor_cell, cursor_col_resize, cursor_context_menu, cursor_copy, cursor_crosshair, cursor_default, cursor_e_resize, cursor_ew_resize, cursor_grab, cursor_grabbing, cursor_help, cursor_move, cursor_n_resize, cursor_ne_resize, cursor_nesw_resize, cursor_no_drop, cursor_none, cursor_not_allowed, cursor_ns_resize, cursor_nw_resize, cursor_nwse_resize, cursor_pointer, cursor_progress, cursor_row_resize, cursor_s_resize, cursor_se_resize, cursor_sw_resize, cursor_text, cursor_vertical_text, cursor_w_resize, cursor_wait, cursor_zoom_in, cursor_zoom_out, decoration_0, decoration_1, decoration_2, decoration_auto, decoration_clone, decoration_dashed, decoration_dotted, decoration_double, decoration_from_font, decoration_slice, decoration_solid, decoration_wavy, delay_100, delay_1000, delay_150, delay_200, delay_300, delay_500, delay_700, delay_75, diagonal_fractions, divide_dashed, divide_dotted, divide_double, divide_none, divide_solid, divide_x, divide_x_0, divide_x_2, divide_x_4, divide_x_8, divide_x_reverse, divide_y, divide_y_0, divide_y_2, divide_y_4, divide_y_8, divide_y_reverse, drop_shadow_2xl, drop_shadow_lg, drop_shadow_md, drop_shadow_none, drop_shadow_sm, drop_shadow_xl, drop_shadow_xs, duration_100, duration_1000, duration_150, duration_200, duration_300, duration_500, duration_700, duration_75, duration_initial, ease_in, ease_in_out, ease_initial, ease_linear, ease_out, end_auto, end_full, end_px, field_sizing_content, field_sizing_fixed, fill_none, fixed, flex, flex_1, flex_10, flex_11, flex_12, flex_2, flex_3, flex_4, flex_5, flex_6, flex_7, flex_8, flex_9, flex_auto, flex_col, flex_col_reverse, flex_initial, flex_none, flex_nowrap, flex_row, flex_row_reverse, flex_wrap, flex_wrap_reverse, float_end, float_left, float_none, float_right, float_start, flow_root, font_mono, font_sans, font_serif, font_stretch_condensed, font_stretch_expanded, font_stretch_extra_condensed, font_stretch_extra_expanded, font_stretch_normal, font_stretch_semi_condensed, font_stretch_semi_expanded, font_stretch_ultra_condensed, font_stretch_ultra_expanded, forced_color_adjust_auto, forced_color_adjust_none, gap_px, gap_x_px, gap_y_px, grayscale, grayscale_0, grayscale_100, grayscale_25, grayscale_50, grayscale_75, grid, grid_cols_1, grid_cols_10, grid_cols_11, grid_cols_12, grid_cols_2, grid_cols_3, grid_cols_4, grid_cols_5, grid_cols_6, grid_cols_7, grid_cols_8, grid_cols_9, grid_cols_none, grid_cols_subgrid, grid_flow_col, grid_flow_col_dense, grid_flow_dense, grid_flow_row, grid_flow_row_dense, grid_rows_1, grid_rows_10, grid_rows_11, grid_rows_12, grid_rows_2, grid_rows_3, grid_rows_4, grid_rows_5, grid_rows_6, grid_rows_7, grid_rows_8, grid_rows_9, grid_rows_none, grid_rows_subgrid, grow, grow_0, h_dvh, h_dvw, h_lh, h_lvh, h_lvw, h_px, h_svh, h_svw, hidden, hue_rotate_0, hue_rotate_15, hue_rotate_180, hue_rotate_30, hue_rotate_60, hue_rotate_90, hyphens_auto, hyphens_manual, hyphens_none, indent_px, inline, inline_auto, inline_block, inline_dvw, inline_fit, inline_flex, inline_full, inline_grid, inline_lvw, inline_max, inline_min, inline_px, inline_screen, inline_svw, inline_table, inset_auto, inset_be_auto, inset_be_full, inset_be_px, inset_bs_auto, inset_bs_full, inset_bs_px, inset_e_auto, inset_e_full, inset_e_px, inset_full, inset_px, inset_ring, inset_ring_0, inset_ring_1, inset_ring_2, inset_ring_4, inset_ring_8, inset_s_auto, inset_s_full, inset_s_px, inset_shadow_2xs, inset_shadow_initial, inset_shadow_none, inset_shadow_sm, inset_shadow_xs, inset_x_auto, inset_x_full, inset_x_px, inset_y_auto, inset_y_full, inset_y_px, invert, invert_0, invert_100, invert_25, invert_50, invert_75, invisible, isolate, isolation_auto, italic, items_baseline, items_baseline_last, items_center, items_center_safe, items_end, items_end_safe, items_start, items_stretch, justify_around, justify_baseline, justify_between, justify_center, justify_center_safe, justify_end, justify_end_safe, justify_evenly, justify_items_center, justify_items_center_safe, justify_items_end, justify_items_end_safe, justify_items_normal, justify_items_start, justify_items_stretch, justify_normal, justify_self_auto, justify_self_center, justify_self_center_safe, justify_self_end, justify_self_end_safe, justify_self_start, justify_self_stretch, justify_start, justify_stretch, leading_loose, leading_none, leading_normal, leading_px, leading_relaxed, leading_snug, leading_tight, left_auto, left_full, left_px, line_clamp_1, line_clamp_2, line_clamp_3, line_clamp_4, line_clamp_5, line_clamp_6, line_clamp_none, line_through, lining_nums, list_decimal, list_disc, list_image_none, list_inside, list_item, list_none, list_outside, lowercase, m_auto, m_px, mask_add, mask_alpha, mask_auto, mask_bottom, mask_bottom_left, mask_bottom_right, mask_center, mask_circle, mask_clip_border, mask_clip_content, mask_clip_fill, mask_clip_padding, mask_clip_stroke, mask_clip_view, mask_conic_0, mask_conic_1, mask_conic_12, mask_conic_180, mask_conic_2, mask_conic_3, mask_conic_45, mask_conic_6, mask_conic_90, mask_contain, mask_cover, mask_ellipse, mask_exclude, mask_intersect, mask_left, mask_linear_0, mask_linear_1, mask_linear_12, mask_linear_180, mask_linear_2, mask_linear_3, mask_linear_45, mask_linear_6, mask_linear_90, mask_luminance, mask_match, mask_no_clip, mask_no_repeat, mask_none, mask_origin_border, mask_origin_content, mask_origin_fill, mask_origin_padding, mask_origin_stroke, mask_origin_view, mask_radial_at_bottom, mask_radial_at_bottom_left, mask_radial_at_bottom_right, mask_radial_at_center, mask_radial_at_left, mask_radial_at_right, mask_radial_at_top, mask_radial_at_top_left, mask_radial_at_top_right, mask_radial_closest_corner, mask_radial_closest_side, mask_radial_farthest_corner, mask_radial_farthest_side, mask_repeat, mask_repeat_round, mask_repeat_space, mask_repeat_x, mask_repeat_y, mask_right, mask_subtract, mask_top, mask_top_left, mask_top_right, mask_type_alpha, mask_type_luminance, max_block_dvh, max_block_fit, max_block_full, max_block_lh, max_block_lvh, max_block_max, max_block_min, max_block_none, max_block_px, max_block_screen, max_block_svh, max_h_dvh, max_h_dvw, max_h_fit, max_h_full, max_h_lh, max_h_lvh, max_h_lvw, max_h_max, max_h_min, max_h_none, max_h_px, max_h_screen, max_h_svh, max_h_svw, max_inline_dvw, max_inline_fit, max_inline_full, max_inline_lvw, max_inline_max, max_inline_min, max_inline_none, max_inline_px, max_inline_screen, max_inline_svw, max_w_dvh, max_w_dvw, max_w_fit, max_w_full, max_w_lvh, max_w_lvw, max_w_max, max_w_min, max_w_none, max_w_px, max_w_screen, max_w_svh, max_w_svw, mb_auto, mb_px, mbe_auto, mbe_px, mbs_auto, mbs_px, me_auto, me_px, min_block_auto, min_block_dvh, min_block_fit, min_block_full, min_block_lh, min_block_lvh, min_block_max, min_block_min, min_block_px, min_block_screen, min_block_svh, min_h_auto, min_h_dvh, min_h_dvw, min_h_fit, min_h_full, min_h_lh, min_h_lvh, min_h_lvw, min_h_max, min_h_min, min_h_px, min_h_screen, min_h_svh, min_h_svw, min_inline_auto, min_inline_dvw, min_inline_fit, min_inline_full, min_inline_lvw, min_inline_max, min_inline_min, min_inline_px, min_inline_screen, min_inline_svw, min_w_auto, min_w_dvh, min_w_dvw, min_w_fit, min_w_full, min_w_lvh, min_w_lvw, min_w_max, min_w_min, min_w_px, min_w_screen, min_w_svh, min_w_svw, mix_blend_color, mix_blend_color_burn, mix_blend_color_dodge, mix_blend_darken, mix_blend_difference, mix_blend_exclusion, mix_blend_hard_light, mix_blend_hue, mix_blend_lighten, mix_blend_luminosity, mix_blend_multiply, mix_blend_normal, mix_blend_overlay, mix_blend_plus_darker, mix_blend_plus_lighter, mix_blend_saturation, mix_blend_screen, mix_blend_soft_light, ml_auto, ml_px, mr_auto, mr_px, ms_auto, ms_px, mt_auto, mt_px, mx_auto, mx_px, my_auto, my_px, no_underline, normal_case, normal_nums, not_italic, not_sr_only, object_bottom, object_bottom_left, object_bottom_right, object_center, object_contain, object_cover, object_fill, object_left, object_left_bottom, object_left_top, object_none, object_right, object_right_bottom, object_right_top, object_scale_down, object_top, object_top_left, object_top_right, oldstyle_nums, order_1, order_10, order_11, order_12, order_2, order_3, order_4, order_5, order_6, order_7, order_8, order_9, order_first, order_last, order_none, ordinal, origin_bottom, origin_bottom_left, origin_bottom_right, origin_center, origin_left, origin_right, origin_top, origin_top_left, origin_top_right, outline, outline_0, outline_1, outline_2, outline_4, outline_8, outline_dashed, outline_dotted, outline_double, outline_hidden, outline_none, outline_offset_0, outline_offset_1, outline_offset_2, outline_offset_4, outline_offset_8, outline_solid, overflow_auto, overflow_clip, overflow_ellipsis, overflow_hidden, overflow_scroll, overflow_visible, overflow_x_auto, overflow_x_clip, overflow_x_hidden, overflow_x_scroll, overflow_x_visible, overflow_y_auto, overflow_y_clip, overflow_y_hidden, overflow_y_scroll, overflow_y_visible, overline, overscroll_auto, overscroll_contain, overscroll_none, overscroll_x_auto, overscroll_x_contain, overscroll_x_none, overscroll_y_auto, overscroll_y_contain, overscroll_y_none, p_px, pb_px, pbe_px, pbs_px, pe_px, perspective_distant, perspective_dramatic, perspective_midrange, perspective_near, perspective_none, perspective_normal, perspective_origin_bottom, perspective_origin_bottom_left, perspective_origin_bottom_right, perspective_origin_center, perspective_origin_left, perspective_origin_right, perspective_origin_top, perspective_origin_top_left, perspective_origin_top_right, pl_px, place_content_around, place_content_baseline, place_content_between, place_content_center, place_content_center_safe, place_content_end, place_content_end_safe, place_content_evenly, place_content_start, place_content_stretch, place_items_baseline, place_items_center, place_items_center_safe, place_items_end, place_items_end_safe, place_items_start, place_items_stretch, place_self_auto, place_self_center, place_self_center_safe, place_self_end, place_self_end_safe, place_self_start, place_self_stretch, pointer_events_auto, pointer_events_none, pr_px, proportional_nums, ps_px, pt_px, px_px, py_px, relative, resize, resize_none, resize_x, resize_y, right_auto, right_full, right_px, ring, ring_0, ring_1, ring_2, ring_4, ring_8, ring_inset, ring_offset_0, ring_offset_1, ring_offset_2, ring_offset_4, ring_offset_8, rotate_0, rotate_1, rotate_12, rotate_180, rotate_2, rotate_3, rotate_45, rotate_6, rotate_90, rotate_none, rotate_x_0, rotate_x_1, rotate_x_12, rotate_x_180, rotate_x_2, rotate_x_3, rotate_x_45, rotate_x_6, rotate_x_90, rotate_y_0, rotate_y_1, rotate_y_12, rotate_y_180, rotate_y_2, rotate_y_3, rotate_y_45, rotate_y_6, rotate_y_90, rotate_z_0, rotate_z_1, rotate_z_12, rotate_z_180, rotate_z_2, rotate_z_3, rotate_z_45, rotate_z_6, rotate_z_90, rounded_2xl, rounded_3xl, rounded_4xl, rounded_b_2xl, rounded_b_3xl, rounded_b_4xl, rounded_b_full, rounded_b_lg, rounded_b_md, rounded_b_none, rounded_b_sm, rounded_b_xl, rounded_b_xs, rounded_bl_2xl, rounded_bl_3xl, rounded_bl_4xl, rounded_bl_full, rounded_bl_lg, rounded_bl_md, rounded_bl_none, rounded_bl_sm, rounded_bl_xl, rounded_bl_xs, rounded_br_2xl, rounded_br_3xl, rounded_br_4xl, rounded_br_full, rounded_br_lg, rounded_br_md, rounded_br_none, rounded_br_sm, rounded_br_xl, rounded_br_xs, rounded_e_2xl, rounded_e_3xl, rounded_e_4xl, rounded_e_full, rounded_e_lg, rounded_e_md, rounded_e_none, rounded_e_sm, rounded_e_xl, rounded_e_xs, rounded_ee_2xl, rounded_ee_3xl, rounded_ee_4xl, rounded_ee_full, rounded_ee_lg, rounded_ee_md, rounded_ee_none, rounded_ee_sm, rounded_ee_xl, rounded_ee_xs, rounded_es_2xl, rounded_es_3xl, rounded_es_4xl, rounded_es_full, rounded_es_lg, rounded_es_md, rounded_es_none, rounded_es_sm, rounded_es_xl, rounded_es_xs, rounded_full, rounded_l_2xl, rounded_l_3xl, rounded_l_4xl, rounded_l_full, rounded_l_lg, rounded_l_md, rounded_l_none, rounded_l_sm, rounded_l_xl, rounded_l_xs, rounded_none, rounded_r_2xl, rounded_r_3xl, rounded_r_4xl, rounded_r_full, rounded_r_lg, rounded_r_md, rounded_r_none, rounded_r_sm, rounded_r_xl, rounded_r_xs, rounded_s_2xl, rounded_s_3xl, rounded_s_4xl, rounded_s_full, rounded_s_lg, rounded_s_md, rounded_s_none, rounded_s_sm, rounded_s_xl, rounded_s_xs, rounded_se_2xl, rounded_se_3xl, rounded_se_4xl, rounded_se_full, rounded_se_lg, rounded_se_md, rounded_se_none, rounded_se_sm, rounded_se_xl, rounded_se_xs, rounded_ss_2xl, rounded_ss_3xl, rounded_ss_4xl, rounded_ss_full, rounded_ss_lg, rounded_ss_md, rounded_ss_none, rounded_ss_sm, rounded_ss_xl, rounded_ss_xs, rounded_t_2xl, rounded_t_3xl, rounded_t_4xl, rounded_t_full, rounded_t_lg, rounded_t_md, rounded_t_none, rounded_t_sm, rounded_t_xl, rounded_t_xs, rounded_tl_2xl, rounded_tl_3xl, rounded_tl_4xl, rounded_tl_full, rounded_tl_lg, rounded_tl_md, rounded_tl_none, rounded_tl_sm, rounded_tl_xl, rounded_tl_xs, rounded_tr_2xl, rounded_tr_3xl, rounded_tr_4xl, rounded_tr_full, rounded_tr_lg, rounded_tr_md, rounded_tr_none, rounded_tr_sm, rounded_tr_xl, rounded_tr_xs, row_auto, row_end_1, row_end_10, row_end_11, row_end_12, row_end_13, row_end_2, row_end_3, row_end_4, row_end_5, row_end_6, row_end_7, row_end_8, row_end_9, row_end_auto, row_span_1, row_span_10, row_span_11, row_span_12, row_span_2, row_span_3, row_span_4, row_span_5, row_span_6, row_span_7, row_span_8, row_span_9, row_span_full, row_start_1, row_start_10, row_start_11, row_start_12, row_start_13, row_start_2, row_start_3, row_start_4, row_start_5, row_start_6, row_start_7, row_start_8, row_start_9, row_start_auto, saturate_0, saturate_100, saturate_150, saturate_200, saturate_50, scale_0, scale_100, scale_105, scale_110, scale_125, scale_150, scale_200, scale_3d, scale_50, scale_75, scale_90, scale_95, scale_none, scale_x_0, scale_x_100, scale_x_105, scale_x_110, scale_x_125, scale_x_150, scale_x_200, scale_x_50, scale_x_75, scale_x_90, scale_x_95, scale_y_0, scale_y_100, scale_y_105, scale_y_110, scale_y_125, scale_y_150, scale_y_200, scale_y_50, scale_y_75, scale_y_90, scale_y_95, scale_z_0, scale_z_100, scale_z_105, scale_z_110, scale_z_125, scale_z_150, scale_z_200, scale_z_50, scale_z_75, scale_z_90, scale_z_95, scheme_dark, scheme_light, scheme_light_dark, scheme_normal, scheme_only_dark, scheme_only_light, scroll_auto, scroll_m_px, scroll_mb_px, scroll_mbe_px, scroll_mbs_px, scroll_me_px, scroll_ml_px, scroll_mr_px, scroll_ms_px, scroll_mt_px, scroll_mx_px, scroll_my_px, scroll_p_px, scroll_pb_px, scroll_pbe_px, scroll_pbs_px, scroll_pe_px, scroll_pl_px, scroll_pr_px, scroll_ps_px, scroll_pt_px, scroll_px_px, scroll_py_px, scroll_smooth, select_all, select_auto, select_none, select_text, self_auto, self_baseline, self_baseline_last, self_center, self_center_safe, self_end, self_end_safe, self_start, self_stretch, sepia, sepia_0, sepia_100, sepia_50, shadow, shadow_2xl, shadow_2xs, shadow_initial, shadow_none, shrink, shrink_0, size_auto, size_dvh, size_dvw, size_fit, size_full, size_lvh, size_lvw, size_max, size_min, size_px, size_svh, size_svw, skew_0, skew_1, skew_12, skew_2, skew_3, skew_6, skew_x_0, skew_x_1, skew_x_12, skew_x_2, skew_x_3, skew_x_6, skew_y_0, skew_y_1, skew_y_12, skew_y_2, skew_y_3, skew_y_6, slashed_zero, snap_align_none, snap_always, snap_both, snap_center, snap_end, snap_mandatory, snap_none, snap_normal, snap_proximity, snap_start, snap_x, snap_y, space_x_px, space_x_reverse, space_y_px, space_y_reverse, sr_only, stacked_fractions, start_auto, start_full, start_px, static, sticky, stroke_0, stroke_1, stroke_2, stroke_3, stroke_none, subpixel_antialiased, table, table_auto, table_caption, table_cell, table_column, table_column_group, table_fixed, table_footer_group, table_header_group, table_row, table_row_group, tabular_nums, text_2xl, text_3xl, text_4xl, text_5xl, text_6xl, text_7xl, text_8xl, text_9xl, text_balance, text_center, text_clip, text_ellipsis, text_end, text_justify, text_left, text_nowrap, text_pretty, text_right, text_shadow_2xs, text_shadow_initial, text_shadow_lg, text_shadow_md, text_shadow_none, text_shadow_sm, text_shadow_xs, text_start, text_wrap, top_auto, top_full, top_px, touch_auto, touch_manipulation, touch_none, touch_pan_down, touch_pan_left, touch_pan_right, touch_pan_up, touch_pan_x, touch_pan_y, touch_pinch_zoom, tracking_normal, tracking_tight, tracking_tighter, tracking_wide, tracking_wider, tracking_widest, transform, transform_3d, transform_border, transform_content, transform_cpu, transform_fill, transform_flat, transform_gpu, transform_none, transform_stroke, transform_view, transition, transition_all, transition_colors, transition_discrete, transition_none, transition_normal, transition_opacity, transition_shadow, transition_transform, translate_3d, translate_full, translate_none, translate_px, translate_x_full, translate_x_px, translate_y_full, translate_y_px, translate_z_px, truncate, underline, underline_offset_0, underline_offset_1, underline_offset_2, underline_offset_4, underline_offset_8, underline_offset_auto, uppercase, via_none, visible, w_dvh, w_dvw, w_lvh, w_lvw, w_px, w_svh, w_svw, whitespace_break_spaces, whitespace_normal, whitespace_nowrap, whitespace_pre, whitespace_pre_line, whitespace_pre_wrap, will_change_auto, will_change_contents, will_change_scroll, will_change_transform, wrap_anywhere, wrap_break_word, wrap_normal

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

    raw "[scroll-snap-type:x_mandatory]"  -- Tailwind arbitrary value syntax

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
{-| -}
toClassName : Tailwind -> String
toClassName (Tailwind className) =
    className


-- SPACING (parameterized)

{-| -}
p : Spacing -> Tailwind
p spacing =
    Tailwind ("p-" ++ spacingToString spacing)


{-| -}
px : Spacing -> Tailwind
px spacing =
    Tailwind ("px-" ++ spacingToString spacing)


{-| -}
py : Spacing -> Tailwind
py spacing =
    Tailwind ("py-" ++ spacingToString spacing)


{-| -}
pt : Spacing -> Tailwind
pt spacing =
    Tailwind ("pt-" ++ spacingToString spacing)


{-| -}
pr : Spacing -> Tailwind
pr spacing =
    Tailwind ("pr-" ++ spacingToString spacing)


{-| -}
pb : Spacing -> Tailwind
pb spacing =
    Tailwind ("pb-" ++ spacingToString spacing)


{-| -}
pl : Spacing -> Tailwind
pl spacing =
    Tailwind ("pl-" ++ spacingToString spacing)


{-| -}
m : Spacing -> Tailwind
m spacing =
    Tailwind ("m-" ++ spacingToString spacing)


{-| -}
mx : Spacing -> Tailwind
mx spacing =
    Tailwind ("mx-" ++ spacingToString spacing)


{-| -}
my : Spacing -> Tailwind
my spacing =
    Tailwind ("my-" ++ spacingToString spacing)


{-| -}
mt : Spacing -> Tailwind
mt spacing =
    Tailwind ("mt-" ++ spacingToString spacing)


{-| -}
mr : Spacing -> Tailwind
mr spacing =
    Tailwind ("mr-" ++ spacingToString spacing)


{-| -}
mb : Spacing -> Tailwind
mb spacing =
    Tailwind ("mb-" ++ spacingToString spacing)


{-| -}
ml : Spacing -> Tailwind
ml spacing =
    Tailwind ("ml-" ++ spacingToString spacing)


{-| -}
neg_m : Spacing -> Tailwind
neg_m spacing =
    Tailwind ("-m-" ++ spacingToString spacing)


{-| -}
neg_mx : Spacing -> Tailwind
neg_mx spacing =
    Tailwind ("-mx-" ++ spacingToString spacing)


{-| -}
neg_my : Spacing -> Tailwind
neg_my spacing =
    Tailwind ("-my-" ++ spacingToString spacing)


{-| -}
neg_mt : Spacing -> Tailwind
neg_mt spacing =
    Tailwind ("-mt-" ++ spacingToString spacing)


{-| -}
neg_mr : Spacing -> Tailwind
neg_mr spacing =
    Tailwind ("-mr-" ++ spacingToString spacing)


{-| -}
neg_mb : Spacing -> Tailwind
neg_mb spacing =
    Tailwind ("-mb-" ++ spacingToString spacing)


{-| -}
neg_ml : Spacing -> Tailwind
neg_ml spacing =
    Tailwind ("-ml-" ++ spacingToString spacing)


{-| -}
gap : Spacing -> Tailwind
gap spacing =
    Tailwind ("gap-" ++ spacingToString spacing)


{-| -}
gap_x : Spacing -> Tailwind
gap_x spacing =
    Tailwind ("gap-x-" ++ spacingToString spacing)


{-| -}
gap_y : Spacing -> Tailwind
gap_y spacing =
    Tailwind ("gap-y-" ++ spacingToString spacing)


-- SIZING

{-| -}
w : Spacing -> Tailwind
w spacing =
    Tailwind ("w-" ++ spacingToString spacing)


{-| -}
w_1over2 : Tailwind
w_1over2 =
    Tailwind "w-1/2"

{-| -}
w_1over3 : Tailwind
w_1over3 =
    Tailwind "w-1/3"

{-| -}
w_2over3 : Tailwind
w_2over3 =
    Tailwind "w-2/3"

{-| -}
w_1over4 : Tailwind
w_1over4 =
    Tailwind "w-1/4"

{-| -}
w_2over4 : Tailwind
w_2over4 =
    Tailwind "w-2/4"

{-| -}
w_3over4 : Tailwind
w_3over4 =
    Tailwind "w-3/4"

{-| -}
w_1over5 : Tailwind
w_1over5 =
    Tailwind "w-1/5"

{-| -}
w_2over5 : Tailwind
w_2over5 =
    Tailwind "w-2/5"

{-| -}
w_3over5 : Tailwind
w_3over5 =
    Tailwind "w-3/5"

{-| -}
w_4over5 : Tailwind
w_4over5 =
    Tailwind "w-4/5"

{-| -}
w_1over6 : Tailwind
w_1over6 =
    Tailwind "w-1/6"

{-| -}
w_2over6 : Tailwind
w_2over6 =
    Tailwind "w-2/6"

{-| -}
w_3over6 : Tailwind
w_3over6 =
    Tailwind "w-3/6"

{-| -}
w_4over6 : Tailwind
w_4over6 =
    Tailwind "w-4/6"

{-| -}
w_5over6 : Tailwind
w_5over6 =
    Tailwind "w-5/6"

{-| -}
w_1over12 : Tailwind
w_1over12 =
    Tailwind "w-1/12"

{-| -}
w_2over12 : Tailwind
w_2over12 =
    Tailwind "w-2/12"

{-| -}
w_3over12 : Tailwind
w_3over12 =
    Tailwind "w-3/12"

{-| -}
w_4over12 : Tailwind
w_4over12 =
    Tailwind "w-4/12"

{-| -}
w_5over12 : Tailwind
w_5over12 =
    Tailwind "w-5/12"

{-| -}
w_6over12 : Tailwind
w_6over12 =
    Tailwind "w-6/12"

{-| -}
w_7over12 : Tailwind
w_7over12 =
    Tailwind "w-7/12"

{-| -}
w_8over12 : Tailwind
w_8over12 =
    Tailwind "w-8/12"

{-| -}
w_9over12 : Tailwind
w_9over12 =
    Tailwind "w-9/12"

{-| -}
w_10over12 : Tailwind
w_10over12 =
    Tailwind "w-10/12"

{-| -}
w_11over12 : Tailwind
w_11over12 =
    Tailwind "w-11/12"


{-| -}
w_full : Tailwind
w_full =
    Tailwind "w-full"


{-| -}
w_screen : Tailwind
w_screen =
    Tailwind "w-screen"


{-| -}
w_auto : Tailwind
w_auto =
    Tailwind "w-auto"


{-| -}
w_min : Tailwind
w_min =
    Tailwind "w-min"


{-| -}
w_max : Tailwind
w_max =
    Tailwind "w-max"


{-| -}
w_fit : Tailwind
w_fit =
    Tailwind "w-fit"


{-| -}
h : Spacing -> Tailwind
h spacing =
    Tailwind ("h-" ++ spacingToString spacing)


{-| -}
h_1over2 : Tailwind
h_1over2 =
    Tailwind "h-1/2"

{-| -}
h_1over3 : Tailwind
h_1over3 =
    Tailwind "h-1/3"

{-| -}
h_2over3 : Tailwind
h_2over3 =
    Tailwind "h-2/3"

{-| -}
h_1over4 : Tailwind
h_1over4 =
    Tailwind "h-1/4"

{-| -}
h_2over4 : Tailwind
h_2over4 =
    Tailwind "h-2/4"

{-| -}
h_3over4 : Tailwind
h_3over4 =
    Tailwind "h-3/4"

{-| -}
h_1over5 : Tailwind
h_1over5 =
    Tailwind "h-1/5"

{-| -}
h_2over5 : Tailwind
h_2over5 =
    Tailwind "h-2/5"

{-| -}
h_3over5 : Tailwind
h_3over5 =
    Tailwind "h-3/5"

{-| -}
h_4over5 : Tailwind
h_4over5 =
    Tailwind "h-4/5"

{-| -}
h_1over6 : Tailwind
h_1over6 =
    Tailwind "h-1/6"

{-| -}
h_2over6 : Tailwind
h_2over6 =
    Tailwind "h-2/6"

{-| -}
h_3over6 : Tailwind
h_3over6 =
    Tailwind "h-3/6"

{-| -}
h_4over6 : Tailwind
h_4over6 =
    Tailwind "h-4/6"

{-| -}
h_5over6 : Tailwind
h_5over6 =
    Tailwind "h-5/6"

{-| -}
h_1over12 : Tailwind
h_1over12 =
    Tailwind "h-1/12"

{-| -}
h_2over12 : Tailwind
h_2over12 =
    Tailwind "h-2/12"

{-| -}
h_3over12 : Tailwind
h_3over12 =
    Tailwind "h-3/12"

{-| -}
h_4over12 : Tailwind
h_4over12 =
    Tailwind "h-4/12"

{-| -}
h_5over12 : Tailwind
h_5over12 =
    Tailwind "h-5/12"

{-| -}
h_6over12 : Tailwind
h_6over12 =
    Tailwind "h-6/12"

{-| -}
h_7over12 : Tailwind
h_7over12 =
    Tailwind "h-7/12"

{-| -}
h_8over12 : Tailwind
h_8over12 =
    Tailwind "h-8/12"

{-| -}
h_9over12 : Tailwind
h_9over12 =
    Tailwind "h-9/12"

{-| -}
h_10over12 : Tailwind
h_10over12 =
    Tailwind "h-10/12"

{-| -}
h_11over12 : Tailwind
h_11over12 =
    Tailwind "h-11/12"


{-| -}
h_full : Tailwind
h_full =
    Tailwind "h-full"


{-| -}
h_screen : Tailwind
h_screen =
    Tailwind "h-screen"


{-| -}
h_auto : Tailwind
h_auto =
    Tailwind "h-auto"


{-| -}
h_min : Tailwind
h_min =
    Tailwind "h-min"


{-| -}
h_max : Tailwind
h_max =
    Tailwind "h-max"


{-| -}
h_fit : Tailwind
h_fit =
    Tailwind "h-fit"


{-| -}
min_w : Spacing -> Tailwind
min_w spacing =
    Tailwind ("min-w-" ++ spacingToString spacing)


{-| -}
max_w : Spacing -> Tailwind
max_w spacing =
    Tailwind ("max-w-" ++ spacingToString spacing)


{-| -}
min_h : Spacing -> Tailwind
min_h spacing =
    Tailwind ("min-h-" ++ spacingToString spacing)


{-| -}
max_h : Spacing -> Tailwind
max_h spacing =
    Tailwind ("max-h-" ++ spacingToString spacing)


-- FONT SIZE

{-| -}
text_xs : Tailwind
text_xs =
    Tailwind "text-xs"

{-| -}
text_sm : Tailwind
text_sm =
    Tailwind "text-sm"

{-| -}
text_base : Tailwind
text_base =
    Tailwind "text-base"

{-| -}
text_lg : Tailwind
text_lg =
    Tailwind "text-lg"

{-| -}
text_xl : Tailwind
text_xl =
    Tailwind "text-xl"

{-| -}
text_n2xl : Tailwind
text_n2xl =
    Tailwind "text-2xl"

{-| -}
text_n3xl : Tailwind
text_n3xl =
    Tailwind "text-3xl"

{-| -}
text_n4xl : Tailwind
text_n4xl =
    Tailwind "text-4xl"

{-| -}
text_n5xl : Tailwind
text_n5xl =
    Tailwind "text-5xl"

{-| -}
text_n6xl : Tailwind
text_n6xl =
    Tailwind "text-6xl"

{-| -}
text_n7xl : Tailwind
text_n7xl =
    Tailwind "text-7xl"

{-| -}
text_n8xl : Tailwind
text_n8xl =
    Tailwind "text-8xl"

{-| -}
text_n9xl : Tailwind
text_n9xl =
    Tailwind "text-9xl"


-- FONT WEIGHT

{-| -}
font_thin : Tailwind
font_thin =
    Tailwind "font-thin"

{-| -}
font_extralight : Tailwind
font_extralight =
    Tailwind "font-extralight"

{-| -}
font_light : Tailwind
font_light =
    Tailwind "font-light"

{-| -}
font_normal : Tailwind
font_normal =
    Tailwind "font-normal"

{-| -}
font_medium : Tailwind
font_medium =
    Tailwind "font-medium"

{-| -}
font_semibold : Tailwind
font_semibold =
    Tailwind "font-semibold"

{-| -}
font_bold : Tailwind
font_bold =
    Tailwind "font-bold"

{-| -}
font_extrabold : Tailwind
font_extrabold =
    Tailwind "font-extrabold"

{-| -}
font_black : Tailwind
font_black =
    Tailwind "font-black"


-- BORDER RADIUS (from theme)

{-| -}
rounded_xs : Tailwind
rounded_xs =
    Tailwind "rounded-xs"

{-| -}
rounded_sm : Tailwind
rounded_sm =
    Tailwind "rounded-sm"

{-| -}
rounded_md : Tailwind
rounded_md =
    Tailwind "rounded-md"

{-| -}
rounded_lg : Tailwind
rounded_lg =
    Tailwind "rounded-lg"

{-| -}
rounded_xl : Tailwind
rounded_xl =
    Tailwind "rounded-xl"

{-| -}
rounded_n2xl : Tailwind
rounded_n2xl =
    Tailwind "rounded-2xl"

{-| -}
rounded_n3xl : Tailwind
rounded_n3xl =
    Tailwind "rounded-3xl"

{-| -}
rounded_n4xl : Tailwind
rounded_n4xl =
    Tailwind "rounded-4xl"


-- SHADOW SIZES (from theme)

{-| -}
shadow_n2xs : Tailwind
shadow_n2xs =
    Tailwind "shadow-2xs"

{-| -}
shadow_xs : Tailwind
shadow_xs =
    Tailwind "shadow-xs"

{-| -}
shadow_sm : Tailwind
shadow_sm =
    Tailwind "shadow-sm"

{-| -}
shadow_md : Tailwind
shadow_md =
    Tailwind "shadow-md"

{-| -}
shadow_lg : Tailwind
shadow_lg =
    Tailwind "shadow-lg"

{-| -}
shadow_xl : Tailwind
shadow_xl =
    Tailwind "shadow-xl"

{-| -}
shadow_n2xl : Tailwind
shadow_n2xl =
    Tailwind "shadow-2xl"

{-| -}
shadow_inner : Tailwind
shadow_inner =
    Tailwind "shadow-inner"


-- COLOR UTILITIES

{-| -}
text_color : Color -> Tailwind
text_color color =
    Tailwind ("text-" ++ colorToString color)


{-| -}
bg_color : Color -> Tailwind
bg_color color =
    Tailwind ("bg-" ++ colorToString color)


{-| -}
border_color : Color -> Tailwind
border_color color =
    Tailwind ("border-" ++ colorToString color)


{-| -}
ring_color : Color -> Tailwind
ring_color color =
    Tailwind ("ring-" ++ colorToString color)


{-| -}
placeholder_color : Color -> Tailwind
placeholder_color color =
    Tailwind ("placeholder-" ++ colorToString color)


{-| -}
text_simple : SimpleColor -> Tailwind
text_simple (SimpleColor c) =
    Tailwind ("text-" ++ c)


{-| -}
bg_simple : SimpleColor -> Tailwind
bg_simple (SimpleColor c) =
    Tailwind ("bg-" ++ c)


{-| -}
border_simple : SimpleColor -> Tailwind
border_simple (SimpleColor c) =
    Tailwind ("border-" ++ c)


-- OPACITY

{-| -}
opacity_0 : Tailwind
opacity_0 =
    Tailwind "opacity-0"


{-| -}
opacity_5 : Tailwind
opacity_5 =
    Tailwind "opacity-5"


{-| -}
opacity_10 : Tailwind
opacity_10 =
    Tailwind "opacity-10"


{-| -}
opacity_20 : Tailwind
opacity_20 =
    Tailwind "opacity-20"


{-| -}
opacity_25 : Tailwind
opacity_25 =
    Tailwind "opacity-25"


{-| -}
opacity_30 : Tailwind
opacity_30 =
    Tailwind "opacity-30"


{-| -}
opacity_40 : Tailwind
opacity_40 =
    Tailwind "opacity-40"


{-| -}
opacity_50 : Tailwind
opacity_50 =
    Tailwind "opacity-50"


{-| -}
opacity_60 : Tailwind
opacity_60 =
    Tailwind "opacity-60"


{-| -}
opacity_70 : Tailwind
opacity_70 =
    Tailwind "opacity-70"


{-| -}
opacity_75 : Tailwind
opacity_75 =
    Tailwind "opacity-75"


{-| -}
opacity_80 : Tailwind
opacity_80 =
    Tailwind "opacity-80"


{-| -}
opacity_90 : Tailwind
opacity_90 =
    Tailwind "opacity-90"


{-| -}
opacity_95 : Tailwind
opacity_95 =
    Tailwind "opacity-95"


{-| -}
opacity_100 : Tailwind
opacity_100 =
    Tailwind "opacity-100"


-- Z-INDEX

{-| -}
z_0 : Tailwind
z_0 =
    Tailwind "z-0"


{-| -}
z_10 : Tailwind
z_10 =
    Tailwind "z-10"


{-| -}
z_20 : Tailwind
z_20 =
    Tailwind "z-20"


{-| -}
z_30 : Tailwind
z_30 =
    Tailwind "z-30"


{-| -}
z_40 : Tailwind
z_40 =
    Tailwind "z-40"


{-| -}
z_50 : Tailwind
z_50 =
    Tailwind "z-50"


{-| -}
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

{-| inset-block-end: -100%;
-}
neg_inset_be_full : Tailwind
neg_inset_be_full =
    Tailwind "-inset-be-full"

{-| inset-block-end: -1px;
-}
neg_inset_be_px : Tailwind
neg_inset_be_px =
    Tailwind "-inset-be-px"

{-| inset-block-start: -100%;
-}
neg_inset_bs_full : Tailwind
neg_inset_bs_full =
    Tailwind "-inset-bs-full"

{-| inset-block-start: -1px;
-}
neg_inset_bs_px : Tailwind
neg_inset_bs_px =
    Tailwind "-inset-bs-px"

{-| inset-inline-end: -100%;
-}
neg_inset_e_full : Tailwind
neg_inset_e_full =
    Tailwind "-inset-e-full"

{-| inset-inline-end: -1px;
-}
neg_inset_e_px : Tailwind
neg_inset_e_px =
    Tailwind "-inset-e-px"

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

{-| inset-inline-start: -100%;
-}
neg_inset_s_full : Tailwind
neg_inset_s_full =
    Tailwind "-inset-s-full"

{-| inset-inline-start: -1px;
-}
neg_inset_s_px : Tailwind
neg_inset_s_px =
    Tailwind "-inset-s-px"

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

{-| margin-block-end: -1px;
-}
neg_mbe_px : Tailwind
neg_mbe_px =
    Tailwind "-mbe-px"

{-| margin-block-start: -1px;
-}
neg_mbs_px : Tailwind
neg_mbs_px =
    Tailwind "-mbs-px"

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

{-| scroll-margin-block-end: -1px;
-}
neg_scroll_mbe_px : Tailwind
neg_scroll_mbe_px =
    Tailwind "-scroll-mbe-px"

{-| scroll-margin-block-start: -1px;
-}
neg_scroll_mbs_px : Tailwind
neg_scroll_mbs_px =
    Tailwind "-scroll-mbs-px"

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

{-| animation: var(--animate-bounce);
-}
animate_bounce : Tailwind
animate_bounce =
    Tailwind "animate-bounce"

{-| animation: none;
-}
animate_none : Tailwind
animate_none =
    Tailwind "animate-none"

{-| animation: var(--animate-ping);
-}
animate_ping : Tailwind
animate_ping =
    Tailwind "animate-ping"

{-| animation: var(--animate-pulse);
-}
animate_pulse : Tailwind
animate_pulse =
    Tailwind "animate-pulse"

{-| animation: var(--animate-spin);
-}
animate_spin : Tailwind
animate_spin =
    Tailwind "animate-spin"

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

{-| aspect-ratio: var(--aspect-video);
-}
aspect_video : Tailwind
aspect_video =
    Tailwind "aspect-video"

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

{-| --tw-backdrop-blur: blur(var(--blur-2xl));
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_2xl : Tailwind
backdrop_blur_2xl =
    Tailwind "backdrop-blur-2xl"

{-| --tw-backdrop-blur: blur(var(--blur-3xl));
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_3xl : Tailwind
backdrop_blur_3xl =
    Tailwind "backdrop-blur-3xl"

{-| --tw-backdrop-blur: blur(var(--blur-lg));
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_lg : Tailwind
backdrop_blur_lg =
    Tailwind "backdrop-blur-lg"

{-| --tw-backdrop-blur: blur(var(--blur-md));
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_md : Tailwind
backdrop_blur_md =
    Tailwind "backdrop-blur-md"

{-| --tw-backdrop-blur:  ;
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_none : Tailwind
backdrop_blur_none =
    Tailwind "backdrop-blur-none"

{-| --tw-backdrop-blur: blur(var(--blur-sm));
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_sm : Tailwind
backdrop_blur_sm =
    Tailwind "backdrop-blur-sm"

{-| --tw-backdrop-blur: blur(var(--blur-xl));
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_xl : Tailwind
backdrop_blur_xl =
    Tailwind "backdrop-blur-xl"

{-| --tw-backdrop-blur: blur(var(--blur-xs));
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_blur_xs : Tailwind
backdrop_blur_xs =
    Tailwind "backdrop-blur-xs"

{-| --tw-backdrop-brightness: brightness(0%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_0 : Tailwind
backdrop_brightness_0 =
    Tailwind "backdrop-brightness-0"

{-| --tw-backdrop-brightness: brightness(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_100 : Tailwind
backdrop_brightness_100 =
    Tailwind "backdrop-brightness-100"

{-| --tw-backdrop-brightness: brightness(105%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_105 : Tailwind
backdrop_brightness_105 =
    Tailwind "backdrop-brightness-105"

{-| --tw-backdrop-brightness: brightness(110%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_110 : Tailwind
backdrop_brightness_110 =
    Tailwind "backdrop-brightness-110"

{-| --tw-backdrop-brightness: brightness(125%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_125 : Tailwind
backdrop_brightness_125 =
    Tailwind "backdrop-brightness-125"

{-| --tw-backdrop-brightness: brightness(150%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_150 : Tailwind
backdrop_brightness_150 =
    Tailwind "backdrop-brightness-150"

{-| --tw-backdrop-brightness: brightness(200%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_200 : Tailwind
backdrop_brightness_200 =
    Tailwind "backdrop-brightness-200"

{-| --tw-backdrop-brightness: brightness(50%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_50 : Tailwind
backdrop_brightness_50 =
    Tailwind "backdrop-brightness-50"

{-| --tw-backdrop-brightness: brightness(75%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_75 : Tailwind
backdrop_brightness_75 =
    Tailwind "backdrop-brightness-75"

{-| --tw-backdrop-brightness: brightness(90%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_90 : Tailwind
backdrop_brightness_90 =
    Tailwind "backdrop-brightness-90"

{-| --tw-backdrop-brightness: brightness(95%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_brightness_95 : Tailwind
backdrop_brightness_95 =
    Tailwind "backdrop-brightness-95"

{-| --tw-backdrop-contrast: contrast(0%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_contrast_0 : Tailwind
backdrop_contrast_0 =
    Tailwind "backdrop-contrast-0"

{-| --tw-backdrop-contrast: contrast(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_contrast_100 : Tailwind
backdrop_contrast_100 =
    Tailwind "backdrop-contrast-100"

{-| --tw-backdrop-contrast: contrast(125%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_contrast_125 : Tailwind
backdrop_contrast_125 =
    Tailwind "backdrop-contrast-125"

{-| --tw-backdrop-contrast: contrast(150%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_contrast_150 : Tailwind
backdrop_contrast_150 =
    Tailwind "backdrop-contrast-150"

{-| --tw-backdrop-contrast: contrast(200%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_contrast_200 : Tailwind
backdrop_contrast_200 =
    Tailwind "backdrop-contrast-200"

{-| --tw-backdrop-contrast: contrast(50%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_contrast_50 : Tailwind
backdrop_contrast_50 =
    Tailwind "backdrop-contrast-50"

{-| --tw-backdrop-contrast: contrast(75%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_contrast_75 : Tailwind
backdrop_contrast_75 =
    Tailwind "backdrop-contrast-75"

{-| --tw-backdrop-grayscale: grayscale(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_grayscale : Tailwind
backdrop_grayscale =
    Tailwind "backdrop-grayscale"

{-| --tw-backdrop-grayscale: grayscale(0%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_grayscale_0 : Tailwind
backdrop_grayscale_0 =
    Tailwind "backdrop-grayscale-0"

{-| --tw-backdrop-grayscale: grayscale(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_grayscale_100 : Tailwind
backdrop_grayscale_100 =
    Tailwind "backdrop-grayscale-100"

{-| --tw-backdrop-grayscale: grayscale(25%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_grayscale_25 : Tailwind
backdrop_grayscale_25 =
    Tailwind "backdrop-grayscale-25"

{-| --tw-backdrop-grayscale: grayscale(50%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_grayscale_50 : Tailwind
backdrop_grayscale_50 =
    Tailwind "backdrop-grayscale-50"

{-| --tw-backdrop-grayscale: grayscale(75%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_grayscale_75 : Tailwind
backdrop_grayscale_75 =
    Tailwind "backdrop-grayscale-75"

{-| --tw-backdrop-hue-rotate: hue-rotate(0deg);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_hue_rotate_0 : Tailwind
backdrop_hue_rotate_0 =
    Tailwind "backdrop-hue-rotate-0"

{-| --tw-backdrop-hue-rotate: hue-rotate(15deg);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_hue_rotate_15 : Tailwind
backdrop_hue_rotate_15 =
    Tailwind "backdrop-hue-rotate-15"

{-| --tw-backdrop-hue-rotate: hue-rotate(180deg);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_hue_rotate_180 : Tailwind
backdrop_hue_rotate_180 =
    Tailwind "backdrop-hue-rotate-180"

{-| --tw-backdrop-hue-rotate: hue-rotate(30deg);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_hue_rotate_30 : Tailwind
backdrop_hue_rotate_30 =
    Tailwind "backdrop-hue-rotate-30"

{-| --tw-backdrop-hue-rotate: hue-rotate(60deg);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_hue_rotate_60 : Tailwind
backdrop_hue_rotate_60 =
    Tailwind "backdrop-hue-rotate-60"

{-| --tw-backdrop-hue-rotate: hue-rotate(90deg);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_hue_rotate_90 : Tailwind
backdrop_hue_rotate_90 =
    Tailwind "backdrop-hue-rotate-90"

{-| --tw-backdrop-invert: invert(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_invert : Tailwind
backdrop_invert =
    Tailwind "backdrop-invert"

{-| --tw-backdrop-invert: invert(0%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_invert_0 : Tailwind
backdrop_invert_0 =
    Tailwind "backdrop-invert-0"

{-| --tw-backdrop-invert: invert(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_invert_100 : Tailwind
backdrop_invert_100 =
    Tailwind "backdrop-invert-100"

{-| --tw-backdrop-invert: invert(25%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_invert_25 : Tailwind
backdrop_invert_25 =
    Tailwind "backdrop-invert-25"

{-| --tw-backdrop-invert: invert(50%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_invert_50 : Tailwind
backdrop_invert_50 =
    Tailwind "backdrop-invert-50"

{-| --tw-backdrop-invert: invert(75%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_invert_75 : Tailwind
backdrop_invert_75 =
    Tailwind "backdrop-invert-75"

{-| --tw-backdrop-saturate: saturate(0%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_saturate_0 : Tailwind
backdrop_saturate_0 =
    Tailwind "backdrop-saturate-0"

{-| --tw-backdrop-saturate: saturate(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_saturate_100 : Tailwind
backdrop_saturate_100 =
    Tailwind "backdrop-saturate-100"

{-| --tw-backdrop-saturate: saturate(150%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_saturate_150 : Tailwind
backdrop_saturate_150 =
    Tailwind "backdrop-saturate-150"

{-| --tw-backdrop-saturate: saturate(200%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_saturate_200 : Tailwind
backdrop_saturate_200 =
    Tailwind "backdrop-saturate-200"

{-| --tw-backdrop-saturate: saturate(50%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_saturate_50 : Tailwind
backdrop_saturate_50 =
    Tailwind "backdrop-saturate-50"

{-| --tw-backdrop-sepia: sepia(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_sepia : Tailwind
backdrop_sepia =
    Tailwind "backdrop-sepia"

{-| --tw-backdrop-sepia: sepia(0%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_sepia_0 : Tailwind
backdrop_sepia_0 =
    Tailwind "backdrop-sepia-0"

{-| --tw-backdrop-sepia: sepia(100%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_sepia_100 : Tailwind
backdrop_sepia_100 =
    Tailwind "backdrop-sepia-100"

{-| --tw-backdrop-sepia: sepia(50%);
  -webkit-backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
  backdrop-filter: var(--tw-backdrop-blur,) var(--tw-backdrop-brightness,) var(--tw-backdrop-contrast,) var(--tw-backdrop-grayscale,) var(--tw-backdrop-hue-rotate,) var(--tw-backdrop-invert,) var(--tw-backdrop-opacity,) var(--tw-backdrop-saturate,) var(--tw-backdrop-sepia,);
-}
backdrop_sepia_50 : Tailwind
backdrop_sepia_50 =
    Tailwind "backdrop-sepia-50"

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

{-| background-position: left bottom;
-}
bg_bottom_left : Tailwind
bg_bottom_left =
    Tailwind "bg-bottom-left"

{-| background-position: right bottom;
-}
bg_bottom_right : Tailwind
bg_bottom_right =
    Tailwind "bg-bottom-right"

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

{-| --tw-gradient-position: in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic : Tailwind
bg_conic =
    Tailwind "bg-conic"

{-| --tw-gradient-position: from 0deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_0 : Tailwind
bg_conic_0 =
    Tailwind "bg-conic-0"

{-| --tw-gradient-position: from 120deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_120 : Tailwind
bg_conic_120 =
    Tailwind "bg-conic-120"

{-| --tw-gradient-position: from 150deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_150 : Tailwind
bg_conic_150 =
    Tailwind "bg-conic-150"

{-| --tw-gradient-position: from 180deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_180 : Tailwind
bg_conic_180 =
    Tailwind "bg-conic-180"

{-| --tw-gradient-position: from 210deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_210 : Tailwind
bg_conic_210 =
    Tailwind "bg-conic-210"

{-| --tw-gradient-position: from 240deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_240 : Tailwind
bg_conic_240 =
    Tailwind "bg-conic-240"

{-| --tw-gradient-position: from 270deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_270 : Tailwind
bg_conic_270 =
    Tailwind "bg-conic-270"

{-| --tw-gradient-position: from 30deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_30 : Tailwind
bg_conic_30 =
    Tailwind "bg-conic-30"

{-| --tw-gradient-position: from 300deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_300 : Tailwind
bg_conic_300 =
    Tailwind "bg-conic-300"

{-| --tw-gradient-position: from 330deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_330 : Tailwind
bg_conic_330 =
    Tailwind "bg-conic-330"

{-| --tw-gradient-position: from 60deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_60 : Tailwind
bg_conic_60 =
    Tailwind "bg-conic-60"

{-| --tw-gradient-position: from 90deg in oklab;
  background-image: conic-gradient(var(--tw-gradient-stops));
-}
bg_conic_90 : Tailwind
bg_conic_90 =
    Tailwind "bg-conic-90"

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

{-| --tw-gradient-position: to bottom in oklab;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_b : Tailwind
bg_gradient_to_b =
    Tailwind "bg-gradient-to-b"

{-| --tw-gradient-position: to bottom left in oklab;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_bl : Tailwind
bg_gradient_to_bl =
    Tailwind "bg-gradient-to-bl"

{-| --tw-gradient-position: to bottom right in oklab;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_br : Tailwind
bg_gradient_to_br =
    Tailwind "bg-gradient-to-br"

{-| --tw-gradient-position: to left in oklab;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_l : Tailwind
bg_gradient_to_l =
    Tailwind "bg-gradient-to-l"

{-| --tw-gradient-position: to right in oklab;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_r : Tailwind
bg_gradient_to_r =
    Tailwind "bg-gradient-to-r"

{-| --tw-gradient-position: to top in oklab;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_t : Tailwind
bg_gradient_to_t =
    Tailwind "bg-gradient-to-t"

{-| --tw-gradient-position: to top left in oklab;
  background-image: linear-gradient(var(--tw-gradient-stops));
-}
bg_gradient_to_tl : Tailwind
bg_gradient_to_tl =
    Tailwind "bg-gradient-to-tl"

{-| --tw-gradient-position: to top right in oklab;
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

{-| --tw-gradient-position: 0deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 0deg in oklab;
-}
bg_linear_0 : Tailwind
bg_linear_0 =
    Tailwind "bg-linear-0"

{-| --tw-gradient-position: 120deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 120deg in oklab;
-}
bg_linear_120 : Tailwind
bg_linear_120 =
    Tailwind "bg-linear-120"

{-| --tw-gradient-position: 150deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 150deg in oklab;
-}
bg_linear_150 : Tailwind
bg_linear_150 =
    Tailwind "bg-linear-150"

{-| --tw-gradient-position: 180deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 180deg in oklab;
-}
bg_linear_180 : Tailwind
bg_linear_180 =
    Tailwind "bg-linear-180"

{-| --tw-gradient-position: 210deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 210deg in oklab;
-}
bg_linear_210 : Tailwind
bg_linear_210 =
    Tailwind "bg-linear-210"

{-| --tw-gradient-position: 240deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 240deg in oklab;
-}
bg_linear_240 : Tailwind
bg_linear_240 =
    Tailwind "bg-linear-240"

{-| --tw-gradient-position: 270deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 270deg in oklab;
-}
bg_linear_270 : Tailwind
bg_linear_270 =
    Tailwind "bg-linear-270"

{-| --tw-gradient-position: 30deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 30deg in oklab;
-}
bg_linear_30 : Tailwind
bg_linear_30 =
    Tailwind "bg-linear-30"

{-| --tw-gradient-position: 300deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 300deg in oklab;
-}
bg_linear_300 : Tailwind
bg_linear_300 =
    Tailwind "bg-linear-300"

{-| --tw-gradient-position: 330deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 330deg in oklab;
-}
bg_linear_330 : Tailwind
bg_linear_330 =
    Tailwind "bg-linear-330"

{-| --tw-gradient-position: 60deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 60deg in oklab;
-}
bg_linear_60 : Tailwind
bg_linear_60 =
    Tailwind "bg-linear-60"

{-| --tw-gradient-position: 90deg;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: 90deg in oklab;
-}
bg_linear_90 : Tailwind
bg_linear_90 =
    Tailwind "bg-linear-90"

{-| --tw-gradient-position: to bottom;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to bottom in oklab;
-}
bg_linear_to_b : Tailwind
bg_linear_to_b =
    Tailwind "bg-linear-to-b"

{-| --tw-gradient-position: to bottom left;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to bottom left in oklab;
-}
bg_linear_to_bl : Tailwind
bg_linear_to_bl =
    Tailwind "bg-linear-to-bl"

{-| --tw-gradient-position: to bottom right;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to bottom right in oklab;
-}
bg_linear_to_br : Tailwind
bg_linear_to_br =
    Tailwind "bg-linear-to-br"

{-| --tw-gradient-position: to left;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to left in oklab;
-}
bg_linear_to_l : Tailwind
bg_linear_to_l =
    Tailwind "bg-linear-to-l"

{-| --tw-gradient-position: to right;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to right in oklab;
-}
bg_linear_to_r : Tailwind
bg_linear_to_r =
    Tailwind "bg-linear-to-r"

{-| --tw-gradient-position: to top;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to top in oklab;
-}
bg_linear_to_t : Tailwind
bg_linear_to_t =
    Tailwind "bg-linear-to-t"

{-| --tw-gradient-position: to top left;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to top left in oklab;
-}
bg_linear_to_tl : Tailwind
bg_linear_to_tl =
    Tailwind "bg-linear-to-tl"

{-| --tw-gradient-position: to top right;
  @supports (background-image: linear-gradient(in lab, red, red)) {
    --tw-gradient-position: to top right in oklab;
-}
bg_linear_to_tr : Tailwind
bg_linear_to_tr =
    Tailwind "bg-linear-to-tr"

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

{-| --tw-gradient-position: in oklab;
  background-image: radial-gradient(var(--tw-gradient-stops));
-}
bg_radial : Tailwind
bg_radial =
    Tailwind "bg-radial"

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

{-| background-position: left top;
-}
bg_top_left : Tailwind
bg_top_left =
    Tailwind "bg-top-left"

{-| background-position: right top;
-}
bg_top_right : Tailwind
bg_top_right =
    Tailwind "bg-top-right"

{-| display: block;
-}
block : Tailwind
block =
    Tailwind "block"

{-| block-size: auto;
-}
block_auto : Tailwind
block_auto =
    Tailwind "block-auto"

{-| block-size: 100dvh;
-}
block_dvh : Tailwind
block_dvh =
    Tailwind "block-dvh"

{-| block-size: fit-content;
-}
block_fit : Tailwind
block_fit =
    Tailwind "block-fit"

{-| block-size: 100%;
-}
block_full : Tailwind
block_full =
    Tailwind "block-full"

{-| block-size: 1lh;
-}
block_lh : Tailwind
block_lh =
    Tailwind "block-lh"

{-| block-size: 100lvh;
-}
block_lvh : Tailwind
block_lvh =
    Tailwind "block-lvh"

{-| block-size: max-content;
-}
block_max : Tailwind
block_max =
    Tailwind "block-max"

{-| block-size: min-content;
-}
block_min : Tailwind
block_min =
    Tailwind "block-min"

{-| block-size: 1px;
-}
block_px : Tailwind
block_px =
    Tailwind "block-px"

{-| block-size: 100vh;
-}
block_screen : Tailwind
block_screen =
    Tailwind "block-screen"

{-| block-size: 100svh;
-}
block_svh : Tailwind
block_svh =
    Tailwind "block-svh"

{-| --tw-blur: blur(var(--blur-2xl));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_2xl : Tailwind
blur_2xl =
    Tailwind "blur-2xl"

{-| --tw-blur: blur(var(--blur-3xl));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_3xl : Tailwind
blur_3xl =
    Tailwind "blur-3xl"

{-| --tw-blur: blur(var(--blur-lg));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_lg : Tailwind
blur_lg =
    Tailwind "blur-lg"

{-| --tw-blur: blur(var(--blur-md));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_md : Tailwind
blur_md =
    Tailwind "blur-md"

{-| --tw-blur:  ;
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_none : Tailwind
blur_none =
    Tailwind "blur-none"

{-| --tw-blur: blur(var(--blur-sm));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_sm : Tailwind
blur_sm =
    Tailwind "blur-sm"

{-| --tw-blur: blur(var(--blur-xl));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_xl : Tailwind
blur_xl =
    Tailwind "blur-xl"

{-| --tw-blur: blur(var(--blur-xs));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
blur_xs : Tailwind
blur_xs =
    Tailwind "blur-xs"

{-| border-style: var(--tw-border-style);
  border-width: 1px;
-}
border : Tailwind
border =
    Tailwind "border"

{-| border-style: var(--tw-border-style);
  border-width: 0px;
-}
border_0 : Tailwind
border_0 =
    Tailwind "border-0"

{-| border-style: var(--tw-border-style);
  border-width: 2px;
-}
border_2 : Tailwind
border_2 =
    Tailwind "border-2"

{-| border-style: var(--tw-border-style);
  border-width: 4px;
-}
border_4 : Tailwind
border_4 =
    Tailwind "border-4"

{-| border-style: var(--tw-border-style);
  border-width: 8px;
-}
border_8 : Tailwind
border_8 =
    Tailwind "border-8"

{-| border-bottom-style: var(--tw-border-style);
  border-bottom-width: 1px;
-}
border_b : Tailwind
border_b =
    Tailwind "border-b"

{-| border-bottom-style: var(--tw-border-style);
  border-bottom-width: 0px;
-}
border_b_0 : Tailwind
border_b_0 =
    Tailwind "border-b-0"

{-| border-bottom-style: var(--tw-border-style);
  border-bottom-width: 2px;
-}
border_b_2 : Tailwind
border_b_2 =
    Tailwind "border-b-2"

{-| border-bottom-style: var(--tw-border-style);
  border-bottom-width: 4px;
-}
border_b_4 : Tailwind
border_b_4 =
    Tailwind "border-b-4"

{-| border-bottom-style: var(--tw-border-style);
  border-bottom-width: 8px;
-}
border_b_8 : Tailwind
border_b_8 =
    Tailwind "border-b-8"

{-| border-block-end-style: var(--tw-border-style);
  border-block-end-width: 1px;
-}
border_be : Tailwind
border_be =
    Tailwind "border-be"

{-| border-block-end-style: var(--tw-border-style);
  border-block-end-width: 0px;
-}
border_be_0 : Tailwind
border_be_0 =
    Tailwind "border-be-0"

{-| border-block-end-style: var(--tw-border-style);
  border-block-end-width: 2px;
-}
border_be_2 : Tailwind
border_be_2 =
    Tailwind "border-be-2"

{-| border-block-end-style: var(--tw-border-style);
  border-block-end-width: 4px;
-}
border_be_4 : Tailwind
border_be_4 =
    Tailwind "border-be-4"

{-| border-block-end-style: var(--tw-border-style);
  border-block-end-width: 8px;
-}
border_be_8 : Tailwind
border_be_8 =
    Tailwind "border-be-8"

{-| border-block-start-style: var(--tw-border-style);
  border-block-start-width: 1px;
-}
border_bs : Tailwind
border_bs =
    Tailwind "border-bs"

{-| border-block-start-style: var(--tw-border-style);
  border-block-start-width: 0px;
-}
border_bs_0 : Tailwind
border_bs_0 =
    Tailwind "border-bs-0"

{-| border-block-start-style: var(--tw-border-style);
  border-block-start-width: 2px;
-}
border_bs_2 : Tailwind
border_bs_2 =
    Tailwind "border-bs-2"

{-| border-block-start-style: var(--tw-border-style);
  border-block-start-width: 4px;
-}
border_bs_4 : Tailwind
border_bs_4 =
    Tailwind "border-bs-4"

{-| border-block-start-style: var(--tw-border-style);
  border-block-start-width: 8px;
-}
border_bs_8 : Tailwind
border_bs_8 =
    Tailwind "border-bs-8"

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

{-| border-inline-end-style: var(--tw-border-style);
  border-inline-end-width: 1px;
-}
border_e : Tailwind
border_e =
    Tailwind "border-e"

{-| border-inline-end-style: var(--tw-border-style);
  border-inline-end-width: 0px;
-}
border_e_0 : Tailwind
border_e_0 =
    Tailwind "border-e-0"

{-| border-inline-end-style: var(--tw-border-style);
  border-inline-end-width: 2px;
-}
border_e_2 : Tailwind
border_e_2 =
    Tailwind "border-e-2"

{-| border-inline-end-style: var(--tw-border-style);
  border-inline-end-width: 4px;
-}
border_e_4 : Tailwind
border_e_4 =
    Tailwind "border-e-4"

{-| border-inline-end-style: var(--tw-border-style);
  border-inline-end-width: 8px;
-}
border_e_8 : Tailwind
border_e_8 =
    Tailwind "border-e-8"

{-| --tw-border-style: hidden;
  border-style: hidden;
-}
border_hidden : Tailwind
border_hidden =
    Tailwind "border-hidden"

{-| border-left-style: var(--tw-border-style);
  border-left-width: 1px;
-}
border_l : Tailwind
border_l =
    Tailwind "border-l"

{-| border-left-style: var(--tw-border-style);
  border-left-width: 0px;
-}
border_l_0 : Tailwind
border_l_0 =
    Tailwind "border-l-0"

{-| border-left-style: var(--tw-border-style);
  border-left-width: 2px;
-}
border_l_2 : Tailwind
border_l_2 =
    Tailwind "border-l-2"

{-| border-left-style: var(--tw-border-style);
  border-left-width: 4px;
-}
border_l_4 : Tailwind
border_l_4 =
    Tailwind "border-l-4"

{-| border-left-style: var(--tw-border-style);
  border-left-width: 8px;
-}
border_l_8 : Tailwind
border_l_8 =
    Tailwind "border-l-8"

{-| --tw-border-style: none;
  border-style: none;
-}
border_none : Tailwind
border_none =
    Tailwind "border-none"

{-| border-right-style: var(--tw-border-style);
  border-right-width: 1px;
-}
border_r : Tailwind
border_r =
    Tailwind "border-r"

{-| border-right-style: var(--tw-border-style);
  border-right-width: 0px;
-}
border_r_0 : Tailwind
border_r_0 =
    Tailwind "border-r-0"

{-| border-right-style: var(--tw-border-style);
  border-right-width: 2px;
-}
border_r_2 : Tailwind
border_r_2 =
    Tailwind "border-r-2"

{-| border-right-style: var(--tw-border-style);
  border-right-width: 4px;
-}
border_r_4 : Tailwind
border_r_4 =
    Tailwind "border-r-4"

{-| border-right-style: var(--tw-border-style);
  border-right-width: 8px;
-}
border_r_8 : Tailwind
border_r_8 =
    Tailwind "border-r-8"

{-| border-inline-start-style: var(--tw-border-style);
  border-inline-start-width: 1px;
-}
border_s : Tailwind
border_s =
    Tailwind "border-s"

{-| border-inline-start-style: var(--tw-border-style);
  border-inline-start-width: 0px;
-}
border_s_0 : Tailwind
border_s_0 =
    Tailwind "border-s-0"

{-| border-inline-start-style: var(--tw-border-style);
  border-inline-start-width: 2px;
-}
border_s_2 : Tailwind
border_s_2 =
    Tailwind "border-s-2"

{-| border-inline-start-style: var(--tw-border-style);
  border-inline-start-width: 4px;
-}
border_s_4 : Tailwind
border_s_4 =
    Tailwind "border-s-4"

{-| border-inline-start-style: var(--tw-border-style);
  border-inline-start-width: 8px;
-}
border_s_8 : Tailwind
border_s_8 =
    Tailwind "border-s-8"

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

{-| border-top-style: var(--tw-border-style);
  border-top-width: 1px;
-}
border_t : Tailwind
border_t =
    Tailwind "border-t"

{-| border-top-style: var(--tw-border-style);
  border-top-width: 0px;
-}
border_t_0 : Tailwind
border_t_0 =
    Tailwind "border-t-0"

{-| border-top-style: var(--tw-border-style);
  border-top-width: 2px;
-}
border_t_2 : Tailwind
border_t_2 =
    Tailwind "border-t-2"

{-| border-top-style: var(--tw-border-style);
  border-top-width: 4px;
-}
border_t_4 : Tailwind
border_t_4 =
    Tailwind "border-t-4"

{-| border-top-style: var(--tw-border-style);
  border-top-width: 8px;
-}
border_t_8 : Tailwind
border_t_8 =
    Tailwind "border-t-8"

{-| border-inline-style: var(--tw-border-style);
  border-inline-width: 1px;
-}
border_x : Tailwind
border_x =
    Tailwind "border-x"

{-| border-inline-style: var(--tw-border-style);
  border-inline-width: 0px;
-}
border_x_0 : Tailwind
border_x_0 =
    Tailwind "border-x-0"

{-| border-inline-style: var(--tw-border-style);
  border-inline-width: 2px;
-}
border_x_2 : Tailwind
border_x_2 =
    Tailwind "border-x-2"

{-| border-inline-style: var(--tw-border-style);
  border-inline-width: 4px;
-}
border_x_4 : Tailwind
border_x_4 =
    Tailwind "border-x-4"

{-| border-inline-style: var(--tw-border-style);
  border-inline-width: 8px;
-}
border_x_8 : Tailwind
border_x_8 =
    Tailwind "border-x-8"

{-| border-block-style: var(--tw-border-style);
  border-block-width: 1px;
-}
border_y : Tailwind
border_y =
    Tailwind "border-y"

{-| border-block-style: var(--tw-border-style);
  border-block-width: 0px;
-}
border_y_0 : Tailwind
border_y_0 =
    Tailwind "border-y-0"

{-| border-block-style: var(--tw-border-style);
  border-block-width: 2px;
-}
border_y_2 : Tailwind
border_y_2 =
    Tailwind "border-y-2"

{-| border-block-style: var(--tw-border-style);
  border-block-width: 4px;
-}
border_y_4 : Tailwind
border_y_4 =
    Tailwind "border-y-4"

{-| border-block-style: var(--tw-border-style);
  border-block-width: 8px;
-}
border_y_8 : Tailwind
border_y_8 =
    Tailwind "border-y-8"

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

{-| --tw-brightness: brightness(0%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_0 : Tailwind
brightness_0 =
    Tailwind "brightness-0"

{-| --tw-brightness: brightness(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_100 : Tailwind
brightness_100 =
    Tailwind "brightness-100"

{-| --tw-brightness: brightness(105%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_105 : Tailwind
brightness_105 =
    Tailwind "brightness-105"

{-| --tw-brightness: brightness(110%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_110 : Tailwind
brightness_110 =
    Tailwind "brightness-110"

{-| --tw-brightness: brightness(125%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_125 : Tailwind
brightness_125 =
    Tailwind "brightness-125"

{-| --tw-brightness: brightness(150%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_150 : Tailwind
brightness_150 =
    Tailwind "brightness-150"

{-| --tw-brightness: brightness(200%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_200 : Tailwind
brightness_200 =
    Tailwind "brightness-200"

{-| --tw-brightness: brightness(50%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_50 : Tailwind
brightness_50 =
    Tailwind "brightness-50"

{-| --tw-brightness: brightness(75%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_75 : Tailwind
brightness_75 =
    Tailwind "brightness-75"

{-| --tw-brightness: brightness(90%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_90 : Tailwind
brightness_90 =
    Tailwind "brightness-90"

{-| --tw-brightness: brightness(95%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
brightness_95 : Tailwind
brightness_95 =
    Tailwind "brightness-95"

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

{-| grid-column-end: 1;
-}
col_end_1 : Tailwind
col_end_1 =
    Tailwind "col-end-1"

{-| grid-column-end: 10;
-}
col_end_10 : Tailwind
col_end_10 =
    Tailwind "col-end-10"

{-| grid-column-end: 11;
-}
col_end_11 : Tailwind
col_end_11 =
    Tailwind "col-end-11"

{-| grid-column-end: 12;
-}
col_end_12 : Tailwind
col_end_12 =
    Tailwind "col-end-12"

{-| grid-column-end: 13;
-}
col_end_13 : Tailwind
col_end_13 =
    Tailwind "col-end-13"

{-| grid-column-end: 2;
-}
col_end_2 : Tailwind
col_end_2 =
    Tailwind "col-end-2"

{-| grid-column-end: 3;
-}
col_end_3 : Tailwind
col_end_3 =
    Tailwind "col-end-3"

{-| grid-column-end: 4;
-}
col_end_4 : Tailwind
col_end_4 =
    Tailwind "col-end-4"

{-| grid-column-end: 5;
-}
col_end_5 : Tailwind
col_end_5 =
    Tailwind "col-end-5"

{-| grid-column-end: 6;
-}
col_end_6 : Tailwind
col_end_6 =
    Tailwind "col-end-6"

{-| grid-column-end: 7;
-}
col_end_7 : Tailwind
col_end_7 =
    Tailwind "col-end-7"

{-| grid-column-end: 8;
-}
col_end_8 : Tailwind
col_end_8 =
    Tailwind "col-end-8"

{-| grid-column-end: 9;
-}
col_end_9 : Tailwind
col_end_9 =
    Tailwind "col-end-9"

{-| grid-column-end: auto;
-}
col_end_auto : Tailwind
col_end_auto =
    Tailwind "col-end-auto"

{-| grid-column: span 1 / span 1;
-}
col_span_1 : Tailwind
col_span_1 =
    Tailwind "col-span-1"

{-| grid-column: span 10 / span 10;
-}
col_span_10 : Tailwind
col_span_10 =
    Tailwind "col-span-10"

{-| grid-column: span 11 / span 11;
-}
col_span_11 : Tailwind
col_span_11 =
    Tailwind "col-span-11"

{-| grid-column: span 12 / span 12;
-}
col_span_12 : Tailwind
col_span_12 =
    Tailwind "col-span-12"

{-| grid-column: span 2 / span 2;
-}
col_span_2 : Tailwind
col_span_2 =
    Tailwind "col-span-2"

{-| grid-column: span 3 / span 3;
-}
col_span_3 : Tailwind
col_span_3 =
    Tailwind "col-span-3"

{-| grid-column: span 4 / span 4;
-}
col_span_4 : Tailwind
col_span_4 =
    Tailwind "col-span-4"

{-| grid-column: span 5 / span 5;
-}
col_span_5 : Tailwind
col_span_5 =
    Tailwind "col-span-5"

{-| grid-column: span 6 / span 6;
-}
col_span_6 : Tailwind
col_span_6 =
    Tailwind "col-span-6"

{-| grid-column: span 7 / span 7;
-}
col_span_7 : Tailwind
col_span_7 =
    Tailwind "col-span-7"

{-| grid-column: span 8 / span 8;
-}
col_span_8 : Tailwind
col_span_8 =
    Tailwind "col-span-8"

{-| grid-column: span 9 / span 9;
-}
col_span_9 : Tailwind
col_span_9 =
    Tailwind "col-span-9"

{-| grid-column: 1 / -1;
-}
col_span_full : Tailwind
col_span_full =
    Tailwind "col-span-full"

{-| grid-column-start: 1;
-}
col_start_1 : Tailwind
col_start_1 =
    Tailwind "col-start-1"

{-| grid-column-start: 10;
-}
col_start_10 : Tailwind
col_start_10 =
    Tailwind "col-start-10"

{-| grid-column-start: 11;
-}
col_start_11 : Tailwind
col_start_11 =
    Tailwind "col-start-11"

{-| grid-column-start: 12;
-}
col_start_12 : Tailwind
col_start_12 =
    Tailwind "col-start-12"

{-| grid-column-start: 13;
-}
col_start_13 : Tailwind
col_start_13 =
    Tailwind "col-start-13"

{-| grid-column-start: 2;
-}
col_start_2 : Tailwind
col_start_2 =
    Tailwind "col-start-2"

{-| grid-column-start: 3;
-}
col_start_3 : Tailwind
col_start_3 =
    Tailwind "col-start-3"

{-| grid-column-start: 4;
-}
col_start_4 : Tailwind
col_start_4 =
    Tailwind "col-start-4"

{-| grid-column-start: 5;
-}
col_start_5 : Tailwind
col_start_5 =
    Tailwind "col-start-5"

{-| grid-column-start: 6;
-}
col_start_6 : Tailwind
col_start_6 =
    Tailwind "col-start-6"

{-| grid-column-start: 7;
-}
col_start_7 : Tailwind
col_start_7 =
    Tailwind "col-start-7"

{-| grid-column-start: 8;
-}
col_start_8 : Tailwind
col_start_8 =
    Tailwind "col-start-8"

{-| grid-column-start: 9;
-}
col_start_9 : Tailwind
col_start_9 =
    Tailwind "col-start-9"

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

{-| columns: var(--container-2xl);
-}
columns_2xl : Tailwind
columns_2xl =
    Tailwind "columns-2xl"

{-| columns: var(--container-2xs);
-}
columns_2xs : Tailwind
columns_2xs =
    Tailwind "columns-2xs"

{-| columns: var(--container-3xl);
-}
columns_3xl : Tailwind
columns_3xl =
    Tailwind "columns-3xl"

{-| columns: var(--container-3xs);
-}
columns_3xs : Tailwind
columns_3xs =
    Tailwind "columns-3xs"

{-| columns: var(--container-4xl);
-}
columns_4xl : Tailwind
columns_4xl =
    Tailwind "columns-4xl"

{-| columns: var(--container-5xl);
-}
columns_5xl : Tailwind
columns_5xl =
    Tailwind "columns-5xl"

{-| columns: var(--container-6xl);
-}
columns_6xl : Tailwind
columns_6xl =
    Tailwind "columns-6xl"

{-| columns: var(--container-7xl);
-}
columns_7xl : Tailwind
columns_7xl =
    Tailwind "columns-7xl"

{-| columns: auto;
-}
columns_auto : Tailwind
columns_auto =
    Tailwind "columns-auto"

{-| columns: var(--container-lg);
-}
columns_lg : Tailwind
columns_lg =
    Tailwind "columns-lg"

{-| columns: var(--container-md);
-}
columns_md : Tailwind
columns_md =
    Tailwind "columns-md"

{-| columns: var(--container-sm);
-}
columns_sm : Tailwind
columns_sm =
    Tailwind "columns-sm"

{-| columns: var(--container-xl);
-}
columns_xl : Tailwind
columns_xl =
    Tailwind "columns-xl"

{-| columns: var(--container-xs);
-}
columns_xs : Tailwind
columns_xs =
    Tailwind "columns-xs"

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

{-| align-content: safe center;
-}
content_center_safe : Tailwind
content_center_safe =
    Tailwind "content-center-safe"

{-| align-content: flex-end;
-}
content_end : Tailwind
content_end =
    Tailwind "content-end"

{-| align-content: safe flex-end;
-}
content_end_safe : Tailwind
content_end_safe =
    Tailwind "content-end-safe"

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

{-| --tw-contrast: contrast(0%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
contrast_0 : Tailwind
contrast_0 =
    Tailwind "contrast-0"

{-| --tw-contrast: contrast(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
contrast_100 : Tailwind
contrast_100 =
    Tailwind "contrast-100"

{-| --tw-contrast: contrast(125%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
contrast_125 : Tailwind
contrast_125 =
    Tailwind "contrast-125"

{-| --tw-contrast: contrast(150%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
contrast_150 : Tailwind
contrast_150 =
    Tailwind "contrast-150"

{-| --tw-contrast: contrast(200%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
contrast_200 : Tailwind
contrast_200 =
    Tailwind "contrast-200"

{-| --tw-contrast: contrast(50%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
contrast_50 : Tailwind
contrast_50 =
    Tailwind "contrast-50"

{-| --tw-contrast: contrast(75%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
contrast_75 : Tailwind
contrast_75 =
    Tailwind "contrast-75"

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

{-| text-decoration-thickness: 0px;
-}
decoration_0 : Tailwind
decoration_0 =
    Tailwind "decoration-0"

{-| text-decoration-thickness: 1px;
-}
decoration_1 : Tailwind
decoration_1 =
    Tailwind "decoration-1"

{-| text-decoration-thickness: 2px;
-}
decoration_2 : Tailwind
decoration_2 =
    Tailwind "decoration-2"

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

{-| transition-delay: 100ms;
-}
delay_100 : Tailwind
delay_100 =
    Tailwind "delay-100"

{-| transition-delay: 1000ms;
-}
delay_1000 : Tailwind
delay_1000 =
    Tailwind "delay-1000"

{-| transition-delay: 150ms;
-}
delay_150 : Tailwind
delay_150 =
    Tailwind "delay-150"

{-| transition-delay: 200ms;
-}
delay_200 : Tailwind
delay_200 =
    Tailwind "delay-200"

{-| transition-delay: 300ms;
-}
delay_300 : Tailwind
delay_300 =
    Tailwind "delay-300"

{-| transition-delay: 500ms;
-}
delay_500 : Tailwind
delay_500 =
    Tailwind "delay-500"

{-| transition-delay: 700ms;
-}
delay_700 : Tailwind
delay_700 =
    Tailwind "delay-700"

{-| transition-delay: 75ms;
-}
delay_75 : Tailwind
delay_75 =
    Tailwind "delay-75"

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
    --tw-divide-x-reverse: 0;
    border-inline-style: var(--tw-border-style);
    border-inline-start-width: calc(1px * var(--tw-divide-x-reverse));
    border-inline-end-width: calc(1px * calc(1 - var(--tw-divide-x-reverse)));
-}
divide_x : Tailwind
divide_x =
    Tailwind "divide-x"

{-| :where(& > :not(:last-child)) {
    --tw-divide-x-reverse: 0;
    border-inline-style: var(--tw-border-style);
    border-inline-start-width: calc(0px * var(--tw-divide-x-reverse));
    border-inline-end-width: calc(0px * calc(1 - var(--tw-divide-x-reverse)));
-}
divide_x_0 : Tailwind
divide_x_0 =
    Tailwind "divide-x-0"

{-| :where(& > :not(:last-child)) {
    --tw-divide-x-reverse: 0;
    border-inline-style: var(--tw-border-style);
    border-inline-start-width: calc(2px * var(--tw-divide-x-reverse));
    border-inline-end-width: calc(2px * calc(1 - var(--tw-divide-x-reverse)));
-}
divide_x_2 : Tailwind
divide_x_2 =
    Tailwind "divide-x-2"

{-| :where(& > :not(:last-child)) {
    --tw-divide-x-reverse: 0;
    border-inline-style: var(--tw-border-style);
    border-inline-start-width: calc(4px * var(--tw-divide-x-reverse));
    border-inline-end-width: calc(4px * calc(1 - var(--tw-divide-x-reverse)));
-}
divide_x_4 : Tailwind
divide_x_4 =
    Tailwind "divide-x-4"

{-| :where(& > :not(:last-child)) {
    --tw-divide-x-reverse: 0;
    border-inline-style: var(--tw-border-style);
    border-inline-start-width: calc(8px * var(--tw-divide-x-reverse));
    border-inline-end-width: calc(8px * calc(1 - var(--tw-divide-x-reverse)));
-}
divide_x_8 : Tailwind
divide_x_8 =
    Tailwind "divide-x-8"

{-| :where(& > :not(:last-child)) {
    --tw-divide-x-reverse: 1;
-}
divide_x_reverse : Tailwind
divide_x_reverse =
    Tailwind "divide-x-reverse"

{-| :where(& > :not(:last-child)) {
    --tw-divide-y-reverse: 0;
    border-bottom-style: var(--tw-border-style);
    border-top-style: var(--tw-border-style);
    border-top-width: calc(1px * var(--tw-divide-y-reverse));
    border-bottom-width: calc(1px * calc(1 - var(--tw-divide-y-reverse)));
-}
divide_y : Tailwind
divide_y =
    Tailwind "divide-y"

{-| :where(& > :not(:last-child)) {
    --tw-divide-y-reverse: 0;
    border-bottom-style: var(--tw-border-style);
    border-top-style: var(--tw-border-style);
    border-top-width: calc(0px * var(--tw-divide-y-reverse));
    border-bottom-width: calc(0px * calc(1 - var(--tw-divide-y-reverse)));
-}
divide_y_0 : Tailwind
divide_y_0 =
    Tailwind "divide-y-0"

{-| :where(& > :not(:last-child)) {
    --tw-divide-y-reverse: 0;
    border-bottom-style: var(--tw-border-style);
    border-top-style: var(--tw-border-style);
    border-top-width: calc(2px * var(--tw-divide-y-reverse));
    border-bottom-width: calc(2px * calc(1 - var(--tw-divide-y-reverse)));
-}
divide_y_2 : Tailwind
divide_y_2 =
    Tailwind "divide-y-2"

{-| :where(& > :not(:last-child)) {
    --tw-divide-y-reverse: 0;
    border-bottom-style: var(--tw-border-style);
    border-top-style: var(--tw-border-style);
    border-top-width: calc(4px * var(--tw-divide-y-reverse));
    border-bottom-width: calc(4px * calc(1 - var(--tw-divide-y-reverse)));
-}
divide_y_4 : Tailwind
divide_y_4 =
    Tailwind "divide-y-4"

{-| :where(& > :not(:last-child)) {
    --tw-divide-y-reverse: 0;
    border-bottom-style: var(--tw-border-style);
    border-top-style: var(--tw-border-style);
    border-top-width: calc(8px * var(--tw-divide-y-reverse));
    border-bottom-width: calc(8px * calc(1 - var(--tw-divide-y-reverse)));
-}
divide_y_8 : Tailwind
divide_y_8 =
    Tailwind "divide-y-8"

{-| :where(& > :not(:last-child)) {
    --tw-divide-y-reverse: 1;
-}
divide_y_reverse : Tailwind
divide_y_reverse =
    Tailwind "divide-y-reverse"

{-| --tw-drop-shadow-size: drop-shadow(0 25px 25px var(--tw-drop-shadow-color, rgb(0 0 0 / 0.15)));
  --tw-drop-shadow: drop-shadow(var(--drop-shadow-2xl));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_2xl : Tailwind
drop_shadow_2xl =
    Tailwind "drop-shadow-2xl"

{-| --tw-drop-shadow-size: drop-shadow(0 4px 4px var(--tw-drop-shadow-color, rgb(0 0 0 / 0.15)));
  --tw-drop-shadow: drop-shadow(var(--drop-shadow-lg));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_lg : Tailwind
drop_shadow_lg =
    Tailwind "drop-shadow-lg"

{-| --tw-drop-shadow-size: drop-shadow(0 3px 3px var(--tw-drop-shadow-color, rgb(0 0 0 / 0.12)));
  --tw-drop-shadow: drop-shadow(var(--drop-shadow-md));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_md : Tailwind
drop_shadow_md =
    Tailwind "drop-shadow-md"

{-| --tw-drop-shadow:  ;
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_none : Tailwind
drop_shadow_none =
    Tailwind "drop-shadow-none"

{-| --tw-drop-shadow-size: drop-shadow(0 1px 2px var(--tw-drop-shadow-color, rgb(0 0 0 / 0.15)));
  --tw-drop-shadow: drop-shadow(var(--drop-shadow-sm));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_sm : Tailwind
drop_shadow_sm =
    Tailwind "drop-shadow-sm"

{-| --tw-drop-shadow-size: drop-shadow(0 9px 7px var(--tw-drop-shadow-color, rgb(0 0 0 / 0.1)));
  --tw-drop-shadow: drop-shadow(var(--drop-shadow-xl));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_xl : Tailwind
drop_shadow_xl =
    Tailwind "drop-shadow-xl"

{-| --tw-drop-shadow-size: drop-shadow(0 1px 1px var(--tw-drop-shadow-color, rgb(0 0 0 / 0.05)));
  --tw-drop-shadow: drop-shadow(var(--drop-shadow-xs));
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
drop_shadow_xs : Tailwind
drop_shadow_xs =
    Tailwind "drop-shadow-xs"

{-| --tw-duration: 100ms;
  transition-duration: 100ms;
-}
duration_100 : Tailwind
duration_100 =
    Tailwind "duration-100"

{-| --tw-duration: 1000ms;
  transition-duration: 1000ms;
-}
duration_1000 : Tailwind
duration_1000 =
    Tailwind "duration-1000"

{-| --tw-duration: 150ms;
  transition-duration: 150ms;
-}
duration_150 : Tailwind
duration_150 =
    Tailwind "duration-150"

{-| --tw-duration: 200ms;
  transition-duration: 200ms;
-}
duration_200 : Tailwind
duration_200 =
    Tailwind "duration-200"

{-| --tw-duration: 300ms;
  transition-duration: 300ms;
-}
duration_300 : Tailwind
duration_300 =
    Tailwind "duration-300"

{-| --tw-duration: 500ms;
  transition-duration: 500ms;
-}
duration_500 : Tailwind
duration_500 =
    Tailwind "duration-500"

{-| --tw-duration: 700ms;
  transition-duration: 700ms;
-}
duration_700 : Tailwind
duration_700 =
    Tailwind "duration-700"

{-| --tw-duration: 75ms;
  transition-duration: 75ms;
-}
duration_75 : Tailwind
duration_75 =
    Tailwind "duration-75"

{-| --tw-duration: initial;
-}
duration_initial : Tailwind
duration_initial =
    Tailwind "duration-initial"

{-| --tw-ease: var(--ease-in);
  transition-timing-function: var(--ease-in);
-}
ease_in : Tailwind
ease_in =
    Tailwind "ease-in"

{-| --tw-ease: var(--ease-in-out);
  transition-timing-function: var(--ease-in-out);
-}
ease_in_out : Tailwind
ease_in_out =
    Tailwind "ease-in-out"

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

{-| --tw-ease: var(--ease-out);
  transition-timing-function: var(--ease-out);
-}
ease_out : Tailwind
ease_out =
    Tailwind "ease-out"

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

{-| flex: 1;
-}
flex_1 : Tailwind
flex_1 =
    Tailwind "flex-1"

{-| flex: 10;
-}
flex_10 : Tailwind
flex_10 =
    Tailwind "flex-10"

{-| flex: 11;
-}
flex_11 : Tailwind
flex_11 =
    Tailwind "flex-11"

{-| flex: 12;
-}
flex_12 : Tailwind
flex_12 =
    Tailwind "flex-12"

{-| flex: 2;
-}
flex_2 : Tailwind
flex_2 =
    Tailwind "flex-2"

{-| flex: 3;
-}
flex_3 : Tailwind
flex_3 =
    Tailwind "flex-3"

{-| flex: 4;
-}
flex_4 : Tailwind
flex_4 =
    Tailwind "flex-4"

{-| flex: 5;
-}
flex_5 : Tailwind
flex_5 =
    Tailwind "flex-5"

{-| flex: 6;
-}
flex_6 : Tailwind
flex_6 =
    Tailwind "flex-6"

{-| flex: 7;
-}
flex_7 : Tailwind
flex_7 =
    Tailwind "flex-7"

{-| flex: 8;
-}
flex_8 : Tailwind
flex_8 =
    Tailwind "flex-8"

{-| flex: 9;
-}
flex_9 : Tailwind
flex_9 =
    Tailwind "flex-9"

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

{-| font-family: var(--font-mono);
-}
font_mono : Tailwind
font_mono =
    Tailwind "font-mono"

{-| font-family: var(--font-sans);
-}
font_sans : Tailwind
font_sans =
    Tailwind "font-sans"

{-| font-family: var(--font-serif);
-}
font_serif : Tailwind
font_serif =
    Tailwind "font-serif"

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

{-| --tw-grayscale: grayscale(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
grayscale : Tailwind
grayscale =
    Tailwind "grayscale"

{-| --tw-grayscale: grayscale(0%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
grayscale_0 : Tailwind
grayscale_0 =
    Tailwind "grayscale-0"

{-| --tw-grayscale: grayscale(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
grayscale_100 : Tailwind
grayscale_100 =
    Tailwind "grayscale-100"

{-| --tw-grayscale: grayscale(25%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
grayscale_25 : Tailwind
grayscale_25 =
    Tailwind "grayscale-25"

{-| --tw-grayscale: grayscale(50%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
grayscale_50 : Tailwind
grayscale_50 =
    Tailwind "grayscale-50"

{-| --tw-grayscale: grayscale(75%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
grayscale_75 : Tailwind
grayscale_75 =
    Tailwind "grayscale-75"

{-| display: grid;
-}
grid : Tailwind
grid =
    Tailwind "grid"

{-| grid-template-columns: repeat(1, minmax(0, 1fr));
-}
grid_cols_1 : Tailwind
grid_cols_1 =
    Tailwind "grid-cols-1"

{-| grid-template-columns: repeat(10, minmax(0, 1fr));
-}
grid_cols_10 : Tailwind
grid_cols_10 =
    Tailwind "grid-cols-10"

{-| grid-template-columns: repeat(11, minmax(0, 1fr));
-}
grid_cols_11 : Tailwind
grid_cols_11 =
    Tailwind "grid-cols-11"

{-| grid-template-columns: repeat(12, minmax(0, 1fr));
-}
grid_cols_12 : Tailwind
grid_cols_12 =
    Tailwind "grid-cols-12"

{-| grid-template-columns: repeat(2, minmax(0, 1fr));
-}
grid_cols_2 : Tailwind
grid_cols_2 =
    Tailwind "grid-cols-2"

{-| grid-template-columns: repeat(3, minmax(0, 1fr));
-}
grid_cols_3 : Tailwind
grid_cols_3 =
    Tailwind "grid-cols-3"

{-| grid-template-columns: repeat(4, minmax(0, 1fr));
-}
grid_cols_4 : Tailwind
grid_cols_4 =
    Tailwind "grid-cols-4"

{-| grid-template-columns: repeat(5, minmax(0, 1fr));
-}
grid_cols_5 : Tailwind
grid_cols_5 =
    Tailwind "grid-cols-5"

{-| grid-template-columns: repeat(6, minmax(0, 1fr));
-}
grid_cols_6 : Tailwind
grid_cols_6 =
    Tailwind "grid-cols-6"

{-| grid-template-columns: repeat(7, minmax(0, 1fr));
-}
grid_cols_7 : Tailwind
grid_cols_7 =
    Tailwind "grid-cols-7"

{-| grid-template-columns: repeat(8, minmax(0, 1fr));
-}
grid_cols_8 : Tailwind
grid_cols_8 =
    Tailwind "grid-cols-8"

{-| grid-template-columns: repeat(9, minmax(0, 1fr));
-}
grid_cols_9 : Tailwind
grid_cols_9 =
    Tailwind "grid-cols-9"

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

{-| grid-template-rows: repeat(1, minmax(0, 1fr));
-}
grid_rows_1 : Tailwind
grid_rows_1 =
    Tailwind "grid-rows-1"

{-| grid-template-rows: repeat(10, minmax(0, 1fr));
-}
grid_rows_10 : Tailwind
grid_rows_10 =
    Tailwind "grid-rows-10"

{-| grid-template-rows: repeat(11, minmax(0, 1fr));
-}
grid_rows_11 : Tailwind
grid_rows_11 =
    Tailwind "grid-rows-11"

{-| grid-template-rows: repeat(12, minmax(0, 1fr));
-}
grid_rows_12 : Tailwind
grid_rows_12 =
    Tailwind "grid-rows-12"

{-| grid-template-rows: repeat(2, minmax(0, 1fr));
-}
grid_rows_2 : Tailwind
grid_rows_2 =
    Tailwind "grid-rows-2"

{-| grid-template-rows: repeat(3, minmax(0, 1fr));
-}
grid_rows_3 : Tailwind
grid_rows_3 =
    Tailwind "grid-rows-3"

{-| grid-template-rows: repeat(4, minmax(0, 1fr));
-}
grid_rows_4 : Tailwind
grid_rows_4 =
    Tailwind "grid-rows-4"

{-| grid-template-rows: repeat(5, minmax(0, 1fr));
-}
grid_rows_5 : Tailwind
grid_rows_5 =
    Tailwind "grid-rows-5"

{-| grid-template-rows: repeat(6, minmax(0, 1fr));
-}
grid_rows_6 : Tailwind
grid_rows_6 =
    Tailwind "grid-rows-6"

{-| grid-template-rows: repeat(7, minmax(0, 1fr));
-}
grid_rows_7 : Tailwind
grid_rows_7 =
    Tailwind "grid-rows-7"

{-| grid-template-rows: repeat(8, minmax(0, 1fr));
-}
grid_rows_8 : Tailwind
grid_rows_8 =
    Tailwind "grid-rows-8"

{-| grid-template-rows: repeat(9, minmax(0, 1fr));
-}
grid_rows_9 : Tailwind
grid_rows_9 =
    Tailwind "grid-rows-9"

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

{-| flex-grow: 1;
-}
grow : Tailwind
grow =
    Tailwind "grow"

{-| flex-grow: 0;
-}
grow_0 : Tailwind
grow_0 =
    Tailwind "grow-0"

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

{-| height: 1lh;
-}
h_lh : Tailwind
h_lh =
    Tailwind "h-lh"

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

{-| --tw-hue-rotate: hue-rotate(0deg);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
hue_rotate_0 : Tailwind
hue_rotate_0 =
    Tailwind "hue-rotate-0"

{-| --tw-hue-rotate: hue-rotate(15deg);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
hue_rotate_15 : Tailwind
hue_rotate_15 =
    Tailwind "hue-rotate-15"

{-| --tw-hue-rotate: hue-rotate(180deg);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
hue_rotate_180 : Tailwind
hue_rotate_180 =
    Tailwind "hue-rotate-180"

{-| --tw-hue-rotate: hue-rotate(30deg);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
hue_rotate_30 : Tailwind
hue_rotate_30 =
    Tailwind "hue-rotate-30"

{-| --tw-hue-rotate: hue-rotate(60deg);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
hue_rotate_60 : Tailwind
hue_rotate_60 =
    Tailwind "hue-rotate-60"

{-| --tw-hue-rotate: hue-rotate(90deg);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
hue_rotate_90 : Tailwind
hue_rotate_90 =
    Tailwind "hue-rotate-90"

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

{-| inline-size: auto;
-}
inline_auto : Tailwind
inline_auto =
    Tailwind "inline-auto"

{-| display: inline-block;
-}
inline_block : Tailwind
inline_block =
    Tailwind "inline-block"

{-| inline-size: 100dvw;
-}
inline_dvw : Tailwind
inline_dvw =
    Tailwind "inline-dvw"

{-| inline-size: fit-content;
-}
inline_fit : Tailwind
inline_fit =
    Tailwind "inline-fit"

{-| display: inline-flex;
-}
inline_flex : Tailwind
inline_flex =
    Tailwind "inline-flex"

{-| inline-size: 100%;
-}
inline_full : Tailwind
inline_full =
    Tailwind "inline-full"

{-| display: inline-grid;
-}
inline_grid : Tailwind
inline_grid =
    Tailwind "inline-grid"

{-| inline-size: 100lvw;
-}
inline_lvw : Tailwind
inline_lvw =
    Tailwind "inline-lvw"

{-| inline-size: max-content;
-}
inline_max : Tailwind
inline_max =
    Tailwind "inline-max"

{-| inline-size: min-content;
-}
inline_min : Tailwind
inline_min =
    Tailwind "inline-min"

{-| inline-size: 1px;
-}
inline_px : Tailwind
inline_px =
    Tailwind "inline-px"

{-| inline-size: 100vw;
-}
inline_screen : Tailwind
inline_screen =
    Tailwind "inline-screen"

{-| inline-size: 100svw;
-}
inline_svw : Tailwind
inline_svw =
    Tailwind "inline-svw"

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

{-| inset-block-end: auto;
-}
inset_be_auto : Tailwind
inset_be_auto =
    Tailwind "inset-be-auto"

{-| inset-block-end: 100%;
-}
inset_be_full : Tailwind
inset_be_full =
    Tailwind "inset-be-full"

{-| inset-block-end: 1px;
-}
inset_be_px : Tailwind
inset_be_px =
    Tailwind "inset-be-px"

{-| inset-block-start: auto;
-}
inset_bs_auto : Tailwind
inset_bs_auto =
    Tailwind "inset-bs-auto"

{-| inset-block-start: 100%;
-}
inset_bs_full : Tailwind
inset_bs_full =
    Tailwind "inset-bs-full"

{-| inset-block-start: 1px;
-}
inset_bs_px : Tailwind
inset_bs_px =
    Tailwind "inset-bs-px"

{-| inset-inline-end: auto;
-}
inset_e_auto : Tailwind
inset_e_auto =
    Tailwind "inset-e-auto"

{-| inset-inline-end: 100%;
-}
inset_e_full : Tailwind
inset_e_full =
    Tailwind "inset-e-full"

{-| inset-inline-end: 1px;
-}
inset_e_px : Tailwind
inset_e_px =
    Tailwind "inset-e-px"

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

{-| --tw-inset-ring-shadow: inset 0 0 0 1px var(--tw-inset-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_ring : Tailwind
inset_ring =
    Tailwind "inset-ring"

{-| --tw-inset-ring-shadow: inset 0 0 0 0px var(--tw-inset-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_ring_0 : Tailwind
inset_ring_0 =
    Tailwind "inset-ring-0"

{-| --tw-inset-ring-shadow: inset 0 0 0 1px var(--tw-inset-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_ring_1 : Tailwind
inset_ring_1 =
    Tailwind "inset-ring-1"

{-| --tw-inset-ring-shadow: inset 0 0 0 2px var(--tw-inset-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_ring_2 : Tailwind
inset_ring_2 =
    Tailwind "inset-ring-2"

{-| --tw-inset-ring-shadow: inset 0 0 0 4px var(--tw-inset-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_ring_4 : Tailwind
inset_ring_4 =
    Tailwind "inset-ring-4"

{-| --tw-inset-ring-shadow: inset 0 0 0 8px var(--tw-inset-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_ring_8 : Tailwind
inset_ring_8 =
    Tailwind "inset-ring-8"

{-| inset-inline-start: auto;
-}
inset_s_auto : Tailwind
inset_s_auto =
    Tailwind "inset-s-auto"

{-| inset-inline-start: 100%;
-}
inset_s_full : Tailwind
inset_s_full =
    Tailwind "inset-s-full"

{-| inset-inline-start: 1px;
-}
inset_s_px : Tailwind
inset_s_px =
    Tailwind "inset-s-px"

{-| --tw-inset-shadow: inset 0 1px var(--tw-inset-shadow-color, rgb(0 0 0 / 0.05));
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_shadow_2xs : Tailwind
inset_shadow_2xs =
    Tailwind "inset-shadow-2xs"

{-| --tw-inset-shadow-color: initial;
-}
inset_shadow_initial : Tailwind
inset_shadow_initial =
    Tailwind "inset-shadow-initial"

{-| --tw-inset-shadow: 0 0 #0000;
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_shadow_none : Tailwind
inset_shadow_none =
    Tailwind "inset-shadow-none"

{-| --tw-inset-shadow: inset 0 2px 4px var(--tw-inset-shadow-color, rgb(0 0 0 / 0.05));
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_shadow_sm : Tailwind
inset_shadow_sm =
    Tailwind "inset-shadow-sm"

{-| --tw-inset-shadow: inset 0 1px 1px var(--tw-inset-shadow-color, rgb(0 0 0 / 0.05));
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
inset_shadow_xs : Tailwind
inset_shadow_xs =
    Tailwind "inset-shadow-xs"

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

{-| --tw-invert: invert(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
invert : Tailwind
invert =
    Tailwind "invert"

{-| --tw-invert: invert(0%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
invert_0 : Tailwind
invert_0 =
    Tailwind "invert-0"

{-| --tw-invert: invert(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
invert_100 : Tailwind
invert_100 =
    Tailwind "invert-100"

{-| --tw-invert: invert(25%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
invert_25 : Tailwind
invert_25 =
    Tailwind "invert-25"

{-| --tw-invert: invert(50%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
invert_50 : Tailwind
invert_50 =
    Tailwind "invert-50"

{-| --tw-invert: invert(75%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
invert_75 : Tailwind
invert_75 =
    Tailwind "invert-75"

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

{-| align-items: last baseline;
-}
items_baseline_last : Tailwind
items_baseline_last =
    Tailwind "items-baseline-last"

{-| align-items: center;
-}
items_center : Tailwind
items_center =
    Tailwind "items-center"

{-| align-items: safe center;
-}
items_center_safe : Tailwind
items_center_safe =
    Tailwind "items-center-safe"

{-| align-items: flex-end;
-}
items_end : Tailwind
items_end =
    Tailwind "items-end"

{-| align-items: safe flex-end;
-}
items_end_safe : Tailwind
items_end_safe =
    Tailwind "items-end-safe"

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

{-| justify-content: safe center;
-}
justify_center_safe : Tailwind
justify_center_safe =
    Tailwind "justify-center-safe"

{-| justify-content: flex-end;
-}
justify_end : Tailwind
justify_end =
    Tailwind "justify-end"

{-| justify-content: safe flex-end;
-}
justify_end_safe : Tailwind
justify_end_safe =
    Tailwind "justify-end-safe"

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

{-| justify-items: safe center;
-}
justify_items_center_safe : Tailwind
justify_items_center_safe =
    Tailwind "justify-items-center-safe"

{-| justify-items: end;
-}
justify_items_end : Tailwind
justify_items_end =
    Tailwind "justify-items-end"

{-| justify-items: safe end;
-}
justify_items_end_safe : Tailwind
justify_items_end_safe =
    Tailwind "justify-items-end-safe"

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

{-| justify-self: safe center;
-}
justify_self_center_safe : Tailwind
justify_self_center_safe =
    Tailwind "justify-self-center-safe"

{-| justify-self: flex-end;
-}
justify_self_end : Tailwind
justify_self_end =
    Tailwind "justify-self-end"

{-| justify-self: safe flex-end;
-}
justify_self_end_safe : Tailwind
justify_self_end_safe =
    Tailwind "justify-self-end-safe"

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

{-| --tw-leading: var(--leading-loose);
  line-height: var(--leading-loose);
-}
leading_loose : Tailwind
leading_loose =
    Tailwind "leading-loose"

{-| --tw-leading: 1;
  line-height: 1;
-}
leading_none : Tailwind
leading_none =
    Tailwind "leading-none"

{-| --tw-leading: var(--leading-normal);
  line-height: var(--leading-normal);
-}
leading_normal : Tailwind
leading_normal =
    Tailwind "leading-normal"

{-| --tw-leading: 1px;
  line-height: 1px;
-}
leading_px : Tailwind
leading_px =
    Tailwind "leading-px"

{-| --tw-leading: var(--leading-relaxed);
  line-height: var(--leading-relaxed);
-}
leading_relaxed : Tailwind
leading_relaxed =
    Tailwind "leading-relaxed"

{-| --tw-leading: var(--leading-snug);
  line-height: var(--leading-snug);
-}
leading_snug : Tailwind
leading_snug =
    Tailwind "leading-snug"

{-| --tw-leading: var(--leading-tight);
  line-height: var(--leading-tight);
-}
leading_tight : Tailwind
leading_tight =
    Tailwind "leading-tight"

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

{-| overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 1;
-}
line_clamp_1 : Tailwind
line_clamp_1 =
    Tailwind "line-clamp-1"

{-| overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
-}
line_clamp_2 : Tailwind
line_clamp_2 =
    Tailwind "line-clamp-2"

{-| overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
-}
line_clamp_3 : Tailwind
line_clamp_3 =
    Tailwind "line-clamp-3"

{-| overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 4;
-}
line_clamp_4 : Tailwind
line_clamp_4 =
    Tailwind "line-clamp-4"

{-| overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 5;
-}
line_clamp_5 : Tailwind
line_clamp_5 =
    Tailwind "line-clamp-5"

{-| overflow: hidden;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 6;
-}
line_clamp_6 : Tailwind
line_clamp_6 =
    Tailwind "line-clamp-6"

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

{-| mask-composite: add;
-}
mask_add : Tailwind
mask_add =
    Tailwind "mask-add"

{-| mask-mode: alpha;
-}
mask_alpha : Tailwind
mask_alpha =
    Tailwind "mask-alpha"

{-| mask-size: auto;
-}
mask_auto : Tailwind
mask_auto =
    Tailwind "mask-auto"

{-| mask-position: bottom;
-}
mask_bottom : Tailwind
mask_bottom =
    Tailwind "mask-bottom"

{-| mask-position: left bottom;
-}
mask_bottom_left : Tailwind
mask_bottom_left =
    Tailwind "mask-bottom-left"

{-| mask-position: right bottom;
-}
mask_bottom_right : Tailwind
mask_bottom_right =
    Tailwind "mask-bottom-right"

{-| mask-position: center;
-}
mask_center : Tailwind
mask_center =
    Tailwind "mask-center"

{-| --tw-mask-radial-shape: circle;
-}
mask_circle : Tailwind
mask_circle =
    Tailwind "mask-circle"

{-| mask-clip: border-box;
-}
mask_clip_border : Tailwind
mask_clip_border =
    Tailwind "mask-clip-border"

{-| mask-clip: content-box;
-}
mask_clip_content : Tailwind
mask_clip_content =
    Tailwind "mask-clip-content"

{-| mask-clip: fill-box;
-}
mask_clip_fill : Tailwind
mask_clip_fill =
    Tailwind "mask-clip-fill"

{-| mask-clip: padding-box;
-}
mask_clip_padding : Tailwind
mask_clip_padding =
    Tailwind "mask-clip-padding"

{-| mask-clip: stroke-box;
-}
mask_clip_stroke : Tailwind
mask_clip_stroke =
    Tailwind "mask-clip-stroke"

{-| mask-clip: view-box;
-}
mask_clip_view : Tailwind
mask_clip_view =
    Tailwind "mask-clip-view"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 0);
-}
mask_conic_0 : Tailwind
mask_conic_0 =
    Tailwind "mask-conic-0"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 1);
-}
mask_conic_1 : Tailwind
mask_conic_1 =
    Tailwind "mask-conic-1"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 12);
-}
mask_conic_12 : Tailwind
mask_conic_12 =
    Tailwind "mask-conic-12"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 180);
-}
mask_conic_180 : Tailwind
mask_conic_180 =
    Tailwind "mask-conic-180"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 2);
-}
mask_conic_2 : Tailwind
mask_conic_2 =
    Tailwind "mask-conic-2"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 3);
-}
mask_conic_3 : Tailwind
mask_conic_3 =
    Tailwind "mask-conic-3"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 45);
-}
mask_conic_45 : Tailwind
mask_conic_45 =
    Tailwind "mask-conic-45"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 6);
-}
mask_conic_6 : Tailwind
mask_conic_6 =
    Tailwind "mask-conic-6"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-conic: conic-gradient(var(--tw-mask-conic-stops, var(--tw-mask-conic-position)));
  --tw-mask-conic-position: calc(1deg * 90);
-}
mask_conic_90 : Tailwind
mask_conic_90 =
    Tailwind "mask-conic-90"

{-| mask-size: contain;
-}
mask_contain : Tailwind
mask_contain =
    Tailwind "mask-contain"

{-| mask-size: cover;
-}
mask_cover : Tailwind
mask_cover =
    Tailwind "mask-cover"

{-| --tw-mask-radial-shape: ellipse;
-}
mask_ellipse : Tailwind
mask_ellipse =
    Tailwind "mask-ellipse"

{-| mask-composite: exclude;
-}
mask_exclude : Tailwind
mask_exclude =
    Tailwind "mask-exclude"

{-| mask-composite: intersect;
-}
mask_intersect : Tailwind
mask_intersect =
    Tailwind "mask-intersect"

{-| mask-position: left;
-}
mask_left : Tailwind
mask_left =
    Tailwind "mask-left"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 0);
-}
mask_linear_0 : Tailwind
mask_linear_0 =
    Tailwind "mask-linear-0"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 1);
-}
mask_linear_1 : Tailwind
mask_linear_1 =
    Tailwind "mask-linear-1"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 12);
-}
mask_linear_12 : Tailwind
mask_linear_12 =
    Tailwind "mask-linear-12"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 180);
-}
mask_linear_180 : Tailwind
mask_linear_180 =
    Tailwind "mask-linear-180"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 2);
-}
mask_linear_2 : Tailwind
mask_linear_2 =
    Tailwind "mask-linear-2"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 3);
-}
mask_linear_3 : Tailwind
mask_linear_3 =
    Tailwind "mask-linear-3"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 45);
-}
mask_linear_45 : Tailwind
mask_linear_45 =
    Tailwind "mask-linear-45"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 6);
-}
mask_linear_6 : Tailwind
mask_linear_6 =
    Tailwind "mask-linear-6"

{-| mask-image: var(--tw-mask-linear), var(--tw-mask-radial), var(--tw-mask-conic);
  mask-composite: intersect;
  --tw-mask-linear: linear-gradient(var(--tw-mask-linear-stops, var(--tw-mask-linear-position)));
  --tw-mask-linear-position: calc(1deg * 90);
-}
mask_linear_90 : Tailwind
mask_linear_90 =
    Tailwind "mask-linear-90"

{-| mask-mode: luminance;
-}
mask_luminance : Tailwind
mask_luminance =
    Tailwind "mask-luminance"

{-| mask-mode: match-source;
-}
mask_match : Tailwind
mask_match =
    Tailwind "mask-match"

{-| mask-clip: no-clip;
-}
mask_no_clip : Tailwind
mask_no_clip =
    Tailwind "mask-no-clip"

{-| mask-repeat: no-repeat;
-}
mask_no_repeat : Tailwind
mask_no_repeat =
    Tailwind "mask-no-repeat"

{-| mask-image: none;
-}
mask_none : Tailwind
mask_none =
    Tailwind "mask-none"

{-| mask-origin: border-box;
-}
mask_origin_border : Tailwind
mask_origin_border =
    Tailwind "mask-origin-border"

{-| mask-origin: content-box;
-}
mask_origin_content : Tailwind
mask_origin_content =
    Tailwind "mask-origin-content"

{-| mask-origin: fill-box;
-}
mask_origin_fill : Tailwind
mask_origin_fill =
    Tailwind "mask-origin-fill"

{-| mask-origin: padding-box;
-}
mask_origin_padding : Tailwind
mask_origin_padding =
    Tailwind "mask-origin-padding"

{-| mask-origin: stroke-box;
-}
mask_origin_stroke : Tailwind
mask_origin_stroke =
    Tailwind "mask-origin-stroke"

{-| mask-origin: view-box;
-}
mask_origin_view : Tailwind
mask_origin_view =
    Tailwind "mask-origin-view"

{-| --tw-mask-radial-position: bottom;
-}
mask_radial_at_bottom : Tailwind
mask_radial_at_bottom =
    Tailwind "mask-radial-at-bottom"

{-| --tw-mask-radial-position: bottom left;
-}
mask_radial_at_bottom_left : Tailwind
mask_radial_at_bottom_left =
    Tailwind "mask-radial-at-bottom-left"

{-| --tw-mask-radial-position: bottom right;
-}
mask_radial_at_bottom_right : Tailwind
mask_radial_at_bottom_right =
    Tailwind "mask-radial-at-bottom-right"

{-| --tw-mask-radial-position: center;
-}
mask_radial_at_center : Tailwind
mask_radial_at_center =
    Tailwind "mask-radial-at-center"

{-| --tw-mask-radial-position: left;
-}
mask_radial_at_left : Tailwind
mask_radial_at_left =
    Tailwind "mask-radial-at-left"

{-| --tw-mask-radial-position: right;
-}
mask_radial_at_right : Tailwind
mask_radial_at_right =
    Tailwind "mask-radial-at-right"

{-| --tw-mask-radial-position: top;
-}
mask_radial_at_top : Tailwind
mask_radial_at_top =
    Tailwind "mask-radial-at-top"

{-| --tw-mask-radial-position: top left;
-}
mask_radial_at_top_left : Tailwind
mask_radial_at_top_left =
    Tailwind "mask-radial-at-top-left"

{-| --tw-mask-radial-position: top right;
-}
mask_radial_at_top_right : Tailwind
mask_radial_at_top_right =
    Tailwind "mask-radial-at-top-right"

{-| --tw-mask-radial-size: closest-corner;
-}
mask_radial_closest_corner : Tailwind
mask_radial_closest_corner =
    Tailwind "mask-radial-closest-corner"

{-| --tw-mask-radial-size: closest-side;
-}
mask_radial_closest_side : Tailwind
mask_radial_closest_side =
    Tailwind "mask-radial-closest-side"

{-| --tw-mask-radial-size: farthest-corner;
-}
mask_radial_farthest_corner : Tailwind
mask_radial_farthest_corner =
    Tailwind "mask-radial-farthest-corner"

{-| --tw-mask-radial-size: farthest-side;
-}
mask_radial_farthest_side : Tailwind
mask_radial_farthest_side =
    Tailwind "mask-radial-farthest-side"

{-| mask-repeat: repeat;
-}
mask_repeat : Tailwind
mask_repeat =
    Tailwind "mask-repeat"

{-| mask-repeat: round;
-}
mask_repeat_round : Tailwind
mask_repeat_round =
    Tailwind "mask-repeat-round"

{-| mask-repeat: space;
-}
mask_repeat_space : Tailwind
mask_repeat_space =
    Tailwind "mask-repeat-space"

{-| mask-repeat: repeat-x;
-}
mask_repeat_x : Tailwind
mask_repeat_x =
    Tailwind "mask-repeat-x"

{-| mask-repeat: repeat-y;
-}
mask_repeat_y : Tailwind
mask_repeat_y =
    Tailwind "mask-repeat-y"

{-| mask-position: right;
-}
mask_right : Tailwind
mask_right =
    Tailwind "mask-right"

{-| mask-composite: subtract;
-}
mask_subtract : Tailwind
mask_subtract =
    Tailwind "mask-subtract"

{-| mask-position: top;
-}
mask_top : Tailwind
mask_top =
    Tailwind "mask-top"

{-| mask-position: left top;
-}
mask_top_left : Tailwind
mask_top_left =
    Tailwind "mask-top-left"

{-| mask-position: right top;
-}
mask_top_right : Tailwind
mask_top_right =
    Tailwind "mask-top-right"

{-| mask-type: alpha;
-}
mask_type_alpha : Tailwind
mask_type_alpha =
    Tailwind "mask-type-alpha"

{-| mask-type: luminance;
-}
mask_type_luminance : Tailwind
mask_type_luminance =
    Tailwind "mask-type-luminance"

{-| max-block-size: 100dvh;
-}
max_block_dvh : Tailwind
max_block_dvh =
    Tailwind "max-block-dvh"

{-| max-block-size: fit-content;
-}
max_block_fit : Tailwind
max_block_fit =
    Tailwind "max-block-fit"

{-| max-block-size: 100%;
-}
max_block_full : Tailwind
max_block_full =
    Tailwind "max-block-full"

{-| max-block-size: 1lh;
-}
max_block_lh : Tailwind
max_block_lh =
    Tailwind "max-block-lh"

{-| max-block-size: 100lvh;
-}
max_block_lvh : Tailwind
max_block_lvh =
    Tailwind "max-block-lvh"

{-| max-block-size: max-content;
-}
max_block_max : Tailwind
max_block_max =
    Tailwind "max-block-max"

{-| max-block-size: min-content;
-}
max_block_min : Tailwind
max_block_min =
    Tailwind "max-block-min"

{-| max-block-size: none;
-}
max_block_none : Tailwind
max_block_none =
    Tailwind "max-block-none"

{-| max-block-size: 1px;
-}
max_block_px : Tailwind
max_block_px =
    Tailwind "max-block-px"

{-| max-block-size: 100vh;
-}
max_block_screen : Tailwind
max_block_screen =
    Tailwind "max-block-screen"

{-| max-block-size: 100svh;
-}
max_block_svh : Tailwind
max_block_svh =
    Tailwind "max-block-svh"

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

{-| max-height: 1lh;
-}
max_h_lh : Tailwind
max_h_lh =
    Tailwind "max-h-lh"

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

{-| max-inline-size: 100dvw;
-}
max_inline_dvw : Tailwind
max_inline_dvw =
    Tailwind "max-inline-dvw"

{-| max-inline-size: fit-content;
-}
max_inline_fit : Tailwind
max_inline_fit =
    Tailwind "max-inline-fit"

{-| max-inline-size: 100%;
-}
max_inline_full : Tailwind
max_inline_full =
    Tailwind "max-inline-full"

{-| max-inline-size: 100lvw;
-}
max_inline_lvw : Tailwind
max_inline_lvw =
    Tailwind "max-inline-lvw"

{-| max-inline-size: max-content;
-}
max_inline_max : Tailwind
max_inline_max =
    Tailwind "max-inline-max"

{-| max-inline-size: min-content;
-}
max_inline_min : Tailwind
max_inline_min =
    Tailwind "max-inline-min"

{-| max-inline-size: none;
-}
max_inline_none : Tailwind
max_inline_none =
    Tailwind "max-inline-none"

{-| max-inline-size: 1px;
-}
max_inline_px : Tailwind
max_inline_px =
    Tailwind "max-inline-px"

{-| max-inline-size: 100vw;
-}
max_inline_screen : Tailwind
max_inline_screen =
    Tailwind "max-inline-screen"

{-| max-inline-size: 100svw;
-}
max_inline_svw : Tailwind
max_inline_svw =
    Tailwind "max-inline-svw"

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

{-| margin-block-end: auto;
-}
mbe_auto : Tailwind
mbe_auto =
    Tailwind "mbe-auto"

{-| margin-block-end: 1px;
-}
mbe_px : Tailwind
mbe_px =
    Tailwind "mbe-px"

{-| margin-block-start: auto;
-}
mbs_auto : Tailwind
mbs_auto =
    Tailwind "mbs-auto"

{-| margin-block-start: 1px;
-}
mbs_px : Tailwind
mbs_px =
    Tailwind "mbs-px"

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

{-| min-block-size: auto;
-}
min_block_auto : Tailwind
min_block_auto =
    Tailwind "min-block-auto"

{-| min-block-size: 100dvh;
-}
min_block_dvh : Tailwind
min_block_dvh =
    Tailwind "min-block-dvh"

{-| min-block-size: fit-content;
-}
min_block_fit : Tailwind
min_block_fit =
    Tailwind "min-block-fit"

{-| min-block-size: 100%;
-}
min_block_full : Tailwind
min_block_full =
    Tailwind "min-block-full"

{-| min-block-size: 1lh;
-}
min_block_lh : Tailwind
min_block_lh =
    Tailwind "min-block-lh"

{-| min-block-size: 100lvh;
-}
min_block_lvh : Tailwind
min_block_lvh =
    Tailwind "min-block-lvh"

{-| min-block-size: max-content;
-}
min_block_max : Tailwind
min_block_max =
    Tailwind "min-block-max"

{-| min-block-size: min-content;
-}
min_block_min : Tailwind
min_block_min =
    Tailwind "min-block-min"

{-| min-block-size: 1px;
-}
min_block_px : Tailwind
min_block_px =
    Tailwind "min-block-px"

{-| min-block-size: 100vh;
-}
min_block_screen : Tailwind
min_block_screen =
    Tailwind "min-block-screen"

{-| min-block-size: 100svh;
-}
min_block_svh : Tailwind
min_block_svh =
    Tailwind "min-block-svh"

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

{-| min-height: 1lh;
-}
min_h_lh : Tailwind
min_h_lh =
    Tailwind "min-h-lh"

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

{-| min-inline-size: auto;
-}
min_inline_auto : Tailwind
min_inline_auto =
    Tailwind "min-inline-auto"

{-| min-inline-size: 100dvw;
-}
min_inline_dvw : Tailwind
min_inline_dvw =
    Tailwind "min-inline-dvw"

{-| min-inline-size: fit-content;
-}
min_inline_fit : Tailwind
min_inline_fit =
    Tailwind "min-inline-fit"

{-| min-inline-size: 100%;
-}
min_inline_full : Tailwind
min_inline_full =
    Tailwind "min-inline-full"

{-| min-inline-size: 100lvw;
-}
min_inline_lvw : Tailwind
min_inline_lvw =
    Tailwind "min-inline-lvw"

{-| min-inline-size: max-content;
-}
min_inline_max : Tailwind
min_inline_max =
    Tailwind "min-inline-max"

{-| min-inline-size: min-content;
-}
min_inline_min : Tailwind
min_inline_min =
    Tailwind "min-inline-min"

{-| min-inline-size: 1px;
-}
min_inline_px : Tailwind
min_inline_px =
    Tailwind "min-inline-px"

{-| min-inline-size: 100vw;
-}
min_inline_screen : Tailwind
min_inline_screen =
    Tailwind "min-inline-screen"

{-| min-inline-size: 100svw;
-}
min_inline_svw : Tailwind
min_inline_svw =
    Tailwind "min-inline-svw"

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
  clip-path: none;
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

{-| object-position: left bottom;
-}
object_bottom_left : Tailwind
object_bottom_left =
    Tailwind "object-bottom-left"

{-| object-position: right bottom;
-}
object_bottom_right : Tailwind
object_bottom_right =
    Tailwind "object-bottom-right"

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

{-| object-position: left top;
-}
object_top_left : Tailwind
object_top_left =
    Tailwind "object-top-left"

{-| object-position: right top;
-}
object_top_right : Tailwind
object_top_right =
    Tailwind "object-top-right"

{-| --tw-numeric-figure: oldstyle-nums;
  font-variant-numeric: var(--tw-ordinal,) var(--tw-slashed-zero,) var(--tw-numeric-figure,) var(--tw-numeric-spacing,) var(--tw-numeric-fraction,);
-}
oldstyle_nums : Tailwind
oldstyle_nums =
    Tailwind "oldstyle-nums"

{-| order: 1;
-}
order_1 : Tailwind
order_1 =
    Tailwind "order-1"

{-| order: 10;
-}
order_10 : Tailwind
order_10 =
    Tailwind "order-10"

{-| order: 11;
-}
order_11 : Tailwind
order_11 =
    Tailwind "order-11"

{-| order: 12;
-}
order_12 : Tailwind
order_12 =
    Tailwind "order-12"

{-| order: 2;
-}
order_2 : Tailwind
order_2 =
    Tailwind "order-2"

{-| order: 3;
-}
order_3 : Tailwind
order_3 =
    Tailwind "order-3"

{-| order: 4;
-}
order_4 : Tailwind
order_4 =
    Tailwind "order-4"

{-| order: 5;
-}
order_5 : Tailwind
order_5 =
    Tailwind "order-5"

{-| order: 6;
-}
order_6 : Tailwind
order_6 =
    Tailwind "order-6"

{-| order: 7;
-}
order_7 : Tailwind
order_7 =
    Tailwind "order-7"

{-| order: 8;
-}
order_8 : Tailwind
order_8 =
    Tailwind "order-8"

{-| order: 9;
-}
order_9 : Tailwind
order_9 =
    Tailwind "order-9"

{-| order: -9999;
-}
order_first : Tailwind
order_first =
    Tailwind "order-first"

{-| order: 9999;
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

{-| transform-origin: 0 100%;
-}
origin_bottom_left : Tailwind
origin_bottom_left =
    Tailwind "origin-bottom-left"

{-| transform-origin: 100% 100%;
-}
origin_bottom_right : Tailwind
origin_bottom_right =
    Tailwind "origin-bottom-right"

{-| transform-origin: center;
-}
origin_center : Tailwind
origin_center =
    Tailwind "origin-center"

{-| transform-origin: 0;
-}
origin_left : Tailwind
origin_left =
    Tailwind "origin-left"

{-| transform-origin: 100%;
-}
origin_right : Tailwind
origin_right =
    Tailwind "origin-right"

{-| transform-origin: top;
-}
origin_top : Tailwind
origin_top =
    Tailwind "origin-top"

{-| transform-origin: 0 0;
-}
origin_top_left : Tailwind
origin_top_left =
    Tailwind "origin-top-left"

{-| transform-origin: 100% 0;
-}
origin_top_right : Tailwind
origin_top_right =
    Tailwind "origin-top-right"

{-| outline-style: var(--tw-outline-style);
  outline-width: 1px;
-}
outline : Tailwind
outline =
    Tailwind "outline"

{-| outline-style: var(--tw-outline-style);
  outline-width: 0px;
-}
outline_0 : Tailwind
outline_0 =
    Tailwind "outline-0"

{-| outline-style: var(--tw-outline-style);
  outline-width: 1px;
-}
outline_1 : Tailwind
outline_1 =
    Tailwind "outline-1"

{-| outline-style: var(--tw-outline-style);
  outline-width: 2px;
-}
outline_2 : Tailwind
outline_2 =
    Tailwind "outline-2"

{-| outline-style: var(--tw-outline-style);
  outline-width: 4px;
-}
outline_4 : Tailwind
outline_4 =
    Tailwind "outline-4"

{-| outline-style: var(--tw-outline-style);
  outline-width: 8px;
-}
outline_8 : Tailwind
outline_8 =
    Tailwind "outline-8"

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

{-| --tw-outline-style: none;
  outline-style: none;
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

{-| outline-offset: 0px;
-}
outline_offset_0 : Tailwind
outline_offset_0 =
    Tailwind "outline-offset-0"

{-| outline-offset: 1px;
-}
outline_offset_1 : Tailwind
outline_offset_1 =
    Tailwind "outline-offset-1"

{-| outline-offset: 2px;
-}
outline_offset_2 : Tailwind
outline_offset_2 =
    Tailwind "outline-offset-2"

{-| outline-offset: 4px;
-}
outline_offset_4 : Tailwind
outline_offset_4 =
    Tailwind "outline-offset-4"

{-| outline-offset: 8px;
-}
outline_offset_8 : Tailwind
outline_offset_8 =
    Tailwind "outline-offset-8"

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

{-| padding-block-end: 1px;
-}
pbe_px : Tailwind
pbe_px =
    Tailwind "pbe-px"

{-| padding-block-start: 1px;
-}
pbs_px : Tailwind
pbs_px =
    Tailwind "pbs-px"

{-| padding-inline-end: 1px;
-}
pe_px : Tailwind
pe_px =
    Tailwind "pe-px"

{-| perspective: var(--perspective-distant);
-}
perspective_distant : Tailwind
perspective_distant =
    Tailwind "perspective-distant"

{-| perspective: var(--perspective-dramatic);
-}
perspective_dramatic : Tailwind
perspective_dramatic =
    Tailwind "perspective-dramatic"

{-| perspective: var(--perspective-midrange);
-}
perspective_midrange : Tailwind
perspective_midrange =
    Tailwind "perspective-midrange"

{-| perspective: var(--perspective-near);
-}
perspective_near : Tailwind
perspective_near =
    Tailwind "perspective-near"

{-| perspective: none;
-}
perspective_none : Tailwind
perspective_none =
    Tailwind "perspective-none"

{-| perspective: var(--perspective-normal);
-}
perspective_normal : Tailwind
perspective_normal =
    Tailwind "perspective-normal"

{-| perspective-origin: bottom;
-}
perspective_origin_bottom : Tailwind
perspective_origin_bottom =
    Tailwind "perspective-origin-bottom"

{-| perspective-origin: 0 100%;
-}
perspective_origin_bottom_left : Tailwind
perspective_origin_bottom_left =
    Tailwind "perspective-origin-bottom-left"

{-| perspective-origin: 100% 100%;
-}
perspective_origin_bottom_right : Tailwind
perspective_origin_bottom_right =
    Tailwind "perspective-origin-bottom-right"

{-| perspective-origin: center;
-}
perspective_origin_center : Tailwind
perspective_origin_center =
    Tailwind "perspective-origin-center"

{-| perspective-origin: 0;
-}
perspective_origin_left : Tailwind
perspective_origin_left =
    Tailwind "perspective-origin-left"

{-| perspective-origin: 100%;
-}
perspective_origin_right : Tailwind
perspective_origin_right =
    Tailwind "perspective-origin-right"

{-| perspective-origin: top;
-}
perspective_origin_top : Tailwind
perspective_origin_top =
    Tailwind "perspective-origin-top"

{-| perspective-origin: 0 0;
-}
perspective_origin_top_left : Tailwind
perspective_origin_top_left =
    Tailwind "perspective-origin-top-left"

{-| perspective-origin: 100% 0;
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

{-| place-content: safe center;
-}
place_content_center_safe : Tailwind
place_content_center_safe =
    Tailwind "place-content-center-safe"

{-| place-content: end;
-}
place_content_end : Tailwind
place_content_end =
    Tailwind "place-content-end"

{-| place-content: safe end;
-}
place_content_end_safe : Tailwind
place_content_end_safe =
    Tailwind "place-content-end-safe"

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

{-| place-items: safe center;
-}
place_items_center_safe : Tailwind
place_items_center_safe =
    Tailwind "place-items-center-safe"

{-| place-items: end;
-}
place_items_end : Tailwind
place_items_end =
    Tailwind "place-items-end"

{-| place-items: safe end;
-}
place_items_end_safe : Tailwind
place_items_end_safe =
    Tailwind "place-items-end-safe"

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

{-| place-self: safe center;
-}
place_self_center_safe : Tailwind
place_self_center_safe =
    Tailwind "place-self-center-safe"

{-| place-self: end;
-}
place_self_end : Tailwind
place_self_end =
    Tailwind "place-self-end"

{-| place-self: safe end;
-}
place_self_end_safe : Tailwind
place_self_end_safe =
    Tailwind "place-self-end-safe"

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

{-| --tw-ring-shadow: var(--tw-ring-inset,) 0 0 0 calc(1px + var(--tw-ring-offset-width)) var(--tw-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
ring : Tailwind
ring =
    Tailwind "ring"

{-| --tw-ring-shadow: var(--tw-ring-inset,) 0 0 0 calc(0px + var(--tw-ring-offset-width)) var(--tw-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
ring_0 : Tailwind
ring_0 =
    Tailwind "ring-0"

{-| --tw-ring-shadow: var(--tw-ring-inset,) 0 0 0 calc(1px + var(--tw-ring-offset-width)) var(--tw-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
ring_1 : Tailwind
ring_1 =
    Tailwind "ring-1"

{-| --tw-ring-shadow: var(--tw-ring-inset,) 0 0 0 calc(2px + var(--tw-ring-offset-width)) var(--tw-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
ring_2 : Tailwind
ring_2 =
    Tailwind "ring-2"

{-| --tw-ring-shadow: var(--tw-ring-inset,) 0 0 0 calc(4px + var(--tw-ring-offset-width)) var(--tw-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
ring_4 : Tailwind
ring_4 =
    Tailwind "ring-4"

{-| --tw-ring-shadow: var(--tw-ring-inset,) 0 0 0 calc(8px + var(--tw-ring-offset-width)) var(--tw-ring-color, currentcolor);
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
ring_8 : Tailwind
ring_8 =
    Tailwind "ring-8"

{-| --tw-ring-inset: inset;
-}
ring_inset : Tailwind
ring_inset =
    Tailwind "ring-inset"

{-| --tw-ring-offset-width: 0px;
  --tw-ring-offset-shadow: var(--tw-ring-inset,) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);
-}
ring_offset_0 : Tailwind
ring_offset_0 =
    Tailwind "ring-offset-0"

{-| --tw-ring-offset-width: 1px;
  --tw-ring-offset-shadow: var(--tw-ring-inset,) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);
-}
ring_offset_1 : Tailwind
ring_offset_1 =
    Tailwind "ring-offset-1"

{-| --tw-ring-offset-width: 2px;
  --tw-ring-offset-shadow: var(--tw-ring-inset,) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);
-}
ring_offset_2 : Tailwind
ring_offset_2 =
    Tailwind "ring-offset-2"

{-| --tw-ring-offset-width: 4px;
  --tw-ring-offset-shadow: var(--tw-ring-inset,) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);
-}
ring_offset_4 : Tailwind
ring_offset_4 =
    Tailwind "ring-offset-4"

{-| --tw-ring-offset-width: 8px;
  --tw-ring-offset-shadow: var(--tw-ring-inset,) 0 0 0 var(--tw-ring-offset-width) var(--tw-ring-offset-color);
-}
ring_offset_8 : Tailwind
ring_offset_8 =
    Tailwind "ring-offset-8"

{-| rotate: 0deg;
-}
rotate_0 : Tailwind
rotate_0 =
    Tailwind "rotate-0"

{-| rotate: 1deg;
-}
rotate_1 : Tailwind
rotate_1 =
    Tailwind "rotate-1"

{-| rotate: 12deg;
-}
rotate_12 : Tailwind
rotate_12 =
    Tailwind "rotate-12"

{-| rotate: 180deg;
-}
rotate_180 : Tailwind
rotate_180 =
    Tailwind "rotate-180"

{-| rotate: 2deg;
-}
rotate_2 : Tailwind
rotate_2 =
    Tailwind "rotate-2"

{-| rotate: 3deg;
-}
rotate_3 : Tailwind
rotate_3 =
    Tailwind "rotate-3"

{-| rotate: 45deg;
-}
rotate_45 : Tailwind
rotate_45 =
    Tailwind "rotate-45"

{-| rotate: 6deg;
-}
rotate_6 : Tailwind
rotate_6 =
    Tailwind "rotate-6"

{-| rotate: 90deg;
-}
rotate_90 : Tailwind
rotate_90 =
    Tailwind "rotate-90"

{-| rotate: none;
-}
rotate_none : Tailwind
rotate_none =
    Tailwind "rotate-none"

{-| --tw-rotate-x: rotateX(0deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_0 : Tailwind
rotate_x_0 =
    Tailwind "rotate-x-0"

{-| --tw-rotate-x: rotateX(1deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_1 : Tailwind
rotate_x_1 =
    Tailwind "rotate-x-1"

{-| --tw-rotate-x: rotateX(12deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_12 : Tailwind
rotate_x_12 =
    Tailwind "rotate-x-12"

{-| --tw-rotate-x: rotateX(180deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_180 : Tailwind
rotate_x_180 =
    Tailwind "rotate-x-180"

{-| --tw-rotate-x: rotateX(2deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_2 : Tailwind
rotate_x_2 =
    Tailwind "rotate-x-2"

{-| --tw-rotate-x: rotateX(3deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_3 : Tailwind
rotate_x_3 =
    Tailwind "rotate-x-3"

{-| --tw-rotate-x: rotateX(45deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_45 : Tailwind
rotate_x_45 =
    Tailwind "rotate-x-45"

{-| --tw-rotate-x: rotateX(6deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_6 : Tailwind
rotate_x_6 =
    Tailwind "rotate-x-6"

{-| --tw-rotate-x: rotateX(90deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_x_90 : Tailwind
rotate_x_90 =
    Tailwind "rotate-x-90"

{-| --tw-rotate-y: rotateY(0deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_0 : Tailwind
rotate_y_0 =
    Tailwind "rotate-y-0"

{-| --tw-rotate-y: rotateY(1deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_1 : Tailwind
rotate_y_1 =
    Tailwind "rotate-y-1"

{-| --tw-rotate-y: rotateY(12deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_12 : Tailwind
rotate_y_12 =
    Tailwind "rotate-y-12"

{-| --tw-rotate-y: rotateY(180deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_180 : Tailwind
rotate_y_180 =
    Tailwind "rotate-y-180"

{-| --tw-rotate-y: rotateY(2deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_2 : Tailwind
rotate_y_2 =
    Tailwind "rotate-y-2"

{-| --tw-rotate-y: rotateY(3deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_3 : Tailwind
rotate_y_3 =
    Tailwind "rotate-y-3"

{-| --tw-rotate-y: rotateY(45deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_45 : Tailwind
rotate_y_45 =
    Tailwind "rotate-y-45"

{-| --tw-rotate-y: rotateY(6deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_6 : Tailwind
rotate_y_6 =
    Tailwind "rotate-y-6"

{-| --tw-rotate-y: rotateY(90deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_y_90 : Tailwind
rotate_y_90 =
    Tailwind "rotate-y-90"

{-| --tw-rotate-z: rotateZ(0deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_0 : Tailwind
rotate_z_0 =
    Tailwind "rotate-z-0"

{-| --tw-rotate-z: rotateZ(1deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_1 : Tailwind
rotate_z_1 =
    Tailwind "rotate-z-1"

{-| --tw-rotate-z: rotateZ(12deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_12 : Tailwind
rotate_z_12 =
    Tailwind "rotate-z-12"

{-| --tw-rotate-z: rotateZ(180deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_180 : Tailwind
rotate_z_180 =
    Tailwind "rotate-z-180"

{-| --tw-rotate-z: rotateZ(2deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_2 : Tailwind
rotate_z_2 =
    Tailwind "rotate-z-2"

{-| --tw-rotate-z: rotateZ(3deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_3 : Tailwind
rotate_z_3 =
    Tailwind "rotate-z-3"

{-| --tw-rotate-z: rotateZ(45deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_45 : Tailwind
rotate_z_45 =
    Tailwind "rotate-z-45"

{-| --tw-rotate-z: rotateZ(6deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_6 : Tailwind
rotate_z_6 =
    Tailwind "rotate-z-6"

{-| --tw-rotate-z: rotateZ(90deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
rotate_z_90 : Tailwind
rotate_z_90 =
    Tailwind "rotate-z-90"

{-| border-radius: var(--radius-2xl);
-}
rounded_2xl : Tailwind
rounded_2xl =
    Tailwind "rounded-2xl"

{-| border-radius: var(--radius-3xl);
-}
rounded_3xl : Tailwind
rounded_3xl =
    Tailwind "rounded-3xl"

{-| border-radius: var(--radius-4xl);
-}
rounded_4xl : Tailwind
rounded_4xl =
    Tailwind "rounded-4xl"

{-| border-bottom-right-radius: var(--radius-2xl);
  border-bottom-left-radius: var(--radius-2xl);
-}
rounded_b_2xl : Tailwind
rounded_b_2xl =
    Tailwind "rounded-b-2xl"

{-| border-bottom-right-radius: var(--radius-3xl);
  border-bottom-left-radius: var(--radius-3xl);
-}
rounded_b_3xl : Tailwind
rounded_b_3xl =
    Tailwind "rounded-b-3xl"

{-| border-bottom-right-radius: var(--radius-4xl);
  border-bottom-left-radius: var(--radius-4xl);
-}
rounded_b_4xl : Tailwind
rounded_b_4xl =
    Tailwind "rounded-b-4xl"

{-| border-bottom-right-radius: calc(infinity * 1px);
  border-bottom-left-radius: calc(infinity * 1px);
-}
rounded_b_full : Tailwind
rounded_b_full =
    Tailwind "rounded-b-full"

{-| border-bottom-right-radius: var(--radius-lg);
  border-bottom-left-radius: var(--radius-lg);
-}
rounded_b_lg : Tailwind
rounded_b_lg =
    Tailwind "rounded-b-lg"

{-| border-bottom-right-radius: var(--radius-md);
  border-bottom-left-radius: var(--radius-md);
-}
rounded_b_md : Tailwind
rounded_b_md =
    Tailwind "rounded-b-md"

{-| border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
-}
rounded_b_none : Tailwind
rounded_b_none =
    Tailwind "rounded-b-none"

{-| border-bottom-right-radius: var(--radius-sm);
  border-bottom-left-radius: var(--radius-sm);
-}
rounded_b_sm : Tailwind
rounded_b_sm =
    Tailwind "rounded-b-sm"

{-| border-bottom-right-radius: var(--radius-xl);
  border-bottom-left-radius: var(--radius-xl);
-}
rounded_b_xl : Tailwind
rounded_b_xl =
    Tailwind "rounded-b-xl"

{-| border-bottom-right-radius: var(--radius-xs);
  border-bottom-left-radius: var(--radius-xs);
-}
rounded_b_xs : Tailwind
rounded_b_xs =
    Tailwind "rounded-b-xs"

{-| border-bottom-left-radius: var(--radius-2xl);
-}
rounded_bl_2xl : Tailwind
rounded_bl_2xl =
    Tailwind "rounded-bl-2xl"

{-| border-bottom-left-radius: var(--radius-3xl);
-}
rounded_bl_3xl : Tailwind
rounded_bl_3xl =
    Tailwind "rounded-bl-3xl"

{-| border-bottom-left-radius: var(--radius-4xl);
-}
rounded_bl_4xl : Tailwind
rounded_bl_4xl =
    Tailwind "rounded-bl-4xl"

{-| border-bottom-left-radius: calc(infinity * 1px);
-}
rounded_bl_full : Tailwind
rounded_bl_full =
    Tailwind "rounded-bl-full"

{-| border-bottom-left-radius: var(--radius-lg);
-}
rounded_bl_lg : Tailwind
rounded_bl_lg =
    Tailwind "rounded-bl-lg"

{-| border-bottom-left-radius: var(--radius-md);
-}
rounded_bl_md : Tailwind
rounded_bl_md =
    Tailwind "rounded-bl-md"

{-| border-bottom-left-radius: 0;
-}
rounded_bl_none : Tailwind
rounded_bl_none =
    Tailwind "rounded-bl-none"

{-| border-bottom-left-radius: var(--radius-sm);
-}
rounded_bl_sm : Tailwind
rounded_bl_sm =
    Tailwind "rounded-bl-sm"

{-| border-bottom-left-radius: var(--radius-xl);
-}
rounded_bl_xl : Tailwind
rounded_bl_xl =
    Tailwind "rounded-bl-xl"

{-| border-bottom-left-radius: var(--radius-xs);
-}
rounded_bl_xs : Tailwind
rounded_bl_xs =
    Tailwind "rounded-bl-xs"

{-| border-bottom-right-radius: var(--radius-2xl);
-}
rounded_br_2xl : Tailwind
rounded_br_2xl =
    Tailwind "rounded-br-2xl"

{-| border-bottom-right-radius: var(--radius-3xl);
-}
rounded_br_3xl : Tailwind
rounded_br_3xl =
    Tailwind "rounded-br-3xl"

{-| border-bottom-right-radius: var(--radius-4xl);
-}
rounded_br_4xl : Tailwind
rounded_br_4xl =
    Tailwind "rounded-br-4xl"

{-| border-bottom-right-radius: calc(infinity * 1px);
-}
rounded_br_full : Tailwind
rounded_br_full =
    Tailwind "rounded-br-full"

{-| border-bottom-right-radius: var(--radius-lg);
-}
rounded_br_lg : Tailwind
rounded_br_lg =
    Tailwind "rounded-br-lg"

{-| border-bottom-right-radius: var(--radius-md);
-}
rounded_br_md : Tailwind
rounded_br_md =
    Tailwind "rounded-br-md"

{-| border-bottom-right-radius: 0;
-}
rounded_br_none : Tailwind
rounded_br_none =
    Tailwind "rounded-br-none"

{-| border-bottom-right-radius: var(--radius-sm);
-}
rounded_br_sm : Tailwind
rounded_br_sm =
    Tailwind "rounded-br-sm"

{-| border-bottom-right-radius: var(--radius-xl);
-}
rounded_br_xl : Tailwind
rounded_br_xl =
    Tailwind "rounded-br-xl"

{-| border-bottom-right-radius: var(--radius-xs);
-}
rounded_br_xs : Tailwind
rounded_br_xs =
    Tailwind "rounded-br-xs"

{-| border-start-end-radius: var(--radius-2xl);
  border-end-end-radius: var(--radius-2xl);
-}
rounded_e_2xl : Tailwind
rounded_e_2xl =
    Tailwind "rounded-e-2xl"

{-| border-start-end-radius: var(--radius-3xl);
  border-end-end-radius: var(--radius-3xl);
-}
rounded_e_3xl : Tailwind
rounded_e_3xl =
    Tailwind "rounded-e-3xl"

{-| border-start-end-radius: var(--radius-4xl);
  border-end-end-radius: var(--radius-4xl);
-}
rounded_e_4xl : Tailwind
rounded_e_4xl =
    Tailwind "rounded-e-4xl"

{-| border-start-end-radius: calc(infinity * 1px);
  border-end-end-radius: calc(infinity * 1px);
-}
rounded_e_full : Tailwind
rounded_e_full =
    Tailwind "rounded-e-full"

{-| border-start-end-radius: var(--radius-lg);
  border-end-end-radius: var(--radius-lg);
-}
rounded_e_lg : Tailwind
rounded_e_lg =
    Tailwind "rounded-e-lg"

{-| border-start-end-radius: var(--radius-md);
  border-end-end-radius: var(--radius-md);
-}
rounded_e_md : Tailwind
rounded_e_md =
    Tailwind "rounded-e-md"

{-| border-start-end-radius: 0;
  border-end-end-radius: 0;
-}
rounded_e_none : Tailwind
rounded_e_none =
    Tailwind "rounded-e-none"

{-| border-start-end-radius: var(--radius-sm);
  border-end-end-radius: var(--radius-sm);
-}
rounded_e_sm : Tailwind
rounded_e_sm =
    Tailwind "rounded-e-sm"

{-| border-start-end-radius: var(--radius-xl);
  border-end-end-radius: var(--radius-xl);
-}
rounded_e_xl : Tailwind
rounded_e_xl =
    Tailwind "rounded-e-xl"

{-| border-start-end-radius: var(--radius-xs);
  border-end-end-radius: var(--radius-xs);
-}
rounded_e_xs : Tailwind
rounded_e_xs =
    Tailwind "rounded-e-xs"

{-| border-end-end-radius: var(--radius-2xl);
-}
rounded_ee_2xl : Tailwind
rounded_ee_2xl =
    Tailwind "rounded-ee-2xl"

{-| border-end-end-radius: var(--radius-3xl);
-}
rounded_ee_3xl : Tailwind
rounded_ee_3xl =
    Tailwind "rounded-ee-3xl"

{-| border-end-end-radius: var(--radius-4xl);
-}
rounded_ee_4xl : Tailwind
rounded_ee_4xl =
    Tailwind "rounded-ee-4xl"

{-| border-end-end-radius: calc(infinity * 1px);
-}
rounded_ee_full : Tailwind
rounded_ee_full =
    Tailwind "rounded-ee-full"

{-| border-end-end-radius: var(--radius-lg);
-}
rounded_ee_lg : Tailwind
rounded_ee_lg =
    Tailwind "rounded-ee-lg"

{-| border-end-end-radius: var(--radius-md);
-}
rounded_ee_md : Tailwind
rounded_ee_md =
    Tailwind "rounded-ee-md"

{-| border-end-end-radius: 0;
-}
rounded_ee_none : Tailwind
rounded_ee_none =
    Tailwind "rounded-ee-none"

{-| border-end-end-radius: var(--radius-sm);
-}
rounded_ee_sm : Tailwind
rounded_ee_sm =
    Tailwind "rounded-ee-sm"

{-| border-end-end-radius: var(--radius-xl);
-}
rounded_ee_xl : Tailwind
rounded_ee_xl =
    Tailwind "rounded-ee-xl"

{-| border-end-end-radius: var(--radius-xs);
-}
rounded_ee_xs : Tailwind
rounded_ee_xs =
    Tailwind "rounded-ee-xs"

{-| border-end-start-radius: var(--radius-2xl);
-}
rounded_es_2xl : Tailwind
rounded_es_2xl =
    Tailwind "rounded-es-2xl"

{-| border-end-start-radius: var(--radius-3xl);
-}
rounded_es_3xl : Tailwind
rounded_es_3xl =
    Tailwind "rounded-es-3xl"

{-| border-end-start-radius: var(--radius-4xl);
-}
rounded_es_4xl : Tailwind
rounded_es_4xl =
    Tailwind "rounded-es-4xl"

{-| border-end-start-radius: calc(infinity * 1px);
-}
rounded_es_full : Tailwind
rounded_es_full =
    Tailwind "rounded-es-full"

{-| border-end-start-radius: var(--radius-lg);
-}
rounded_es_lg : Tailwind
rounded_es_lg =
    Tailwind "rounded-es-lg"

{-| border-end-start-radius: var(--radius-md);
-}
rounded_es_md : Tailwind
rounded_es_md =
    Tailwind "rounded-es-md"

{-| border-end-start-radius: 0;
-}
rounded_es_none : Tailwind
rounded_es_none =
    Tailwind "rounded-es-none"

{-| border-end-start-radius: var(--radius-sm);
-}
rounded_es_sm : Tailwind
rounded_es_sm =
    Tailwind "rounded-es-sm"

{-| border-end-start-radius: var(--radius-xl);
-}
rounded_es_xl : Tailwind
rounded_es_xl =
    Tailwind "rounded-es-xl"

{-| border-end-start-radius: var(--radius-xs);
-}
rounded_es_xs : Tailwind
rounded_es_xs =
    Tailwind "rounded-es-xs"

{-| border-radius: calc(infinity * 1px);
-}
rounded_full : Tailwind
rounded_full =
    Tailwind "rounded-full"

{-| border-top-left-radius: var(--radius-2xl);
  border-bottom-left-radius: var(--radius-2xl);
-}
rounded_l_2xl : Tailwind
rounded_l_2xl =
    Tailwind "rounded-l-2xl"

{-| border-top-left-radius: var(--radius-3xl);
  border-bottom-left-radius: var(--radius-3xl);
-}
rounded_l_3xl : Tailwind
rounded_l_3xl =
    Tailwind "rounded-l-3xl"

{-| border-top-left-radius: var(--radius-4xl);
  border-bottom-left-radius: var(--radius-4xl);
-}
rounded_l_4xl : Tailwind
rounded_l_4xl =
    Tailwind "rounded-l-4xl"

{-| border-top-left-radius: calc(infinity * 1px);
  border-bottom-left-radius: calc(infinity * 1px);
-}
rounded_l_full : Tailwind
rounded_l_full =
    Tailwind "rounded-l-full"

{-| border-top-left-radius: var(--radius-lg);
  border-bottom-left-radius: var(--radius-lg);
-}
rounded_l_lg : Tailwind
rounded_l_lg =
    Tailwind "rounded-l-lg"

{-| border-top-left-radius: var(--radius-md);
  border-bottom-left-radius: var(--radius-md);
-}
rounded_l_md : Tailwind
rounded_l_md =
    Tailwind "rounded-l-md"

{-| border-top-left-radius: 0;
  border-bottom-left-radius: 0;
-}
rounded_l_none : Tailwind
rounded_l_none =
    Tailwind "rounded-l-none"

{-| border-top-left-radius: var(--radius-sm);
  border-bottom-left-radius: var(--radius-sm);
-}
rounded_l_sm : Tailwind
rounded_l_sm =
    Tailwind "rounded-l-sm"

{-| border-top-left-radius: var(--radius-xl);
  border-bottom-left-radius: var(--radius-xl);
-}
rounded_l_xl : Tailwind
rounded_l_xl =
    Tailwind "rounded-l-xl"

{-| border-top-left-radius: var(--radius-xs);
  border-bottom-left-radius: var(--radius-xs);
-}
rounded_l_xs : Tailwind
rounded_l_xs =
    Tailwind "rounded-l-xs"

{-| border-radius: 0;
-}
rounded_none : Tailwind
rounded_none =
    Tailwind "rounded-none"

{-| border-top-right-radius: var(--radius-2xl);
  border-bottom-right-radius: var(--radius-2xl);
-}
rounded_r_2xl : Tailwind
rounded_r_2xl =
    Tailwind "rounded-r-2xl"

{-| border-top-right-radius: var(--radius-3xl);
  border-bottom-right-radius: var(--radius-3xl);
-}
rounded_r_3xl : Tailwind
rounded_r_3xl =
    Tailwind "rounded-r-3xl"

{-| border-top-right-radius: var(--radius-4xl);
  border-bottom-right-radius: var(--radius-4xl);
-}
rounded_r_4xl : Tailwind
rounded_r_4xl =
    Tailwind "rounded-r-4xl"

{-| border-top-right-radius: calc(infinity * 1px);
  border-bottom-right-radius: calc(infinity * 1px);
-}
rounded_r_full : Tailwind
rounded_r_full =
    Tailwind "rounded-r-full"

{-| border-top-right-radius: var(--radius-lg);
  border-bottom-right-radius: var(--radius-lg);
-}
rounded_r_lg : Tailwind
rounded_r_lg =
    Tailwind "rounded-r-lg"

{-| border-top-right-radius: var(--radius-md);
  border-bottom-right-radius: var(--radius-md);
-}
rounded_r_md : Tailwind
rounded_r_md =
    Tailwind "rounded-r-md"

{-| border-top-right-radius: 0;
  border-bottom-right-radius: 0;
-}
rounded_r_none : Tailwind
rounded_r_none =
    Tailwind "rounded-r-none"

{-| border-top-right-radius: var(--radius-sm);
  border-bottom-right-radius: var(--radius-sm);
-}
rounded_r_sm : Tailwind
rounded_r_sm =
    Tailwind "rounded-r-sm"

{-| border-top-right-radius: var(--radius-xl);
  border-bottom-right-radius: var(--radius-xl);
-}
rounded_r_xl : Tailwind
rounded_r_xl =
    Tailwind "rounded-r-xl"

{-| border-top-right-radius: var(--radius-xs);
  border-bottom-right-radius: var(--radius-xs);
-}
rounded_r_xs : Tailwind
rounded_r_xs =
    Tailwind "rounded-r-xs"

{-| border-start-start-radius: var(--radius-2xl);
  border-end-start-radius: var(--radius-2xl);
-}
rounded_s_2xl : Tailwind
rounded_s_2xl =
    Tailwind "rounded-s-2xl"

{-| border-start-start-radius: var(--radius-3xl);
  border-end-start-radius: var(--radius-3xl);
-}
rounded_s_3xl : Tailwind
rounded_s_3xl =
    Tailwind "rounded-s-3xl"

{-| border-start-start-radius: var(--radius-4xl);
  border-end-start-radius: var(--radius-4xl);
-}
rounded_s_4xl : Tailwind
rounded_s_4xl =
    Tailwind "rounded-s-4xl"

{-| border-start-start-radius: calc(infinity * 1px);
  border-end-start-radius: calc(infinity * 1px);
-}
rounded_s_full : Tailwind
rounded_s_full =
    Tailwind "rounded-s-full"

{-| border-start-start-radius: var(--radius-lg);
  border-end-start-radius: var(--radius-lg);
-}
rounded_s_lg : Tailwind
rounded_s_lg =
    Tailwind "rounded-s-lg"

{-| border-start-start-radius: var(--radius-md);
  border-end-start-radius: var(--radius-md);
-}
rounded_s_md : Tailwind
rounded_s_md =
    Tailwind "rounded-s-md"

{-| border-start-start-radius: 0;
  border-end-start-radius: 0;
-}
rounded_s_none : Tailwind
rounded_s_none =
    Tailwind "rounded-s-none"

{-| border-start-start-radius: var(--radius-sm);
  border-end-start-radius: var(--radius-sm);
-}
rounded_s_sm : Tailwind
rounded_s_sm =
    Tailwind "rounded-s-sm"

{-| border-start-start-radius: var(--radius-xl);
  border-end-start-radius: var(--radius-xl);
-}
rounded_s_xl : Tailwind
rounded_s_xl =
    Tailwind "rounded-s-xl"

{-| border-start-start-radius: var(--radius-xs);
  border-end-start-radius: var(--radius-xs);
-}
rounded_s_xs : Tailwind
rounded_s_xs =
    Tailwind "rounded-s-xs"

{-| border-start-end-radius: var(--radius-2xl);
-}
rounded_se_2xl : Tailwind
rounded_se_2xl =
    Tailwind "rounded-se-2xl"

{-| border-start-end-radius: var(--radius-3xl);
-}
rounded_se_3xl : Tailwind
rounded_se_3xl =
    Tailwind "rounded-se-3xl"

{-| border-start-end-radius: var(--radius-4xl);
-}
rounded_se_4xl : Tailwind
rounded_se_4xl =
    Tailwind "rounded-se-4xl"

{-| border-start-end-radius: calc(infinity * 1px);
-}
rounded_se_full : Tailwind
rounded_se_full =
    Tailwind "rounded-se-full"

{-| border-start-end-radius: var(--radius-lg);
-}
rounded_se_lg : Tailwind
rounded_se_lg =
    Tailwind "rounded-se-lg"

{-| border-start-end-radius: var(--radius-md);
-}
rounded_se_md : Tailwind
rounded_se_md =
    Tailwind "rounded-se-md"

{-| border-start-end-radius: 0;
-}
rounded_se_none : Tailwind
rounded_se_none =
    Tailwind "rounded-se-none"

{-| border-start-end-radius: var(--radius-sm);
-}
rounded_se_sm : Tailwind
rounded_se_sm =
    Tailwind "rounded-se-sm"

{-| border-start-end-radius: var(--radius-xl);
-}
rounded_se_xl : Tailwind
rounded_se_xl =
    Tailwind "rounded-se-xl"

{-| border-start-end-radius: var(--radius-xs);
-}
rounded_se_xs : Tailwind
rounded_se_xs =
    Tailwind "rounded-se-xs"

{-| border-start-start-radius: var(--radius-2xl);
-}
rounded_ss_2xl : Tailwind
rounded_ss_2xl =
    Tailwind "rounded-ss-2xl"

{-| border-start-start-radius: var(--radius-3xl);
-}
rounded_ss_3xl : Tailwind
rounded_ss_3xl =
    Tailwind "rounded-ss-3xl"

{-| border-start-start-radius: var(--radius-4xl);
-}
rounded_ss_4xl : Tailwind
rounded_ss_4xl =
    Tailwind "rounded-ss-4xl"

{-| border-start-start-radius: calc(infinity * 1px);
-}
rounded_ss_full : Tailwind
rounded_ss_full =
    Tailwind "rounded-ss-full"

{-| border-start-start-radius: var(--radius-lg);
-}
rounded_ss_lg : Tailwind
rounded_ss_lg =
    Tailwind "rounded-ss-lg"

{-| border-start-start-radius: var(--radius-md);
-}
rounded_ss_md : Tailwind
rounded_ss_md =
    Tailwind "rounded-ss-md"

{-| border-start-start-radius: 0;
-}
rounded_ss_none : Tailwind
rounded_ss_none =
    Tailwind "rounded-ss-none"

{-| border-start-start-radius: var(--radius-sm);
-}
rounded_ss_sm : Tailwind
rounded_ss_sm =
    Tailwind "rounded-ss-sm"

{-| border-start-start-radius: var(--radius-xl);
-}
rounded_ss_xl : Tailwind
rounded_ss_xl =
    Tailwind "rounded-ss-xl"

{-| border-start-start-radius: var(--radius-xs);
-}
rounded_ss_xs : Tailwind
rounded_ss_xs =
    Tailwind "rounded-ss-xs"

{-| border-top-left-radius: var(--radius-2xl);
  border-top-right-radius: var(--radius-2xl);
-}
rounded_t_2xl : Tailwind
rounded_t_2xl =
    Tailwind "rounded-t-2xl"

{-| border-top-left-radius: var(--radius-3xl);
  border-top-right-radius: var(--radius-3xl);
-}
rounded_t_3xl : Tailwind
rounded_t_3xl =
    Tailwind "rounded-t-3xl"

{-| border-top-left-radius: var(--radius-4xl);
  border-top-right-radius: var(--radius-4xl);
-}
rounded_t_4xl : Tailwind
rounded_t_4xl =
    Tailwind "rounded-t-4xl"

{-| border-top-left-radius: calc(infinity * 1px);
  border-top-right-radius: calc(infinity * 1px);
-}
rounded_t_full : Tailwind
rounded_t_full =
    Tailwind "rounded-t-full"

{-| border-top-left-radius: var(--radius-lg);
  border-top-right-radius: var(--radius-lg);
-}
rounded_t_lg : Tailwind
rounded_t_lg =
    Tailwind "rounded-t-lg"

{-| border-top-left-radius: var(--radius-md);
  border-top-right-radius: var(--radius-md);
-}
rounded_t_md : Tailwind
rounded_t_md =
    Tailwind "rounded-t-md"

{-| border-top-left-radius: 0;
  border-top-right-radius: 0;
-}
rounded_t_none : Tailwind
rounded_t_none =
    Tailwind "rounded-t-none"

{-| border-top-left-radius: var(--radius-sm);
  border-top-right-radius: var(--radius-sm);
-}
rounded_t_sm : Tailwind
rounded_t_sm =
    Tailwind "rounded-t-sm"

{-| border-top-left-radius: var(--radius-xl);
  border-top-right-radius: var(--radius-xl);
-}
rounded_t_xl : Tailwind
rounded_t_xl =
    Tailwind "rounded-t-xl"

{-| border-top-left-radius: var(--radius-xs);
  border-top-right-radius: var(--radius-xs);
-}
rounded_t_xs : Tailwind
rounded_t_xs =
    Tailwind "rounded-t-xs"

{-| border-top-left-radius: var(--radius-2xl);
-}
rounded_tl_2xl : Tailwind
rounded_tl_2xl =
    Tailwind "rounded-tl-2xl"

{-| border-top-left-radius: var(--radius-3xl);
-}
rounded_tl_3xl : Tailwind
rounded_tl_3xl =
    Tailwind "rounded-tl-3xl"

{-| border-top-left-radius: var(--radius-4xl);
-}
rounded_tl_4xl : Tailwind
rounded_tl_4xl =
    Tailwind "rounded-tl-4xl"

{-| border-top-left-radius: calc(infinity * 1px);
-}
rounded_tl_full : Tailwind
rounded_tl_full =
    Tailwind "rounded-tl-full"

{-| border-top-left-radius: var(--radius-lg);
-}
rounded_tl_lg : Tailwind
rounded_tl_lg =
    Tailwind "rounded-tl-lg"

{-| border-top-left-radius: var(--radius-md);
-}
rounded_tl_md : Tailwind
rounded_tl_md =
    Tailwind "rounded-tl-md"

{-| border-top-left-radius: 0;
-}
rounded_tl_none : Tailwind
rounded_tl_none =
    Tailwind "rounded-tl-none"

{-| border-top-left-radius: var(--radius-sm);
-}
rounded_tl_sm : Tailwind
rounded_tl_sm =
    Tailwind "rounded-tl-sm"

{-| border-top-left-radius: var(--radius-xl);
-}
rounded_tl_xl : Tailwind
rounded_tl_xl =
    Tailwind "rounded-tl-xl"

{-| border-top-left-radius: var(--radius-xs);
-}
rounded_tl_xs : Tailwind
rounded_tl_xs =
    Tailwind "rounded-tl-xs"

{-| border-top-right-radius: var(--radius-2xl);
-}
rounded_tr_2xl : Tailwind
rounded_tr_2xl =
    Tailwind "rounded-tr-2xl"

{-| border-top-right-radius: var(--radius-3xl);
-}
rounded_tr_3xl : Tailwind
rounded_tr_3xl =
    Tailwind "rounded-tr-3xl"

{-| border-top-right-radius: var(--radius-4xl);
-}
rounded_tr_4xl : Tailwind
rounded_tr_4xl =
    Tailwind "rounded-tr-4xl"

{-| border-top-right-radius: calc(infinity * 1px);
-}
rounded_tr_full : Tailwind
rounded_tr_full =
    Tailwind "rounded-tr-full"

{-| border-top-right-radius: var(--radius-lg);
-}
rounded_tr_lg : Tailwind
rounded_tr_lg =
    Tailwind "rounded-tr-lg"

{-| border-top-right-radius: var(--radius-md);
-}
rounded_tr_md : Tailwind
rounded_tr_md =
    Tailwind "rounded-tr-md"

{-| border-top-right-radius: 0;
-}
rounded_tr_none : Tailwind
rounded_tr_none =
    Tailwind "rounded-tr-none"

{-| border-top-right-radius: var(--radius-sm);
-}
rounded_tr_sm : Tailwind
rounded_tr_sm =
    Tailwind "rounded-tr-sm"

{-| border-top-right-radius: var(--radius-xl);
-}
rounded_tr_xl : Tailwind
rounded_tr_xl =
    Tailwind "rounded-tr-xl"

{-| border-top-right-radius: var(--radius-xs);
-}
rounded_tr_xs : Tailwind
rounded_tr_xs =
    Tailwind "rounded-tr-xs"

{-| grid-row: auto;
-}
row_auto : Tailwind
row_auto =
    Tailwind "row-auto"

{-| grid-row-end: 1;
-}
row_end_1 : Tailwind
row_end_1 =
    Tailwind "row-end-1"

{-| grid-row-end: 10;
-}
row_end_10 : Tailwind
row_end_10 =
    Tailwind "row-end-10"

{-| grid-row-end: 11;
-}
row_end_11 : Tailwind
row_end_11 =
    Tailwind "row-end-11"

{-| grid-row-end: 12;
-}
row_end_12 : Tailwind
row_end_12 =
    Tailwind "row-end-12"

{-| grid-row-end: 13;
-}
row_end_13 : Tailwind
row_end_13 =
    Tailwind "row-end-13"

{-| grid-row-end: 2;
-}
row_end_2 : Tailwind
row_end_2 =
    Tailwind "row-end-2"

{-| grid-row-end: 3;
-}
row_end_3 : Tailwind
row_end_3 =
    Tailwind "row-end-3"

{-| grid-row-end: 4;
-}
row_end_4 : Tailwind
row_end_4 =
    Tailwind "row-end-4"

{-| grid-row-end: 5;
-}
row_end_5 : Tailwind
row_end_5 =
    Tailwind "row-end-5"

{-| grid-row-end: 6;
-}
row_end_6 : Tailwind
row_end_6 =
    Tailwind "row-end-6"

{-| grid-row-end: 7;
-}
row_end_7 : Tailwind
row_end_7 =
    Tailwind "row-end-7"

{-| grid-row-end: 8;
-}
row_end_8 : Tailwind
row_end_8 =
    Tailwind "row-end-8"

{-| grid-row-end: 9;
-}
row_end_9 : Tailwind
row_end_9 =
    Tailwind "row-end-9"

{-| grid-row-end: auto;
-}
row_end_auto : Tailwind
row_end_auto =
    Tailwind "row-end-auto"

{-| grid-row: span 1 / span 1;
-}
row_span_1 : Tailwind
row_span_1 =
    Tailwind "row-span-1"

{-| grid-row: span 10 / span 10;
-}
row_span_10 : Tailwind
row_span_10 =
    Tailwind "row-span-10"

{-| grid-row: span 11 / span 11;
-}
row_span_11 : Tailwind
row_span_11 =
    Tailwind "row-span-11"

{-| grid-row: span 12 / span 12;
-}
row_span_12 : Tailwind
row_span_12 =
    Tailwind "row-span-12"

{-| grid-row: span 2 / span 2;
-}
row_span_2 : Tailwind
row_span_2 =
    Tailwind "row-span-2"

{-| grid-row: span 3 / span 3;
-}
row_span_3 : Tailwind
row_span_3 =
    Tailwind "row-span-3"

{-| grid-row: span 4 / span 4;
-}
row_span_4 : Tailwind
row_span_4 =
    Tailwind "row-span-4"

{-| grid-row: span 5 / span 5;
-}
row_span_5 : Tailwind
row_span_5 =
    Tailwind "row-span-5"

{-| grid-row: span 6 / span 6;
-}
row_span_6 : Tailwind
row_span_6 =
    Tailwind "row-span-6"

{-| grid-row: span 7 / span 7;
-}
row_span_7 : Tailwind
row_span_7 =
    Tailwind "row-span-7"

{-| grid-row: span 8 / span 8;
-}
row_span_8 : Tailwind
row_span_8 =
    Tailwind "row-span-8"

{-| grid-row: span 9 / span 9;
-}
row_span_9 : Tailwind
row_span_9 =
    Tailwind "row-span-9"

{-| grid-row: 1 / -1;
-}
row_span_full : Tailwind
row_span_full =
    Tailwind "row-span-full"

{-| grid-row-start: 1;
-}
row_start_1 : Tailwind
row_start_1 =
    Tailwind "row-start-1"

{-| grid-row-start: 10;
-}
row_start_10 : Tailwind
row_start_10 =
    Tailwind "row-start-10"

{-| grid-row-start: 11;
-}
row_start_11 : Tailwind
row_start_11 =
    Tailwind "row-start-11"

{-| grid-row-start: 12;
-}
row_start_12 : Tailwind
row_start_12 =
    Tailwind "row-start-12"

{-| grid-row-start: 13;
-}
row_start_13 : Tailwind
row_start_13 =
    Tailwind "row-start-13"

{-| grid-row-start: 2;
-}
row_start_2 : Tailwind
row_start_2 =
    Tailwind "row-start-2"

{-| grid-row-start: 3;
-}
row_start_3 : Tailwind
row_start_3 =
    Tailwind "row-start-3"

{-| grid-row-start: 4;
-}
row_start_4 : Tailwind
row_start_4 =
    Tailwind "row-start-4"

{-| grid-row-start: 5;
-}
row_start_5 : Tailwind
row_start_5 =
    Tailwind "row-start-5"

{-| grid-row-start: 6;
-}
row_start_6 : Tailwind
row_start_6 =
    Tailwind "row-start-6"

{-| grid-row-start: 7;
-}
row_start_7 : Tailwind
row_start_7 =
    Tailwind "row-start-7"

{-| grid-row-start: 8;
-}
row_start_8 : Tailwind
row_start_8 =
    Tailwind "row-start-8"

{-| grid-row-start: 9;
-}
row_start_9 : Tailwind
row_start_9 =
    Tailwind "row-start-9"

{-| grid-row-start: auto;
-}
row_start_auto : Tailwind
row_start_auto =
    Tailwind "row-start-auto"

{-| --tw-saturate: saturate(0%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
saturate_0 : Tailwind
saturate_0 =
    Tailwind "saturate-0"

{-| --tw-saturate: saturate(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
saturate_100 : Tailwind
saturate_100 =
    Tailwind "saturate-100"

{-| --tw-saturate: saturate(150%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
saturate_150 : Tailwind
saturate_150 =
    Tailwind "saturate-150"

{-| --tw-saturate: saturate(200%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
saturate_200 : Tailwind
saturate_200 =
    Tailwind "saturate-200"

{-| --tw-saturate: saturate(50%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
saturate_50 : Tailwind
saturate_50 =
    Tailwind "saturate-50"

{-| --tw-scale-x: 0%;
  --tw-scale-y: 0%;
  --tw-scale-z: 0%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_0 : Tailwind
scale_0 =
    Tailwind "scale-0"

{-| --tw-scale-x: 100%;
  --tw-scale-y: 100%;
  --tw-scale-z: 100%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_100 : Tailwind
scale_100 =
    Tailwind "scale-100"

{-| --tw-scale-x: 105%;
  --tw-scale-y: 105%;
  --tw-scale-z: 105%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_105 : Tailwind
scale_105 =
    Tailwind "scale-105"

{-| --tw-scale-x: 110%;
  --tw-scale-y: 110%;
  --tw-scale-z: 110%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_110 : Tailwind
scale_110 =
    Tailwind "scale-110"

{-| --tw-scale-x: 125%;
  --tw-scale-y: 125%;
  --tw-scale-z: 125%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_125 : Tailwind
scale_125 =
    Tailwind "scale-125"

{-| --tw-scale-x: 150%;
  --tw-scale-y: 150%;
  --tw-scale-z: 150%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_150 : Tailwind
scale_150 =
    Tailwind "scale-150"

{-| --tw-scale-x: 200%;
  --tw-scale-y: 200%;
  --tw-scale-z: 200%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_200 : Tailwind
scale_200 =
    Tailwind "scale-200"

{-| scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_3d : Tailwind
scale_3d =
    Tailwind "scale-3d"

{-| --tw-scale-x: 50%;
  --tw-scale-y: 50%;
  --tw-scale-z: 50%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_50 : Tailwind
scale_50 =
    Tailwind "scale-50"

{-| --tw-scale-x: 75%;
  --tw-scale-y: 75%;
  --tw-scale-z: 75%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_75 : Tailwind
scale_75 =
    Tailwind "scale-75"

{-| --tw-scale-x: 90%;
  --tw-scale-y: 90%;
  --tw-scale-z: 90%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_90 : Tailwind
scale_90 =
    Tailwind "scale-90"

{-| --tw-scale-x: 95%;
  --tw-scale-y: 95%;
  --tw-scale-z: 95%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_95 : Tailwind
scale_95 =
    Tailwind "scale-95"

{-| scale: none;
-}
scale_none : Tailwind
scale_none =
    Tailwind "scale-none"

{-| --tw-scale-x: 0%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_0 : Tailwind
scale_x_0 =
    Tailwind "scale-x-0"

{-| --tw-scale-x: 100%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_100 : Tailwind
scale_x_100 =
    Tailwind "scale-x-100"

{-| --tw-scale-x: 105%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_105 : Tailwind
scale_x_105 =
    Tailwind "scale-x-105"

{-| --tw-scale-x: 110%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_110 : Tailwind
scale_x_110 =
    Tailwind "scale-x-110"

{-| --tw-scale-x: 125%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_125 : Tailwind
scale_x_125 =
    Tailwind "scale-x-125"

{-| --tw-scale-x: 150%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_150 : Tailwind
scale_x_150 =
    Tailwind "scale-x-150"

{-| --tw-scale-x: 200%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_200 : Tailwind
scale_x_200 =
    Tailwind "scale-x-200"

{-| --tw-scale-x: 50%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_50 : Tailwind
scale_x_50 =
    Tailwind "scale-x-50"

{-| --tw-scale-x: 75%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_75 : Tailwind
scale_x_75 =
    Tailwind "scale-x-75"

{-| --tw-scale-x: 90%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_90 : Tailwind
scale_x_90 =
    Tailwind "scale-x-90"

{-| --tw-scale-x: 95%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_x_95 : Tailwind
scale_x_95 =
    Tailwind "scale-x-95"

{-| --tw-scale-y: 0%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_0 : Tailwind
scale_y_0 =
    Tailwind "scale-y-0"

{-| --tw-scale-y: 100%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_100 : Tailwind
scale_y_100 =
    Tailwind "scale-y-100"

{-| --tw-scale-y: 105%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_105 : Tailwind
scale_y_105 =
    Tailwind "scale-y-105"

{-| --tw-scale-y: 110%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_110 : Tailwind
scale_y_110 =
    Tailwind "scale-y-110"

{-| --tw-scale-y: 125%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_125 : Tailwind
scale_y_125 =
    Tailwind "scale-y-125"

{-| --tw-scale-y: 150%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_150 : Tailwind
scale_y_150 =
    Tailwind "scale-y-150"

{-| --tw-scale-y: 200%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_200 : Tailwind
scale_y_200 =
    Tailwind "scale-y-200"

{-| --tw-scale-y: 50%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_50 : Tailwind
scale_y_50 =
    Tailwind "scale-y-50"

{-| --tw-scale-y: 75%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_75 : Tailwind
scale_y_75 =
    Tailwind "scale-y-75"

{-| --tw-scale-y: 90%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_90 : Tailwind
scale_y_90 =
    Tailwind "scale-y-90"

{-| --tw-scale-y: 95%;
  scale: var(--tw-scale-x) var(--tw-scale-y);
-}
scale_y_95 : Tailwind
scale_y_95 =
    Tailwind "scale-y-95"

{-| --tw-scale-z: 0%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_0 : Tailwind
scale_z_0 =
    Tailwind "scale-z-0"

{-| --tw-scale-z: 100%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_100 : Tailwind
scale_z_100 =
    Tailwind "scale-z-100"

{-| --tw-scale-z: 105%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_105 : Tailwind
scale_z_105 =
    Tailwind "scale-z-105"

{-| --tw-scale-z: 110%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_110 : Tailwind
scale_z_110 =
    Tailwind "scale-z-110"

{-| --tw-scale-z: 125%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_125 : Tailwind
scale_z_125 =
    Tailwind "scale-z-125"

{-| --tw-scale-z: 150%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_150 : Tailwind
scale_z_150 =
    Tailwind "scale-z-150"

{-| --tw-scale-z: 200%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_200 : Tailwind
scale_z_200 =
    Tailwind "scale-z-200"

{-| --tw-scale-z: 50%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_50 : Tailwind
scale_z_50 =
    Tailwind "scale-z-50"

{-| --tw-scale-z: 75%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_75 : Tailwind
scale_z_75 =
    Tailwind "scale-z-75"

{-| --tw-scale-z: 90%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_90 : Tailwind
scale_z_90 =
    Tailwind "scale-z-90"

{-| --tw-scale-z: 95%;
  scale: var(--tw-scale-x) var(--tw-scale-y) var(--tw-scale-z);
-}
scale_z_95 : Tailwind
scale_z_95 =
    Tailwind "scale-z-95"

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

{-| scroll-margin-block-end: 1px;
-}
scroll_mbe_px : Tailwind
scroll_mbe_px =
    Tailwind "scroll-mbe-px"

{-| scroll-margin-block-start: 1px;
-}
scroll_mbs_px : Tailwind
scroll_mbs_px =
    Tailwind "scroll-mbs-px"

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

{-| scroll-padding-block-end: 1px;
-}
scroll_pbe_px : Tailwind
scroll_pbe_px =
    Tailwind "scroll-pbe-px"

{-| scroll-padding-block-start: 1px;
-}
scroll_pbs_px : Tailwind
scroll_pbs_px =
    Tailwind "scroll-pbs-px"

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

{-| align-self: last baseline;
-}
self_baseline_last : Tailwind
self_baseline_last =
    Tailwind "self-baseline-last"

{-| align-self: center;
-}
self_center : Tailwind
self_center =
    Tailwind "self-center"

{-| align-self: safe center;
-}
self_center_safe : Tailwind
self_center_safe =
    Tailwind "self-center-safe"

{-| align-self: flex-end;
-}
self_end : Tailwind
self_end =
    Tailwind "self-end"

{-| align-self: safe flex-end;
-}
self_end_safe : Tailwind
self_end_safe =
    Tailwind "self-end-safe"

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

{-| --tw-sepia: sepia(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
sepia : Tailwind
sepia =
    Tailwind "sepia"

{-| --tw-sepia: sepia(0%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
sepia_0 : Tailwind
sepia_0 =
    Tailwind "sepia-0"

{-| --tw-sepia: sepia(100%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
sepia_100 : Tailwind
sepia_100 =
    Tailwind "sepia-100"

{-| --tw-sepia: sepia(50%);
  filter: var(--tw-blur,) var(--tw-brightness,) var(--tw-contrast,) var(--tw-grayscale,) var(--tw-hue-rotate,) var(--tw-invert,) var(--tw-saturate,) var(--tw-sepia,) var(--tw-drop-shadow,);
-}
sepia_50 : Tailwind
sepia_50 =
    Tailwind "sepia-50"

{-| --tw-shadow: 0 1px 3px 0 var(--tw-shadow-color, rgb(0 0 0 / 0.1)), 0 1px 2px -1px var(--tw-shadow-color, rgb(0 0 0 / 0.1));
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
shadow : Tailwind
shadow =
    Tailwind "shadow"

{-| --tw-shadow: 0 25px 50px -12px var(--tw-shadow-color, rgb(0 0 0 / 0.25));
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
shadow_2xl : Tailwind
shadow_2xl =
    Tailwind "shadow-2xl"

{-| --tw-shadow: 0 1px var(--tw-shadow-color, rgb(0 0 0 / 0.05));
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
shadow_2xs : Tailwind
shadow_2xs =
    Tailwind "shadow-2xs"

{-| --tw-shadow-color: initial;
-}
shadow_initial : Tailwind
shadow_initial =
    Tailwind "shadow-initial"

{-| --tw-shadow: 0 0 #0000;
  box-shadow: var(--tw-inset-shadow), var(--tw-inset-ring-shadow), var(--tw-ring-offset-shadow), var(--tw-ring-shadow), var(--tw-shadow);
-}
shadow_none : Tailwind
shadow_none =
    Tailwind "shadow-none"

{-| flex-shrink: 1;
-}
shrink : Tailwind
shrink =
    Tailwind "shrink"

{-| flex-shrink: 0;
-}
shrink_0 : Tailwind
shrink_0 =
    Tailwind "shrink-0"

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

{-| --tw-skew-x: skewX(0deg);
  --tw-skew-y: skewY(0deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_0 : Tailwind
skew_0 =
    Tailwind "skew-0"

{-| --tw-skew-x: skewX(1deg);
  --tw-skew-y: skewY(1deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_1 : Tailwind
skew_1 =
    Tailwind "skew-1"

{-| --tw-skew-x: skewX(12deg);
  --tw-skew-y: skewY(12deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_12 : Tailwind
skew_12 =
    Tailwind "skew-12"

{-| --tw-skew-x: skewX(2deg);
  --tw-skew-y: skewY(2deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_2 : Tailwind
skew_2 =
    Tailwind "skew-2"

{-| --tw-skew-x: skewX(3deg);
  --tw-skew-y: skewY(3deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_3 : Tailwind
skew_3 =
    Tailwind "skew-3"

{-| --tw-skew-x: skewX(6deg);
  --tw-skew-y: skewY(6deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_6 : Tailwind
skew_6 =
    Tailwind "skew-6"

{-| --tw-skew-x: skewX(0deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_x_0 : Tailwind
skew_x_0 =
    Tailwind "skew-x-0"

{-| --tw-skew-x: skewX(1deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_x_1 : Tailwind
skew_x_1 =
    Tailwind "skew-x-1"

{-| --tw-skew-x: skewX(12deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_x_12 : Tailwind
skew_x_12 =
    Tailwind "skew-x-12"

{-| --tw-skew-x: skewX(2deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_x_2 : Tailwind
skew_x_2 =
    Tailwind "skew-x-2"

{-| --tw-skew-x: skewX(3deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_x_3 : Tailwind
skew_x_3 =
    Tailwind "skew-x-3"

{-| --tw-skew-x: skewX(6deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_x_6 : Tailwind
skew_x_6 =
    Tailwind "skew-x-6"

{-| --tw-skew-y: skewY(0deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_y_0 : Tailwind
skew_y_0 =
    Tailwind "skew-y-0"

{-| --tw-skew-y: skewY(1deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_y_1 : Tailwind
skew_y_1 =
    Tailwind "skew-y-1"

{-| --tw-skew-y: skewY(12deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_y_12 : Tailwind
skew_y_12 =
    Tailwind "skew-y-12"

{-| --tw-skew-y: skewY(2deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_y_2 : Tailwind
skew_y_2 =
    Tailwind "skew-y-2"

{-| --tw-skew-y: skewY(3deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_y_3 : Tailwind
skew_y_3 =
    Tailwind "skew-y-3"

{-| --tw-skew-y: skewY(6deg);
  transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
skew_y_6 : Tailwind
skew_y_6 =
    Tailwind "skew-y-6"

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
  clip-path: inset(50%);
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

{-| stroke-width: 0;
-}
stroke_0 : Tailwind
stroke_0 =
    Tailwind "stroke-0"

{-| stroke-width: 1;
-}
stroke_1 : Tailwind
stroke_1 =
    Tailwind "stroke-1"

{-| stroke-width: 2;
-}
stroke_2 : Tailwind
stroke_2 =
    Tailwind "stroke-2"

{-| stroke-width: 3;
-}
stroke_3 : Tailwind
stroke_3 =
    Tailwind "stroke-3"

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

{-| font-size: var(--text-2xl);
  line-height: var(--tw-leading, var(--text-2xl--line-height));
-}
text_2xl : Tailwind
text_2xl =
    Tailwind "text-2xl"

{-| font-size: var(--text-3xl);
  line-height: var(--tw-leading, var(--text-3xl--line-height));
-}
text_3xl : Tailwind
text_3xl =
    Tailwind "text-3xl"

{-| font-size: var(--text-4xl);
  line-height: var(--tw-leading, var(--text-4xl--line-height));
-}
text_4xl : Tailwind
text_4xl =
    Tailwind "text-4xl"

{-| font-size: var(--text-5xl);
  line-height: var(--tw-leading, var(--text-5xl--line-height));
-}
text_5xl : Tailwind
text_5xl =
    Tailwind "text-5xl"

{-| font-size: var(--text-6xl);
  line-height: var(--tw-leading, var(--text-6xl--line-height));
-}
text_6xl : Tailwind
text_6xl =
    Tailwind "text-6xl"

{-| font-size: var(--text-7xl);
  line-height: var(--tw-leading, var(--text-7xl--line-height));
-}
text_7xl : Tailwind
text_7xl =
    Tailwind "text-7xl"

{-| font-size: var(--text-8xl);
  line-height: var(--tw-leading, var(--text-8xl--line-height));
-}
text_8xl : Tailwind
text_8xl =
    Tailwind "text-8xl"

{-| font-size: var(--text-9xl);
  line-height: var(--tw-leading, var(--text-9xl--line-height));
-}
text_9xl : Tailwind
text_9xl =
    Tailwind "text-9xl"

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

{-| text-shadow: 0px 1px 0px var(--tw-text-shadow-color, rgb(0 0 0 / 0.15));
-}
text_shadow_2xs : Tailwind
text_shadow_2xs =
    Tailwind "text-shadow-2xs"

{-| --tw-text-shadow-color: initial;
-}
text_shadow_initial : Tailwind
text_shadow_initial =
    Tailwind "text-shadow-initial"

{-| text-shadow: 0px 1px 2px var(--tw-text-shadow-color, rgb(0 0 0 / 0.1)), 0px 3px 2px var(--tw-text-shadow-color, rgb(0 0 0 / 0.1)), 0px 4px 8px var(--tw-text-shadow-color, rgb(0 0 0 / 0.1));
-}
text_shadow_lg : Tailwind
text_shadow_lg =
    Tailwind "text-shadow-lg"

{-| text-shadow: 0px 1px 1px var(--tw-text-shadow-color, rgb(0 0 0 / 0.1)), 0px 1px 2px var(--tw-text-shadow-color, rgb(0 0 0 / 0.1)), 0px 2px 4px var(--tw-text-shadow-color, rgb(0 0 0 / 0.1));
-}
text_shadow_md : Tailwind
text_shadow_md =
    Tailwind "text-shadow-md"

{-| text-shadow: none;
-}
text_shadow_none : Tailwind
text_shadow_none =
    Tailwind "text-shadow-none"

{-| text-shadow: 0px 1px 0px var(--tw-text-shadow-color, rgb(0 0 0 / 0.075)), 0px 1px 1px var(--tw-text-shadow-color, rgb(0 0 0 / 0.075)), 0px 2px 2px var(--tw-text-shadow-color, rgb(0 0 0 / 0.075));
-}
text_shadow_sm : Tailwind
text_shadow_sm =
    Tailwind "text-shadow-sm"

{-| text-shadow: 0px 1px 1px var(--tw-text-shadow-color, rgb(0 0 0 / 0.2));
-}
text_shadow_xs : Tailwind
text_shadow_xs =
    Tailwind "text-shadow-xs"

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

{-| --tw-tracking: var(--tracking-normal);
  letter-spacing: var(--tracking-normal);
-}
tracking_normal : Tailwind
tracking_normal =
    Tailwind "tracking-normal"

{-| --tw-tracking: var(--tracking-tight);
  letter-spacing: var(--tracking-tight);
-}
tracking_tight : Tailwind
tracking_tight =
    Tailwind "tracking-tight"

{-| --tw-tracking: var(--tracking-tighter);
  letter-spacing: var(--tracking-tighter);
-}
tracking_tighter : Tailwind
tracking_tighter =
    Tailwind "tracking-tighter"

{-| --tw-tracking: var(--tracking-wide);
  letter-spacing: var(--tracking-wide);
-}
tracking_wide : Tailwind
tracking_wide =
    Tailwind "tracking-wide"

{-| --tw-tracking: var(--tracking-wider);
  letter-spacing: var(--tracking-wider);
-}
tracking_wider : Tailwind
tracking_wider =
    Tailwind "tracking-wider"

{-| --tw-tracking: var(--tracking-widest);
  letter-spacing: var(--tracking-widest);
-}
tracking_widest : Tailwind
tracking_widest =
    Tailwind "tracking-widest"

{-| transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
-}
transform : Tailwind
transform =
    Tailwind "transform"

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

{-| transform: var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
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

{-| transform: translateZ(0) var(--tw-rotate-x,) var(--tw-rotate-y,) var(--tw-rotate-z,) var(--tw-skew-x,) var(--tw-skew-y,);
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

{-| transition-property: color, background-color, border-color, outline-color, text-decoration-color, fill, stroke, --tw-gradient-from, --tw-gradient-via, --tw-gradient-to, opacity, box-shadow, transform, translate, scale, rotate, filter, -webkit-backdrop-filter, backdrop-filter, display, content-visibility, overlay, pointer-events;
  transition-timing-function: var(--tw-ease, var(--default-transition-timing-function));
  transition-duration: var(--tw-duration, var(--default-transition-duration));
-}
transition : Tailwind
transition =
    Tailwind "transition"

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

{-| text-underline-offset: 0px;
-}
underline_offset_0 : Tailwind
underline_offset_0 =
    Tailwind "underline-offset-0"

{-| text-underline-offset: 1px;
-}
underline_offset_1 : Tailwind
underline_offset_1 =
    Tailwind "underline-offset-1"

{-| text-underline-offset: 2px;
-}
underline_offset_2 : Tailwind
underline_offset_2 =
    Tailwind "underline-offset-2"

{-| text-underline-offset: 4px;
-}
underline_offset_4 : Tailwind
underline_offset_4 =
    Tailwind "underline-offset-4"

{-| text-underline-offset: 8px;
-}
underline_offset_8 : Tailwind
underline_offset_8 =
    Tailwind "underline-offset-8"

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

{-| overflow-wrap: anywhere;
-}
wrap_anywhere : Tailwind
wrap_anywhere =
    Tailwind "wrap-anywhere"

{-| overflow-wrap: break-word;
-}
wrap_break_word : Tailwind
wrap_break_word =
    Tailwind "wrap-break-word"

{-| overflow-wrap: normal;
-}
wrap_normal : Tailwind
wrap_normal =
    Tailwind "wrap-normal"
