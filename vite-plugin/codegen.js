// Elm code generator for Tailwind theme
// Generates type-safe Elm modules from Tailwind configuration

import { resolveTheme } from 'tailwind-resolver';
import fs from 'fs';
import path from 'path';

/**
 * Generate Elm modules from a Tailwind CSS file
 * @param {string} cssPath - Path to CSS file with Tailwind config
 * @param {string} outputDir - Directory to write generated Elm files
 * @returns {Promise<{success: boolean, error?: string}>}
 */
export async function generateElmModules(cssPath, outputDir) {
  try {
    const result = await resolveTheme({ input: cssPath });
    const theme = result.variants?.default;

    if (!theme) {
      return { success: false, error: 'Failed to resolve Tailwind theme' };
    }

    // Ensure output directories exist
    ensureDir(outputDir);
    ensureDir(path.join(outputDir, 'Tailwind'));

    // Generate all modules
    writeElmFile(outputDir, 'Tailwind.elm', generateTailwindWithUtilities(theme));
    writeElmFile(outputDir, 'Tailwind/Theme.elm', generateTheme(theme));
    writeElmFile(outputDir, 'Tailwind/Breakpoints.elm', generateBreakpoints(theme));

    return { success: true };
  } catch (e) {
    return { success: false, error: e.message };
  }
}

function ensureDir(dir) {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
}

function writeElmFile(outputDir, modulePath, content) {
  const fullPath = path.join(outputDir, modulePath);
  fs.writeFileSync(fullPath, content);
}

// Convert Tailwind class name to Elm identifier
function toElmName(className) {
  let name = className;
  if (/^\d/.test(name)) {
    name = 'n' + name;
  }
  name = name.replace(/-/g, '_').replace(/\./g, '_dot_');
  name = name.replace(/\//g, 'over');
  return name;
}

function generateTailwindWithUtilities(theme) {
  const fontSizes = Object.keys(theme.fontSize || {});
  const fontWeights = Object.keys(theme.fontWeight || {});
  const radiusSizes = Object.keys(theme.radius || {}).filter(k => k !== 'default');
  const shadowSizes = Object.keys(theme.shadows || {}).filter(k => k !== 'default');

  // Build exports
  const spacingExports = [
    'p', 'px', 'py', 'pt', 'pr', 'pb', 'pl',
    'm', 'mx', 'my', 'mt', 'mr', 'mb', 'ml',
    'neg_m', 'neg_mx', 'neg_my', 'neg_mt', 'neg_mr', 'neg_mb', 'neg_ml',
    'gap', 'gap_x', 'gap_y'
  ];

  const layoutExports = [
    'flex', 'inline_flex', 'block', 'inline_block', 'inline', 'grid', 'hidden',
    'flex_row', 'flex_row_reverse', 'flex_col', 'flex_col_reverse',
    'flex_wrap', 'flex_wrap_reverse', 'flex_nowrap',
    'grow', 'grow_0', 'shrink', 'shrink_0',
    'items_start', 'items_end', 'items_center', 'items_baseline', 'items_stretch',
    'justify_start', 'justify_end', 'justify_center', 'justify_between', 'justify_around', 'justify_evenly',
    'relative', 'absolute', 'fixed', 'sticky', 'static',
    'visible', 'invisible',
    'overflow_auto', 'overflow_hidden', 'overflow_visible', 'overflow_scroll',
    'overflow_x_auto', 'overflow_y_auto', 'overflow_x_hidden', 'overflow_y_hidden'
  ];

  const widthFractions = [
    '1/2', '1/3', '2/3', '1/4', '2/4', '3/4',
    '1/5', '2/5', '3/5', '4/5',
    '1/6', '2/6', '3/6', '4/6', '5/6',
    '1/12', '2/12', '3/12', '4/12', '5/12', '6/12', '7/12', '8/12', '9/12', '10/12', '11/12'
  ];

  const widthFractionExports = widthFractions.map(f => 'w_' + f.replace('/', 'over'));
  const heightFractionExports = widthFractions.map(f => 'h_' + f.replace('/', 'over'));

  const sizingExports = [
    'w', ...widthFractionExports, 'w_full', 'w_screen', 'w_auto', 'w_min', 'w_max', 'w_fit',
    'h', ...heightFractionExports, 'h_full', 'h_screen', 'h_auto', 'h_min', 'h_max', 'h_fit',
    'min_w', 'max_w', 'min_h', 'max_h'
  ];

  const typographyExports = [
    'text_left', 'text_center', 'text_right', 'text_justify',
    'font_sans', 'font_serif', 'font_mono',
    'italic', 'not_italic',
    'uppercase', 'lowercase', 'capitalize', 'normal_case',
    'underline', 'line_through', 'no_underline',
    'whitespace_normal', 'whitespace_nowrap', 'whitespace_pre', 'whitespace_pre_line', 'whitespace_pre_wrap',
    'truncate', 'text_ellipsis', 'text_clip'
  ];

  const fontSizeExports = fontSizes.map(size => `text_${toElmName(size)}`);
  const fontWeightExports = fontWeights.map(weight => `font_${toElmName(weight)}`);

  const borderExports = [
    'border', 'border_0', 'border_2', 'border_4', 'border_8',
    'border_t', 'border_r', 'border_b', 'border_l',
    'rounded', 'rounded_none', 'rounded_full'
  ];

  const radiusExports = radiusSizes.map(size => `rounded_${toElmName(size)}`);

  const effectExports = [
    'shadow', 'shadow_none',
    'transition', 'transition_all', 'transition_none', 'transition_colors', 'transition_opacity', 'transition_shadow', 'transition_transform',
    'animate_none', 'animate_spin', 'animate_ping', 'animate_pulse', 'animate_bounce',
    'cursor_auto', 'cursor_default', 'cursor_pointer', 'cursor_wait', 'cursor_text', 'cursor_move', 'cursor_not_allowed',
    'pointer_events_none', 'pointer_events_auto',
    'select_none', 'select_text', 'select_all', 'select_auto'
  ];

  const shadowExports = shadowSizes.map(size => `shadow_${toElmName(size)}`);

  const colorUtilExports = [
    'text_color', 'bg_color', 'border_color', 'ring_color', 'placeholder_color',
    'text_simple', 'bg_simple', 'border_simple'
  ];

  const opacityExports = [
    'opacity_0', 'opacity_5', 'opacity_10', 'opacity_20', 'opacity_25', 'opacity_30', 'opacity_40',
    'opacity_50', 'opacity_60', 'opacity_70', 'opacity_75', 'opacity_80', 'opacity_90', 'opacity_95', 'opacity_100'
  ];

  const zIndexExports = ['z_0', 'z_10', 'z_20', 'z_30', 'z_40', 'z_50', 'z_auto'];

  const allUtilityExports = [
    ...spacingExports,
    ...layoutExports,
    ...sizingExports,
    ...typographyExports,
    ...fontSizeExports,
    ...fontWeightExports,
    ...borderExports,
    ...radiusExports,
    ...effectExports,
    ...shadowExports,
    ...colorUtilExports,
    ...opacityExports,
    ...zIndexExports,
  ];

  // Generate function definitions
  const fontSizeFunctions = fontSizes.map(size => {
    const name = `text_${toElmName(size)}`;
    return `
${name} : Tailwind
${name} =
    Tailwind "text-${size}"`;
  });

  const fontWeightFunctions = fontWeights.map(weight => {
    const name = `font_${toElmName(weight)}`;
    return `
${name} : Tailwind
${name} =
    Tailwind "font-${weight}"`;
  });

  const radiusFunctions = radiusSizes.map(size => `
rounded_${toElmName(size)} : Tailwind
rounded_${toElmName(size)} =
    Tailwind "rounded-${size}"`);

  const shadowFunctions = shadowSizes.map(size => `
shadow_${toElmName(size)} : Tailwind
shadow_${toElmName(size)} =
    Tailwind "shadow-${size}"`);

  const widthFractionDefs = widthFractions.map(f => {
    const elmName = 'w_' + f.replace('/', 'over');
    return `
${elmName} : Tailwind
${elmName} =
    Tailwind "w-${f}"`;
  });

  const heightFractionDefs = widthFractions.map(f => {
    const elmName = 'h_' + f.replace('/', 'over');
    return `
${elmName} : Tailwind
${elmName} =
    Tailwind "h-${f}"`;
  });

  return `module Tailwind exposing
    ( Tailwind(..)
    , classes
    , batch
    , raw
    , toClass
    , ${allUtilityExports.join('\n    , ')}
    )

{-| Type-safe Tailwind CSS for Elm.

This module provides the \`Tailwind\` type and all utility functions.
Use \`classes\` to convert a list of Tailwind values to an \`Html.Attribute\`.

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
toClassName : Tailwind -> String
toClassName (Tailwind className) =
    className


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


pt : Spacing -> Tailwind
pt spacing =
    Tailwind ("pt-" ++ spacingToString spacing)


pr : Spacing -> Tailwind
pr spacing =
    Tailwind ("pr-" ++ spacingToString spacing)


pb : Spacing -> Tailwind
pb spacing =
    Tailwind ("pb-" ++ spacingToString spacing)


pl : Spacing -> Tailwind
pl spacing =
    Tailwind ("pl-" ++ spacingToString spacing)


m : Spacing -> Tailwind
m spacing =
    Tailwind ("m-" ++ spacingToString spacing)


mx : Spacing -> Tailwind
mx spacing =
    Tailwind ("mx-" ++ spacingToString spacing)


my : Spacing -> Tailwind
my spacing =
    Tailwind ("my-" ++ spacingToString spacing)


mt : Spacing -> Tailwind
mt spacing =
    Tailwind ("mt-" ++ spacingToString spacing)


mr : Spacing -> Tailwind
mr spacing =
    Tailwind ("mr-" ++ spacingToString spacing)


mb : Spacing -> Tailwind
mb spacing =
    Tailwind ("mb-" ++ spacingToString spacing)


ml : Spacing -> Tailwind
ml spacing =
    Tailwind ("ml-" ++ spacingToString spacing)


neg_m : Spacing -> Tailwind
neg_m spacing =
    Tailwind ("-m-" ++ spacingToString spacing)


neg_mx : Spacing -> Tailwind
neg_mx spacing =
    Tailwind ("-mx-" ++ spacingToString spacing)


neg_my : Spacing -> Tailwind
neg_my spacing =
    Tailwind ("-my-" ++ spacingToString spacing)


neg_mt : Spacing -> Tailwind
neg_mt spacing =
    Tailwind ("-mt-" ++ spacingToString spacing)


neg_mr : Spacing -> Tailwind
neg_mr spacing =
    Tailwind ("-mr-" ++ spacingToString spacing)


neg_mb : Spacing -> Tailwind
neg_mb spacing =
    Tailwind ("-mb-" ++ spacingToString spacing)


neg_ml : Spacing -> Tailwind
neg_ml spacing =
    Tailwind ("-ml-" ++ spacingToString spacing)


gap : Spacing -> Tailwind
gap spacing =
    Tailwind ("gap-" ++ spacingToString spacing)


gap_x : Spacing -> Tailwind
gap_x spacing =
    Tailwind ("gap-x-" ++ spacingToString spacing)


gap_y : Spacing -> Tailwind
gap_y spacing =
    Tailwind ("gap-y-" ++ spacingToString spacing)


-- LAYOUT

flex : Tailwind
flex =
    Tailwind "flex"


inline_flex : Tailwind
inline_flex =
    Tailwind "inline-flex"


block : Tailwind
block =
    Tailwind "block"


inline_block : Tailwind
inline_block =
    Tailwind "inline-block"


inline : Tailwind
inline =
    Tailwind "inline"


grid : Tailwind
grid =
    Tailwind "grid"


hidden : Tailwind
hidden =
    Tailwind "hidden"


flex_row : Tailwind
flex_row =
    Tailwind "flex-row"


flex_row_reverse : Tailwind
flex_row_reverse =
    Tailwind "flex-row-reverse"


flex_col : Tailwind
flex_col =
    Tailwind "flex-col"


flex_col_reverse : Tailwind
flex_col_reverse =
    Tailwind "flex-col-reverse"


flex_wrap : Tailwind
flex_wrap =
    Tailwind "flex-wrap"


flex_wrap_reverse : Tailwind
flex_wrap_reverse =
    Tailwind "flex-wrap-reverse"


flex_nowrap : Tailwind
flex_nowrap =
    Tailwind "flex-nowrap"


grow : Tailwind
grow =
    Tailwind "grow"


grow_0 : Tailwind
grow_0 =
    Tailwind "grow-0"


shrink : Tailwind
shrink =
    Tailwind "shrink"


shrink_0 : Tailwind
shrink_0 =
    Tailwind "shrink-0"


items_start : Tailwind
items_start =
    Tailwind "items-start"


items_end : Tailwind
items_end =
    Tailwind "items-end"


items_center : Tailwind
items_center =
    Tailwind "items-center"


items_baseline : Tailwind
items_baseline =
    Tailwind "items-baseline"


items_stretch : Tailwind
items_stretch =
    Tailwind "items-stretch"


justify_start : Tailwind
justify_start =
    Tailwind "justify-start"


justify_end : Tailwind
justify_end =
    Tailwind "justify-end"


justify_center : Tailwind
justify_center =
    Tailwind "justify-center"


justify_between : Tailwind
justify_between =
    Tailwind "justify-between"


justify_around : Tailwind
justify_around =
    Tailwind "justify-around"


justify_evenly : Tailwind
justify_evenly =
    Tailwind "justify-evenly"


relative : Tailwind
relative =
    Tailwind "relative"


absolute : Tailwind
absolute =
    Tailwind "absolute"


fixed : Tailwind
fixed =
    Tailwind "fixed"


sticky : Tailwind
sticky =
    Tailwind "sticky"


static : Tailwind
static =
    Tailwind "static"


visible : Tailwind
visible =
    Tailwind "visible"


invisible : Tailwind
invisible =
    Tailwind "invisible"


overflow_auto : Tailwind
overflow_auto =
    Tailwind "overflow-auto"


overflow_hidden : Tailwind
overflow_hidden =
    Tailwind "overflow-hidden"


overflow_visible : Tailwind
overflow_visible =
    Tailwind "overflow-visible"


overflow_scroll : Tailwind
overflow_scroll =
    Tailwind "overflow-scroll"


overflow_x_auto : Tailwind
overflow_x_auto =
    Tailwind "overflow-x-auto"


overflow_y_auto : Tailwind
overflow_y_auto =
    Tailwind "overflow-y-auto"


overflow_x_hidden : Tailwind
overflow_x_hidden =
    Tailwind "overflow-x-hidden"


overflow_y_hidden : Tailwind
overflow_y_hidden =
    Tailwind "overflow-y-hidden"


-- SIZING

w : Spacing -> Tailwind
w spacing =
    Tailwind ("w-" ++ spacingToString spacing)

${widthFractionDefs.join('\n')}


w_full : Tailwind
w_full =
    Tailwind "w-full"


w_screen : Tailwind
w_screen =
    Tailwind "w-screen"


w_auto : Tailwind
w_auto =
    Tailwind "w-auto"


w_min : Tailwind
w_min =
    Tailwind "w-min"


w_max : Tailwind
w_max =
    Tailwind "w-max"


w_fit : Tailwind
w_fit =
    Tailwind "w-fit"


h : Spacing -> Tailwind
h spacing =
    Tailwind ("h-" ++ spacingToString spacing)

${heightFractionDefs.join('\n')}


h_full : Tailwind
h_full =
    Tailwind "h-full"


h_screen : Tailwind
h_screen =
    Tailwind "h-screen"


h_auto : Tailwind
h_auto =
    Tailwind "h-auto"


h_min : Tailwind
h_min =
    Tailwind "h-min"


h_max : Tailwind
h_max =
    Tailwind "h-max"


h_fit : Tailwind
h_fit =
    Tailwind "h-fit"


min_w : Spacing -> Tailwind
min_w spacing =
    Tailwind ("min-w-" ++ spacingToString spacing)


max_w : Spacing -> Tailwind
max_w spacing =
    Tailwind ("max-w-" ++ spacingToString spacing)


min_h : Spacing -> Tailwind
min_h spacing =
    Tailwind ("min-h-" ++ spacingToString spacing)


max_h : Spacing -> Tailwind
max_h spacing =
    Tailwind ("max-h-" ++ spacingToString spacing)


-- TYPOGRAPHY

text_left : Tailwind
text_left =
    Tailwind "text-left"


text_center : Tailwind
text_center =
    Tailwind "text-center"


text_right : Tailwind
text_right =
    Tailwind "text-right"


text_justify : Tailwind
text_justify =
    Tailwind "text-justify"


font_sans : Tailwind
font_sans =
    Tailwind "font-sans"


font_serif : Tailwind
font_serif =
    Tailwind "font-serif"


font_mono : Tailwind
font_mono =
    Tailwind "font-mono"


italic : Tailwind
italic =
    Tailwind "italic"


not_italic : Tailwind
not_italic =
    Tailwind "not-italic"


uppercase : Tailwind
uppercase =
    Tailwind "uppercase"


lowercase : Tailwind
lowercase =
    Tailwind "lowercase"


capitalize : Tailwind
capitalize =
    Tailwind "capitalize"


normal_case : Tailwind
normal_case =
    Tailwind "normal-case"


underline : Tailwind
underline =
    Tailwind "underline"


line_through : Tailwind
line_through =
    Tailwind "line-through"


no_underline : Tailwind
no_underline =
    Tailwind "no-underline"


whitespace_normal : Tailwind
whitespace_normal =
    Tailwind "whitespace-normal"


whitespace_nowrap : Tailwind
whitespace_nowrap =
    Tailwind "whitespace-nowrap"


whitespace_pre : Tailwind
whitespace_pre =
    Tailwind "whitespace-pre"


whitespace_pre_line : Tailwind
whitespace_pre_line =
    Tailwind "whitespace-pre-line"


whitespace_pre_wrap : Tailwind
whitespace_pre_wrap =
    Tailwind "whitespace-pre-wrap"


truncate : Tailwind
truncate =
    Tailwind "truncate"


text_ellipsis : Tailwind
text_ellipsis =
    Tailwind "text-ellipsis"


text_clip : Tailwind
text_clip =
    Tailwind "text-clip"


-- FONT SIZE
${fontSizeFunctions.join('\n')}


-- FONT WEIGHT
${fontWeightFunctions.join('\n')}


-- BORDER

border : Tailwind
border =
    Tailwind "border"


border_0 : Tailwind
border_0 =
    Tailwind "border-0"


border_2 : Tailwind
border_2 =
    Tailwind "border-2"


border_4 : Tailwind
border_4 =
    Tailwind "border-4"


border_8 : Tailwind
border_8 =
    Tailwind "border-8"


border_t : Tailwind
border_t =
    Tailwind "border-t"


border_r : Tailwind
border_r =
    Tailwind "border-r"


border_b : Tailwind
border_b =
    Tailwind "border-b"


border_l : Tailwind
border_l =
    Tailwind "border-l"


rounded : Tailwind
rounded =
    Tailwind "rounded"


rounded_none : Tailwind
rounded_none =
    Tailwind "rounded-none"


rounded_full : Tailwind
rounded_full =
    Tailwind "rounded-full"

${radiusFunctions.join('\n')}


-- EFFECTS

shadow : Tailwind
shadow =
    Tailwind "shadow"


shadow_none : Tailwind
shadow_none =
    Tailwind "shadow-none"

${shadowFunctions.join('\n')}


transition : Tailwind
transition =
    Tailwind "transition"


transition_all : Tailwind
transition_all =
    Tailwind "transition-all"


transition_none : Tailwind
transition_none =
    Tailwind "transition-none"


transition_colors : Tailwind
transition_colors =
    Tailwind "transition-colors"


transition_opacity : Tailwind
transition_opacity =
    Tailwind "transition-opacity"


transition_shadow : Tailwind
transition_shadow =
    Tailwind "transition-shadow"


transition_transform : Tailwind
transition_transform =
    Tailwind "transition-transform"


animate_none : Tailwind
animate_none =
    Tailwind "animate-none"


animate_spin : Tailwind
animate_spin =
    Tailwind "animate-spin"


animate_ping : Tailwind
animate_ping =
    Tailwind "animate-ping"


animate_pulse : Tailwind
animate_pulse =
    Tailwind "animate-pulse"


animate_bounce : Tailwind
animate_bounce =
    Tailwind "animate-bounce"


cursor_auto : Tailwind
cursor_auto =
    Tailwind "cursor-auto"


cursor_default : Tailwind
cursor_default =
    Tailwind "cursor-default"


cursor_pointer : Tailwind
cursor_pointer =
    Tailwind "cursor-pointer"


cursor_wait : Tailwind
cursor_wait =
    Tailwind "cursor-wait"


cursor_text : Tailwind
cursor_text =
    Tailwind "cursor-text"


cursor_move : Tailwind
cursor_move =
    Tailwind "cursor-move"


cursor_not_allowed : Tailwind
cursor_not_allowed =
    Tailwind "cursor-not-allowed"


pointer_events_none : Tailwind
pointer_events_none =
    Tailwind "pointer-events-none"


pointer_events_auto : Tailwind
pointer_events_auto =
    Tailwind "pointer-events-auto"


select_none : Tailwind
select_none =
    Tailwind "select-none"


select_text : Tailwind
select_text =
    Tailwind "select-text"


select_all : Tailwind
select_all =
    Tailwind "select-all"


select_auto : Tailwind
select_auto =
    Tailwind "select-auto"


-- COLOR UTILITIES

text_color : Color -> Tailwind
text_color color =
    Tailwind ("text-" ++ colorToString color)


bg_color : Color -> Tailwind
bg_color color =
    Tailwind ("bg-" ++ colorToString color)


border_color : Color -> Tailwind
border_color color =
    Tailwind ("border-" ++ colorToString color)


ring_color : Color -> Tailwind
ring_color color =
    Tailwind ("ring-" ++ colorToString color)


placeholder_color : Color -> Tailwind
placeholder_color color =
    Tailwind ("placeholder-" ++ colorToString color)


text_simple : SimpleColor -> Tailwind
text_simple (SimpleColor c) =
    Tailwind ("text-" ++ c)


bg_simple : SimpleColor -> Tailwind
bg_simple (SimpleColor c) =
    Tailwind ("bg-" ++ c)


border_simple : SimpleColor -> Tailwind
border_simple (SimpleColor c) =
    Tailwind ("border-" ++ c)


-- OPACITY

opacity_0 : Tailwind
opacity_0 =
    Tailwind "opacity-0"


opacity_5 : Tailwind
opacity_5 =
    Tailwind "opacity-5"


opacity_10 : Tailwind
opacity_10 =
    Tailwind "opacity-10"


opacity_20 : Tailwind
opacity_20 =
    Tailwind "opacity-20"


opacity_25 : Tailwind
opacity_25 =
    Tailwind "opacity-25"


opacity_30 : Tailwind
opacity_30 =
    Tailwind "opacity-30"


opacity_40 : Tailwind
opacity_40 =
    Tailwind "opacity-40"


opacity_50 : Tailwind
opacity_50 =
    Tailwind "opacity-50"


opacity_60 : Tailwind
opacity_60 =
    Tailwind "opacity-60"


opacity_70 : Tailwind
opacity_70 =
    Tailwind "opacity-70"


opacity_75 : Tailwind
opacity_75 =
    Tailwind "opacity-75"


opacity_80 : Tailwind
opacity_80 =
    Tailwind "opacity-80"


opacity_90 : Tailwind
opacity_90 =
    Tailwind "opacity-90"


opacity_95 : Tailwind
opacity_95 =
    Tailwind "opacity-95"


opacity_100 : Tailwind
opacity_100 =
    Tailwind "opacity-100"


-- Z-INDEX

z_0 : Tailwind
z_0 =
    Tailwind "z-0"


z_10 : Tailwind
z_10 =
    Tailwind "z-10"


z_20 : Tailwind
z_20 =
    Tailwind "z-20"


z_30 : Tailwind
z_30 =
    Tailwind "z-30"


z_40 : Tailwind
z_40 =
    Tailwind "z-40"


z_50 : Tailwind
z_50 =
    Tailwind "z-50"


z_auto : Tailwind
z_auto =
    Tailwind "z-auto"
`;
}

function generateTheme(theme) {
  const colors = theme.colors;
  const colorNames = Object.keys(colors);

  // Separate shaded colors from simple colors
  const shadedColors = [];
  const simpleColors = [];

  for (const colorName of colorNames) {
    const colorValue = colors[colorName];
    if (typeof colorValue === 'string') {
      simpleColors.push(colorName);
    } else {
      shadedColors.push(colorName);
    }
  }

  const shadeScale = ['50', '100', '200', '300', '400', '500', '600', '700', '800', '900', '950'];

  // Colors are now functions that take a shade
  const colorValueDefs = shadedColors.map(c => {
    const valueName = toElmName(c);
    return `
{-| ${c.charAt(0).toUpperCase() + c.slice(1)} color. Apply a shade: \`${valueName} s500\`
-}
${valueName} : Shade -> Color
${valueName} shade =
    Color ("${c}-" ++ shadeToString shade)`;
  });
  const colorValueExports = shadedColors.map(c => toElmName(c));

  const shadeConstructors = shadeScale.map(s => `S${s}`);
  const shadeValueDefs = shadeScale.map(s => `
{-| Shade ${s}
-}
s${s} : Shade
s${s} =
    S${s}`);
  const shadeValueExports = shadeScale.map(s => `s${s}`);
  const shadeCases = shadeScale.map(s => `        S${s} ->\n            "${s}"`);

  const simpleColorDefs = simpleColors.map(c => {
    const elmName = toElmName(c);
    return `
{-| Simple color: ${c}
-}
${elmName} : SimpleColor
${elmName} =
    SimpleColor "${c}"`;
  });
  const simpleColorExports = simpleColors.map(c => toElmName(c));

  const spacingScale = [
    '0', 'px', '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '14', '16', '20', '24', '28', '32', '36', '40', '44', '48', '52', '56', '60',
    '64', '72', '80', '96'
  ];

  const spacingConstructors = spacingScale.map(v => {
    return 'S' + toElmName(v).replace(/^n/, '');
  });

  const spacingValueDefs = [];
  const spacingValueExports = [];
  for (const v of spacingScale) {
    const constructorName = 'S' + toElmName(v).replace(/^n/, '');
    const valueName = 's' + toElmName(v).replace(/^n/, '');
    spacingValueExports.push(valueName);
    spacingValueDefs.push(`
{-| Spacing: ${v}
-}
${valueName} : Spacing
${valueName} =
    ${constructorName}`);
  }

  const spacingCases = spacingScale.map(v => {
    const constructorName = 'S' + toElmName(v).replace(/^n/, '');
    return `        ${constructorName} ->\n            "${v}"`;
  });

  const opacityValues = [0, 5, 10, 20, 25, 30, 40, 50, 60, 70, 75, 80, 90, 95, 100];
  const opacityDefs = opacityValues.map(v => `
{-| Opacity ${v}%
-}
opacity${v} : Opacity
opacity${v} =
    Opacity ${v}`);
  const opacityExports = opacityValues.map(v => `opacity${v}`);

  return `module Tailwind.Theme exposing
    ( Color, colorToString
    , Shade(..), shadeToString
    , SimpleColor(..)
    , Spacing(..), spacingToString
    , Opacity(..)
    , ${colorValueExports.join('\n    , ')}
    , ${shadeValueExports.join('\n    , ')}
    , ${simpleColorExports.join('\n    , ')}
    , ${spacingValueExports.join('\n    , ')}
    , ${opacityExports.join('\n    , ')}
    )

{-| Theme values for Tailwind CSS.

This module provides type-safe color, shade, spacing, and opacity values.


## Color Type

@docs Color, colorToString


## Shaded Colors

Colors that take a shade parameter. Usage: \`text_color (blue s500)\`

@docs ${colorValueExports.join(', ')}


## Shades

@docs Shade, shadeToString, ${shadeValueExports.join(', ')}


## Simple Colors

Colors without shades. Usage: \`text_simple white\`

@docs SimpleColor, ${simpleColorExports.join(', ')}


## Spacing

@docs Spacing, spacingToString, ${spacingValueExports.join(', ')}


## Opacities

@docs Opacity, ${opacityExports.join(', ')}

-}


{-| A color value that can be used with color utilities like \`text_color\`, \`bg_color\`, etc.

Colors are created by applying a shade to a color name like \`blue s500\`.

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
    = ${shadeConstructors.join('\n    | ')}


{-| Convert a Shade to its CSS class string.
-}
shadeToString : Shade -> String
shadeToString shade =
    case shade of
${shadeCases.join('\n\n')}


{-| A simple color without shades (white, black, transparent, etc.).
-}
type SimpleColor
    = SimpleColor String


{-| A Tailwind spacing value from the default scale.
-}
type Spacing
    = ${spacingConstructors.join('\n    | ')}


{-| Convert a Spacing value to its CSS class suffix.
-}
spacingToString : Spacing -> String
spacingToString spacing =
    case spacing of
${spacingCases.join('\n\n')}


{-| An opacity value (0-100).
-}
type Opacity
    = Opacity Int


-- SHADED COLORS
${colorValueDefs.join('\n')}


-- SHADES
${shadeValueDefs.join('\n')}


-- SIMPLE COLORS
${simpleColorDefs.join('\n')}


-- SPACING VALUES
${spacingValueDefs.join('\n')}


-- OPACITY VALUES
${opacityDefs.join('\n')}
`;
}

function generateUtilities(theme) {
  const fontSizes = Object.keys(theme.fontSize || {});
  const fontWeights = Object.keys(theme.fontWeight || {});
  const radiusSizes = Object.keys(theme.radius || {}).filter(k => k !== 'default');
  const shadowSizes = Object.keys(theme.shadows || {}).filter(k => k !== 'default');

  // Build exports and definitions (simplified - using key patterns from original)
  const spacingExports = [
    'p', 'px', 'py', 'pt', 'pr', 'pb', 'pl',
    'm', 'mx', 'my', 'mt', 'mr', 'mb', 'ml',
    'neg_m', 'neg_mx', 'neg_my', 'neg_mt', 'neg_mr', 'neg_mb', 'neg_ml',
    'gap', 'gap_x', 'gap_y'
  ];

  const layoutExports = [
    'flex', 'inline_flex', 'block', 'inline_block', 'inline', 'grid', 'hidden',
    'flex_row', 'flex_row_reverse', 'flex_col', 'flex_col_reverse',
    'flex_wrap', 'flex_wrap_reverse', 'flex_nowrap',
    'grow', 'grow_0', 'shrink', 'shrink_0',
    'items_start', 'items_end', 'items_center', 'items_baseline', 'items_stretch',
    'justify_start', 'justify_end', 'justify_center', 'justify_between', 'justify_around', 'justify_evenly',
    'relative', 'absolute', 'fixed', 'sticky', 'static',
    'visible', 'invisible',
    'overflow_auto', 'overflow_hidden', 'overflow_visible', 'overflow_scroll',
    'overflow_x_auto', 'overflow_y_auto', 'overflow_x_hidden', 'overflow_y_hidden'
  ];

  const widthFractions = [
    '1/2', '1/3', '2/3', '1/4', '2/4', '3/4',
    '1/5', '2/5', '3/5', '4/5',
    '1/6', '2/6', '3/6', '4/6', '5/6',
    '1/12', '2/12', '3/12', '4/12', '5/12', '6/12', '7/12', '8/12', '9/12', '10/12', '11/12'
  ];

  const widthFractionExports = widthFractions.map(f => 'w_' + f.replace('/', 'over'));
  const heightFractionExports = widthFractions.map(f => 'h_' + f.replace('/', 'over'));

  const sizingExports = [
    'w', ...widthFractionExports, 'w_full', 'w_screen', 'w_auto', 'w_min', 'w_max', 'w_fit',
    'h', ...heightFractionExports, 'h_full', 'h_screen', 'h_auto', 'h_min', 'h_max', 'h_fit',
    'min_w', 'max_w', 'min_h', 'max_h'
  ];

  const typographyExports = [
    'text_left', 'text_center', 'text_right', 'text_justify',
    'font_sans', 'font_serif', 'font_mono',
    'italic', 'not_italic',
    'uppercase', 'lowercase', 'capitalize', 'normal_case',
    'underline', 'line_through', 'no_underline',
    'whitespace_normal', 'whitespace_nowrap', 'whitespace_pre', 'whitespace_pre_line', 'whitespace_pre_wrap',
    'truncate', 'text_ellipsis', 'text_clip'
  ];

  const fontSizeExports = fontSizes.map(size => `text_${toElmName(size)}`);
  const fontWeightExports = fontWeights.map(weight => `font_${toElmName(weight)}`);

  const borderExports = [
    'border', 'border_0', 'border_2', 'border_4', 'border_8',
    'border_t', 'border_r', 'border_b', 'border_l',
    'rounded', 'rounded_none', 'rounded_full'
  ];

  const radiusExports = radiusSizes.map(size => `rounded_${toElmName(size)}`);

  const effectExports = [
    'shadow', 'shadow_none',
    'transition', 'transition_all', 'transition_none', 'transition_colors', 'transition_opacity', 'transition_shadow', 'transition_transform',
    'animate_none', 'animate_spin', 'animate_ping', 'animate_pulse', 'animate_bounce',
    'cursor_auto', 'cursor_default', 'cursor_pointer', 'cursor_wait', 'cursor_text', 'cursor_move', 'cursor_not_allowed',
    'pointer_events_none', 'pointer_events_auto',
    'select_none', 'select_text', 'select_all', 'select_auto'
  ];

  const shadowExports = shadowSizes.map(size => `shadow_${toElmName(size)}`);

  const colorUtilExports = [
    'text_color', 'bg_color', 'border_color', 'ring_color', 'placeholder_color',
    'text_simple', 'bg_simple', 'border_simple'
  ];

  const opacityExports = [
    'opacity_0', 'opacity_5', 'opacity_10', 'opacity_20', 'opacity_25', 'opacity_30', 'opacity_40',
    'opacity_50', 'opacity_60', 'opacity_70', 'opacity_75', 'opacity_80', 'opacity_90', 'opacity_95', 'opacity_100'
  ];

  const zIndexExports = ['z_0', 'z_10', 'z_20', 'z_30', 'z_40', 'z_50', 'z_auto'];

  const allExports = [
    ...spacingExports,
    ...layoutExports,
    ...sizingExports,
    ...typographyExports,
    ...fontSizeExports,
    ...fontWeightExports,
    ...borderExports,
    ...radiusExports,
    ...effectExports,
    ...shadowExports,
    ...colorUtilExports,
    ...opacityExports,
    ...zIndexExports,
  ];

  // Generate function definitions
  const fontSizeFunctions = fontSizes.map(size => {
    const name = `text_${toElmName(size)}`;
    return `
${name} : Tailwind
${name} =
    Tailwind "text-${size}"`;
  });

  const fontWeightFunctions = fontWeights.map(weight => {
    const name = `font_${toElmName(weight)}`;
    return `
${name} : Tailwind
${name} =
    Tailwind "font-${weight}"`;
  });

  const radiusFunctions = radiusSizes.map(size => `
rounded_${toElmName(size)} : Tailwind
rounded_${toElmName(size)} =
    Tailwind "rounded-${size}"`);

  const shadowFunctions = shadowSizes.map(size => `
shadow_${toElmName(size)} : Tailwind
shadow_${toElmName(size)} =
    Tailwind "shadow-${size}"`);

  const widthFractionDefs = widthFractions.map(f => {
    const elmName = 'w_' + f.replace('/', 'over');
    return `
${elmName} : Tailwind
${elmName} =
    Tailwind "w-${f}"`;
  });

  const heightFractionDefs = widthFractions.map(f => {
    const elmName = 'h_' + f.replace('/', 'over');
    return `
${elmName} : Tailwind
${elmName} =
    Tailwind "h-${f}"`;
  });

  return `module Tailwind.Utilities exposing
    ( ${allExports.join('\n    , ')}
    )

{-| Tailwind CSS utility classes as Elm functions.

All functions return the opaque \`Tailwind\` type. Use \`Tailwind.classes\` to
convert a list of Tailwind values to an Html.Attribute.

-}

import Tailwind exposing (Tailwind(..))
import Tailwind.Theme exposing (Color(..), Shade(..), SimpleColor(..), Spacing(..), colorToString, shadeToString, spacingToString)


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


pt : Spacing -> Tailwind
pt spacing =
    Tailwind ("pt-" ++ spacingToString spacing)


pr : Spacing -> Tailwind
pr spacing =
    Tailwind ("pr-" ++ spacingToString spacing)


pb : Spacing -> Tailwind
pb spacing =
    Tailwind ("pb-" ++ spacingToString spacing)


pl : Spacing -> Tailwind
pl spacing =
    Tailwind ("pl-" ++ spacingToString spacing)


m : Spacing -> Tailwind
m spacing =
    Tailwind ("m-" ++ spacingToString spacing)


mx : Spacing -> Tailwind
mx spacing =
    Tailwind ("mx-" ++ spacingToString spacing)


my : Spacing -> Tailwind
my spacing =
    Tailwind ("my-" ++ spacingToString spacing)


mt : Spacing -> Tailwind
mt spacing =
    Tailwind ("mt-" ++ spacingToString spacing)


mr : Spacing -> Tailwind
mr spacing =
    Tailwind ("mr-" ++ spacingToString spacing)


mb : Spacing -> Tailwind
mb spacing =
    Tailwind ("mb-" ++ spacingToString spacing)


ml : Spacing -> Tailwind
ml spacing =
    Tailwind ("ml-" ++ spacingToString spacing)


neg_m : Spacing -> Tailwind
neg_m spacing =
    Tailwind ("-m-" ++ spacingToString spacing)


neg_mx : Spacing -> Tailwind
neg_mx spacing =
    Tailwind ("-mx-" ++ spacingToString spacing)


neg_my : Spacing -> Tailwind
neg_my spacing =
    Tailwind ("-my-" ++ spacingToString spacing)


neg_mt : Spacing -> Tailwind
neg_mt spacing =
    Tailwind ("-mt-" ++ spacingToString spacing)


neg_mr : Spacing -> Tailwind
neg_mr spacing =
    Tailwind ("-mr-" ++ spacingToString spacing)


neg_mb : Spacing -> Tailwind
neg_mb spacing =
    Tailwind ("-mb-" ++ spacingToString spacing)


neg_ml : Spacing -> Tailwind
neg_ml spacing =
    Tailwind ("-ml-" ++ spacingToString spacing)


gap : Spacing -> Tailwind
gap spacing =
    Tailwind ("gap-" ++ spacingToString spacing)


gap_x : Spacing -> Tailwind
gap_x spacing =
    Tailwind ("gap-x-" ++ spacingToString spacing)


gap_y : Spacing -> Tailwind
gap_y spacing =
    Tailwind ("gap-y-" ++ spacingToString spacing)


-- LAYOUT

flex : Tailwind
flex =
    Tailwind "flex"


inline_flex : Tailwind
inline_flex =
    Tailwind "inline-flex"


block : Tailwind
block =
    Tailwind "block"


inline_block : Tailwind
inline_block =
    Tailwind "inline-block"


inline : Tailwind
inline =
    Tailwind "inline"


grid : Tailwind
grid =
    Tailwind "grid"


hidden : Tailwind
hidden =
    Tailwind "hidden"


flex_row : Tailwind
flex_row =
    Tailwind "flex-row"


flex_row_reverse : Tailwind
flex_row_reverse =
    Tailwind "flex-row-reverse"


flex_col : Tailwind
flex_col =
    Tailwind "flex-col"


flex_col_reverse : Tailwind
flex_col_reverse =
    Tailwind "flex-col-reverse"


flex_wrap : Tailwind
flex_wrap =
    Tailwind "flex-wrap"


flex_wrap_reverse : Tailwind
flex_wrap_reverse =
    Tailwind "flex-wrap-reverse"


flex_nowrap : Tailwind
flex_nowrap =
    Tailwind "flex-nowrap"


grow : Tailwind
grow =
    Tailwind "grow"


grow_0 : Tailwind
grow_0 =
    Tailwind "grow-0"


shrink : Tailwind
shrink =
    Tailwind "shrink"


shrink_0 : Tailwind
shrink_0 =
    Tailwind "shrink-0"


items_start : Tailwind
items_start =
    Tailwind "items-start"


items_end : Tailwind
items_end =
    Tailwind "items-end"


items_center : Tailwind
items_center =
    Tailwind "items-center"


items_baseline : Tailwind
items_baseline =
    Tailwind "items-baseline"


items_stretch : Tailwind
items_stretch =
    Tailwind "items-stretch"


justify_start : Tailwind
justify_start =
    Tailwind "justify-start"


justify_end : Tailwind
justify_end =
    Tailwind "justify-end"


justify_center : Tailwind
justify_center =
    Tailwind "justify-center"


justify_between : Tailwind
justify_between =
    Tailwind "justify-between"


justify_around : Tailwind
justify_around =
    Tailwind "justify-around"


justify_evenly : Tailwind
justify_evenly =
    Tailwind "justify-evenly"


relative : Tailwind
relative =
    Tailwind "relative"


absolute : Tailwind
absolute =
    Tailwind "absolute"


fixed : Tailwind
fixed =
    Tailwind "fixed"


sticky : Tailwind
sticky =
    Tailwind "sticky"


static : Tailwind
static =
    Tailwind "static"


visible : Tailwind
visible =
    Tailwind "visible"


invisible : Tailwind
invisible =
    Tailwind "invisible"


overflow_auto : Tailwind
overflow_auto =
    Tailwind "overflow-auto"


overflow_hidden : Tailwind
overflow_hidden =
    Tailwind "overflow-hidden"


overflow_visible : Tailwind
overflow_visible =
    Tailwind "overflow-visible"


overflow_scroll : Tailwind
overflow_scroll =
    Tailwind "overflow-scroll"


overflow_x_auto : Tailwind
overflow_x_auto =
    Tailwind "overflow-x-auto"


overflow_y_auto : Tailwind
overflow_y_auto =
    Tailwind "overflow-y-auto"


overflow_x_hidden : Tailwind
overflow_x_hidden =
    Tailwind "overflow-x-hidden"


overflow_y_hidden : Tailwind
overflow_y_hidden =
    Tailwind "overflow-y-hidden"


-- SIZING

w : Spacing -> Tailwind
w spacing =
    Tailwind ("w-" ++ spacingToString spacing)

${widthFractionDefs.join('\n')}


w_full : Tailwind
w_full =
    Tailwind "w-full"


w_screen : Tailwind
w_screen =
    Tailwind "w-screen"


w_auto : Tailwind
w_auto =
    Tailwind "w-auto"


w_min : Tailwind
w_min =
    Tailwind "w-min"


w_max : Tailwind
w_max =
    Tailwind "w-max"


w_fit : Tailwind
w_fit =
    Tailwind "w-fit"


h : Spacing -> Tailwind
h spacing =
    Tailwind ("h-" ++ spacingToString spacing)

${heightFractionDefs.join('\n')}


h_full : Tailwind
h_full =
    Tailwind "h-full"


h_screen : Tailwind
h_screen =
    Tailwind "h-screen"


h_auto : Tailwind
h_auto =
    Tailwind "h-auto"


h_min : Tailwind
h_min =
    Tailwind "h-min"


h_max : Tailwind
h_max =
    Tailwind "h-max"


h_fit : Tailwind
h_fit =
    Tailwind "h-fit"


min_w : Spacing -> Tailwind
min_w spacing =
    Tailwind ("min-w-" ++ spacingToString spacing)


max_w : Spacing -> Tailwind
max_w spacing =
    Tailwind ("max-w-" ++ spacingToString spacing)


min_h : Spacing -> Tailwind
min_h spacing =
    Tailwind ("min-h-" ++ spacingToString spacing)


max_h : Spacing -> Tailwind
max_h spacing =
    Tailwind ("max-h-" ++ spacingToString spacing)


-- TYPOGRAPHY

text_left : Tailwind
text_left =
    Tailwind "text-left"


text_center : Tailwind
text_center =
    Tailwind "text-center"


text_right : Tailwind
text_right =
    Tailwind "text-right"


text_justify : Tailwind
text_justify =
    Tailwind "text-justify"


font_sans : Tailwind
font_sans =
    Tailwind "font-sans"


font_serif : Tailwind
font_serif =
    Tailwind "font-serif"


font_mono : Tailwind
font_mono =
    Tailwind "font-mono"


italic : Tailwind
italic =
    Tailwind "italic"


not_italic : Tailwind
not_italic =
    Tailwind "not-italic"


uppercase : Tailwind
uppercase =
    Tailwind "uppercase"


lowercase : Tailwind
lowercase =
    Tailwind "lowercase"


capitalize : Tailwind
capitalize =
    Tailwind "capitalize"


normal_case : Tailwind
normal_case =
    Tailwind "normal-case"


underline : Tailwind
underline =
    Tailwind "underline"


line_through : Tailwind
line_through =
    Tailwind "line-through"


no_underline : Tailwind
no_underline =
    Tailwind "no-underline"


whitespace_normal : Tailwind
whitespace_normal =
    Tailwind "whitespace-normal"


whitespace_nowrap : Tailwind
whitespace_nowrap =
    Tailwind "whitespace-nowrap"


whitespace_pre : Tailwind
whitespace_pre =
    Tailwind "whitespace-pre"


whitespace_pre_line : Tailwind
whitespace_pre_line =
    Tailwind "whitespace-pre-line"


whitespace_pre_wrap : Tailwind
whitespace_pre_wrap =
    Tailwind "whitespace-pre-wrap"


truncate : Tailwind
truncate =
    Tailwind "truncate"


text_ellipsis : Tailwind
text_ellipsis =
    Tailwind "text-ellipsis"


text_clip : Tailwind
text_clip =
    Tailwind "text-clip"


-- FONT SIZE
${fontSizeFunctions.join('\n')}


-- FONT WEIGHT
${fontWeightFunctions.join('\n')}


-- BORDER

border : Tailwind
border =
    Tailwind "border"


border_0 : Tailwind
border_0 =
    Tailwind "border-0"


border_2 : Tailwind
border_2 =
    Tailwind "border-2"


border_4 : Tailwind
border_4 =
    Tailwind "border-4"


border_8 : Tailwind
border_8 =
    Tailwind "border-8"


border_t : Tailwind
border_t =
    Tailwind "border-t"


border_r : Tailwind
border_r =
    Tailwind "border-r"


border_b : Tailwind
border_b =
    Tailwind "border-b"


border_l : Tailwind
border_l =
    Tailwind "border-l"


rounded : Tailwind
rounded =
    Tailwind "rounded"


rounded_none : Tailwind
rounded_none =
    Tailwind "rounded-none"


rounded_full : Tailwind
rounded_full =
    Tailwind "rounded-full"

${radiusFunctions.join('\n')}


-- EFFECTS

shadow : Tailwind
shadow =
    Tailwind "shadow"


shadow_none : Tailwind
shadow_none =
    Tailwind "shadow-none"

${shadowFunctions.join('\n')}


transition : Tailwind
transition =
    Tailwind "transition"


transition_all : Tailwind
transition_all =
    Tailwind "transition-all"


transition_none : Tailwind
transition_none =
    Tailwind "transition-none"


transition_colors : Tailwind
transition_colors =
    Tailwind "transition-colors"


transition_opacity : Tailwind
transition_opacity =
    Tailwind "transition-opacity"


transition_shadow : Tailwind
transition_shadow =
    Tailwind "transition-shadow"


transition_transform : Tailwind
transition_transform =
    Tailwind "transition-transform"


animate_none : Tailwind
animate_none =
    Tailwind "animate-none"


animate_spin : Tailwind
animate_spin =
    Tailwind "animate-spin"


animate_ping : Tailwind
animate_ping =
    Tailwind "animate-ping"


animate_pulse : Tailwind
animate_pulse =
    Tailwind "animate-pulse"


animate_bounce : Tailwind
animate_bounce =
    Tailwind "animate-bounce"


cursor_auto : Tailwind
cursor_auto =
    Tailwind "cursor-auto"


cursor_default : Tailwind
cursor_default =
    Tailwind "cursor-default"


cursor_pointer : Tailwind
cursor_pointer =
    Tailwind "cursor-pointer"


cursor_wait : Tailwind
cursor_wait =
    Tailwind "cursor-wait"


cursor_text : Tailwind
cursor_text =
    Tailwind "cursor-text"


cursor_move : Tailwind
cursor_move =
    Tailwind "cursor-move"


cursor_not_allowed : Tailwind
cursor_not_allowed =
    Tailwind "cursor-not-allowed"


pointer_events_none : Tailwind
pointer_events_none =
    Tailwind "pointer-events-none"


pointer_events_auto : Tailwind
pointer_events_auto =
    Tailwind "pointer-events-auto"


select_none : Tailwind
select_none =
    Tailwind "select-none"


select_text : Tailwind
select_text =
    Tailwind "select-text"


select_all : Tailwind
select_all =
    Tailwind "select-all"


select_auto : Tailwind
select_auto =
    Tailwind "select-auto"


-- COLOR UTILITIES

text_color : Color -> Shade -> Tailwind
text_color color shade =
    Tailwind ("text-" ++ colorToString color ++ "-" ++ shadeToString shade)


bg_color : Color -> Shade -> Tailwind
bg_color color shade =
    Tailwind ("bg-" ++ colorToString color ++ "-" ++ shadeToString shade)


border_color : Color -> Shade -> Tailwind
border_color color shade =
    Tailwind ("border-" ++ colorToString color ++ "-" ++ shadeToString shade)


ring_color : Color -> Shade -> Tailwind
ring_color color shade =
    Tailwind ("ring-" ++ colorToString color ++ "-" ++ shadeToString shade)


placeholder_color : Color -> Shade -> Tailwind
placeholder_color color shade =
    Tailwind ("placeholder-" ++ colorToString color ++ "-" ++ shadeToString shade)


text_simple : SimpleColor -> Tailwind
text_simple (SimpleColor c) =
    Tailwind ("text-" ++ c)


bg_simple : SimpleColor -> Tailwind
bg_simple (SimpleColor c) =
    Tailwind ("bg-" ++ c)


border_simple : SimpleColor -> Tailwind
border_simple (SimpleColor c) =
    Tailwind ("border-" ++ c)


-- OPACITY

opacity_0 : Tailwind
opacity_0 =
    Tailwind "opacity-0"


opacity_5 : Tailwind
opacity_5 =
    Tailwind "opacity-5"


opacity_10 : Tailwind
opacity_10 =
    Tailwind "opacity-10"


opacity_20 : Tailwind
opacity_20 =
    Tailwind "opacity-20"


opacity_25 : Tailwind
opacity_25 =
    Tailwind "opacity-25"


opacity_30 : Tailwind
opacity_30 =
    Tailwind "opacity-30"


opacity_40 : Tailwind
opacity_40 =
    Tailwind "opacity-40"


opacity_50 : Tailwind
opacity_50 =
    Tailwind "opacity-50"


opacity_60 : Tailwind
opacity_60 =
    Tailwind "opacity-60"


opacity_70 : Tailwind
opacity_70 =
    Tailwind "opacity-70"


opacity_75 : Tailwind
opacity_75 =
    Tailwind "opacity-75"


opacity_80 : Tailwind
opacity_80 =
    Tailwind "opacity-80"


opacity_90 : Tailwind
opacity_90 =
    Tailwind "opacity-90"


opacity_95 : Tailwind
opacity_95 =
    Tailwind "opacity-95"


opacity_100 : Tailwind
opacity_100 =
    Tailwind "opacity-100"


-- Z-INDEX

z_0 : Tailwind
z_0 =
    Tailwind "z-0"


z_10 : Tailwind
z_10 =
    Tailwind "z-10"


z_20 : Tailwind
z_20 =
    Tailwind "z-20"


z_30 : Tailwind
z_30 =
    Tailwind "z-30"


z_40 : Tailwind
z_40 =
    Tailwind "z-40"


z_50 : Tailwind
z_50 =
    Tailwind "z-50"


z_auto : Tailwind
z_auto =
    Tailwind "z-auto"
`;
}

function generateBreakpoints(theme) {
  const breakpoints = Object.keys(theme.breakpoints || { sm: '640px', md: '768px', lg: '1024px', xl: '1280px', '2xl': '1536px' });

  const breakpointFunctions = breakpoints.map(bp => {
    const name = toElmName(bp);
    return `
${name} : List Tailwind -> Tailwind
${name} twClasses =
    Tailwind (String.join " " (List.map (\\(Tailwind c) -> "${bp}:" ++ c) twClasses))`;
  });

  const breakpointExports = breakpoints.map(bp => toElmName(bp));

  const stateVariants = [
    ['hover', 'hover'],
    ['focus', 'focus'],
    ['active', 'active'],
    ['disabled', 'disabled'],
    ['visited', 'visited'],
    ['focus_within', 'focus-within'],
    ['focus_visible', 'focus-visible'],
    ['first', 'first'],
    ['last', 'last'],
    ['odd', 'odd'],
    ['even', 'even'],
    ['dark', 'dark'],
    ['group_hover', 'group-hover'],
  ];

  const stateFunctions = stateVariants.map(([name, prefix]) => `
${name} : List Tailwind -> Tailwind
${name} twClasses =
    Tailwind (String.join " " (List.map (\\(Tailwind c) -> "${prefix}:" ++ c) twClasses))`);

  const stateExports = stateVariants.map(([name]) => name);

  return `module Tailwind.Breakpoints exposing
    ( ${breakpointExports.join('\n    , ')}
    , ${stateExports.join('\n    , ')}
    , withVariant
    )

{-| Responsive breakpoints and state variants for Tailwind CSS.

-}

import Tailwind exposing (Tailwind(..))

${breakpointFunctions.join('\n')}

${stateFunctions.join('\n')}


withVariant : String -> List Tailwind -> Tailwind
withVariant variant twClasses =
    Tailwind (String.join " " (List.map (\\(Tailwind c) -> variant ++ ":" ++ c) twClasses))
`;
}
