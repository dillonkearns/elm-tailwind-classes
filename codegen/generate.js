// Main code generator for elm-tailwind-classes
// Follows elm-tailwind-modules naming conventions but outputs Html.Attribute instead of Css.Style
import { resolveTheme } from 'tailwind-resolver';
import fs from 'fs';
import path from 'path';

const OUTPUT_DIR = '../src';

async function main() {
  console.log('Resolving Tailwind theme...');
  const result = await resolveTheme({
    input: './sample.css'
  });

  const theme = result.variants?.default;
  if (!theme) {
    console.error('Failed to resolve theme');
    process.exit(1);
  }

  console.log('Generating Elm modules...');

  // Ensure output directories exist
  ensureDir(path.join(OUTPUT_DIR, 'Tailwind'));

  // Generate modules (following elm-tailwind-modules structure)
  generateUtilities(theme);
  generateTheme(theme);
  generateBreakpoints(theme);

  console.log('Done!');
}

function ensureDir(dir) {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
}

function writeElmFile(modulePath, content) {
  const fullPath = path.join(OUTPUT_DIR, modulePath);
  fs.writeFileSync(fullPath, content);
  console.log(`  Generated ${modulePath}`);
}

// Convert Tailwind class name to Elm identifier
// Following elm-tailwind-modules: hyphens become underscores
function toElmName(className) {
  // Handle numeric prefixes (2xl -> n2xl)
  let name = className;
  if (/^\d/.test(name)) {
    name = 'n' + name;
  }
  // Replace hyphens with underscores, dots with _dot_
  name = name.replace(/-/g, '_').replace(/\./g, '_dot_');
  // Handle fractions like 1/2 -> 1over2
  name = name.replace(/\//g, 'over');
  return name;
}

// Generate Tailwind/Theme.elm - colors, spacing, and opacity values
function generateTheme(theme) {
  const colors = theme.colors;
  const colorNames = Object.keys(colors);

  // Build color definitions
  const colorDefs = [];
  const colorExports = [];

  for (const colorName of colorNames) {
    const colorValue = colors[colorName];
    if (typeof colorValue === 'string') {
      // Simple colors like black, white
      const elmName = toElmName(colorName);
      colorExports.push(elmName);
      colorDefs.push(`
{-| Color: ${colorName}
-}
${elmName} : Color
${elmName} =
    Color "${colorName}"`);
    } else {
      // Colors with shades (50-950)
      const shades = Object.keys(colorValue);
      for (const shade of shades) {
        const elmName = toElmName(colorName) + '_' + shade;
        colorExports.push(elmName);
        colorDefs.push(`
{-| Color: ${colorName}-${shade}
-}
${elmName} : Color
${elmName} =
    Color "${colorName}-${shade}"`);
      }
    }
  }

  // Tailwind's default spacing scale
  const spacingScale = [
    '0', 'px', '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '14', '16', '20', '24', '28', '32', '36', '40', '44', '48', '52', '56', '60',
    '64', '72', '80', '96'
  ];

  // Build Spacing type constructors
  const spacingConstructors = spacingScale.map(v => {
    const elmName = 'S' + toElmName(v).replace(/^n/, ''); // S0, Spx, S0_dot_5, S1, etc.
    return elmName;
  });

  // Build spacing value definitions (lowercase for use as values)
  const spacingValueDefs = [];
  const spacingValueExports = [];
  for (const v of spacingScale) {
    const constructorName = 'S' + toElmName(v).replace(/^n/, '');
    const valueName = 's' + toElmName(v).replace(/^n/, ''); // s0, spx, s0_dot_5, s1, etc.
    spacingValueExports.push(valueName);
    spacingValueDefs.push(`
{-| Spacing: ${v}
-}
${valueName} : Spacing
${valueName} =
    ${constructorName}`);
  }

  // Build spacingToString case expression
  const spacingCases = spacingScale.map(v => {
    const constructorName = 'S' + toElmName(v).replace(/^n/, '');
    return `        ${constructorName} ->\n            "${v}"`;
  });

  // Opacity values (0, 5, 10, 20, 25, 30, 40, 50, 60, 70, 75, 80, 90, 95, 100)
  const opacityValues = [0, 5, 10, 20, 25, 30, 40, 50, 60, 70, 75, 80, 90, 95, 100];
  const opacityDefs = opacityValues.map(v => `
{-| Opacity ${v}%
-}
opacity${v} : Opacity
opacity${v} =
    Opacity ${v}`);
  const opacityExports = opacityValues.map(v => `opacity${v}`);

  const content = `module Tailwind.Theme exposing
    ( Color(..)
    , Spacing(..)
    , spacingToString
    , Opacity(..)
    , ${colorExports.join('\n    , ')}
    , ${spacingValueExports.join('\n    , ')}
    , ${opacityExports.join('\n    , ')}
    )

{-| Theme values for Tailwind CSS.

This module provides type-safe color, spacing, and opacity values.


## Types

@docs Color, Spacing, spacingToString, Opacity


## Colors

@docs ${colorExports.slice(0, 20).join(', ')}


## Spacing

@docs ${spacingValueExports.slice(0, 20).join(', ')}


## Opacities

@docs ${opacityExports.join(', ')}

-}


{-| A Tailwind color value.
-}
type Color
    = Color String


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

${colorDefs.join('\n')}

-- SPACING VALUES
${spacingValueDefs.join('\n')}
${opacityDefs.join('\n')}
`;

  writeElmFile('Tailwind/Theme.elm', content);
}

// Generate Tailwind/Utilities.elm - all utility functions
function generateUtilities(theme) {
  const fontSizes = Object.keys(theme.fontSize);
  const fontWeights = Object.keys(theme.fontWeight);
  const radiusSizes = Object.keys(theme.radius).filter(k => k !== 'default');
  const shadowSizes = Object.keys(theme.shadows).filter(k => k !== 'default');
  const blurSizes = Object.keys(theme.blur).filter(k => k !== 'default');

  // Tailwind's default spacing scale
  const spacingScale = [
    '0', 'px', '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '14', '16', '20', '24', '28', '32', '36', '40', '44', '48', '52', '56', '60',
    '64', '72', '80', '96'
  ];

  // Parameterized spacing functions using Spacing type from Theme
  const spacingFunctions = `
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
`;

  const spacingExports = [
    'p', 'px', 'py', 'pt', 'pr', 'pb', 'pl',
    'm', 'mx', 'my', 'mt', 'mr', 'mb', 'ml',
    'neg_m', 'neg_mx', 'neg_my', 'neg_mt', 'neg_mr', 'neg_mb', 'neg_ml',
    'gap', 'gap_x', 'gap_y'
  ];

  // Font size utilities
  const fontSizeFunctions = fontSizes.map(size => {
    const name = `text_${toElmName(size)}`;
    return `
{-| font-size: ${theme.fontSize[size].size}
-}
${name} : Attribute msg
${name} =
    class "text-${size}"`;
  });
  const fontSizeExports = fontSizes.map(size => `text_${toElmName(size)}`);

  // Font weight utilities
  const fontWeightFunctions = fontWeights.map(weight => {
    const name = `font_${toElmName(weight)}`;
    return `
{-| font-weight: ${theme.fontWeight[weight]}
-}
${name} : Attribute msg
${name} =
    class "font-${weight}"`;
  });
  const fontWeightExports = fontWeights.map(weight => `font_${toElmName(weight)}`);

  // Border radius utilities
  const radiusFunctions = radiusSizes.map(size => {
    const name = `rounded_${toElmName(size)}`;
    return `
rounded_${toElmName(size)} : Attribute msg
rounded_${toElmName(size)} =
    class "rounded-${size}"`;
  });
  const radiusExports = radiusSizes.map(size => `rounded_${toElmName(size)}`);

  // Shadow utilities
  const shadowFunctions = shadowSizes.map(size => {
    const name = `shadow_${toElmName(size)}`;
    return `
shadow_${toElmName(size)} : Attribute msg
shadow_${toElmName(size)} =
    class "shadow-${size}"`;
  });
  const shadowExports = shadowSizes.map(size => `shadow_${toElmName(size)}`);

  // Layout utilities
  const layoutDefs = `
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
`;

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

  // Width fractions (hardcoded Tailwind set)
  const widthFractions = [
    '1/2', '1/3', '2/3', '1/4', '2/4', '3/4',
    '1/5', '2/5', '3/5', '4/5',
    '1/6', '2/6', '3/6', '4/6', '5/6',
    '1/12', '2/12', '3/12', '4/12', '5/12', '6/12', '7/12', '8/12', '9/12', '10/12', '11/12'
  ];

  // Generate fraction constants for w and h
  const widthFractionDefs = widthFractions.map(f => {
    const elmName = 'w_' + f.replace('/', 'over');
    return `
{-| Width ${f}
-}
${elmName} : Attribute msg
${elmName} =
    class "w-${f}"`;
  });

  const heightFractionDefs = widthFractions.map(f => {
    const elmName = 'h_' + f.replace('/', 'over');
    return `
{-| Height ${f}
-}
${elmName} : Attribute msg
${elmName} =
    class "h-${f}"`;
  });

  const widthFractionExports = widthFractions.map(f => 'w_' + f.replace('/', 'over'));
  const heightFractionExports = widthFractions.map(f => 'h_' + f.replace('/', 'over'));

  // Sizing functions using Spacing type
  const sizingFunctions = `
-- WIDTH (using Spacing)

{-| Width from spacing scale.

    w s64  -- produces "w-64" (16rem)

-}
w : Spacing -> Attribute msg
w spacing =
    class ("w-" ++ spacingToString spacing)


-- WIDTH FRACTIONS
${widthFractionDefs.join('\n')}


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
${heightFractionDefs.join('\n')}


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
`;

  const sizingExports = [
    'w', ...widthFractionExports, 'w_full', 'w_screen', 'w_auto', 'w_min', 'w_max', 'w_fit',
    'h', ...heightFractionExports, 'h_full', 'h_screen', 'h_auto', 'h_min', 'h_max', 'h_fit',
    'min_w', 'max_w', 'min_h', 'max_h'
  ];

  // Typography utilities
  const typographyDefs = `
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
`;

  const typographyExports = [
    'text_left', 'text_center', 'text_right', 'text_justify',
    'font_sans', 'font_serif', 'font_mono',
    'italic', 'not_italic',
    'uppercase', 'lowercase', 'capitalize', 'normal_case',
    'underline', 'line_through', 'no_underline',
    'whitespace_normal', 'whitespace_nowrap', 'whitespace_pre', 'whitespace_pre_line', 'whitespace_pre_wrap',
    'truncate', 'text_ellipsis', 'text_clip'
  ];

  // Border utilities
  const borderDefs = `
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
`;

  const borderExports = [
    'border', 'border_0', 'border_2', 'border_4', 'border_8',
    'border_t', 'border_r', 'border_b', 'border_l',
    'rounded', 'rounded_none', 'rounded_full'
  ];

  // Effect utilities
  const effectDefs = `
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
`;

  const effectExports = [
    'shadow', 'shadow_none',
    'transition', 'transition_all', 'transition_none', 'transition_colors', 'transition_opacity', 'transition_shadow', 'transition_transform',
    'animate_none', 'animate_spin', 'animate_ping', 'animate_pulse', 'animate_bounce',
    'cursor_auto', 'cursor_default', 'cursor_pointer', 'cursor_wait', 'cursor_text', 'cursor_move', 'cursor_not_allowed',
    'pointer_events_none', 'pointer_events_auto',
    'select_none', 'select_text', 'select_all', 'select_auto'
  ];

  // Color utility functions (parameterized)
  const colorUtilDefs = `
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
`;

  const colorUtilExports = ['text_color', 'bg_color', 'border_color', 'ring_color', 'placeholder_color'];

  // Opacity utilities
  const opacityDefs = `
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
`;

  const opacityExports = [
    'opacity_0', 'opacity_5', 'opacity_10', 'opacity_20', 'opacity_25', 'opacity_30', 'opacity_40',
    'opacity_50', 'opacity_60', 'opacity_70', 'opacity_75', 'opacity_80', 'opacity_90', 'opacity_95', 'opacity_100'
  ];

  // Z-index utilities
  const zIndexDefs = [];
  const zIndexExports = [];
  for (const z of [0, 10, 20, 30, 40, 50]) {
    zIndexExports.push(`z_${z}`);
    zIndexDefs.push(`
z_${z} : Attribute msg
z_${z} =
    class "z-${z}"`);
  }
  zIndexExports.push('z_auto');
  zIndexDefs.push(`
z_auto : Attribute msg
z_auto =
    class "z-auto"`);

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

  const content = `module Tailwind.Utilities exposing
    ( ${allExports.join('\n    , ')}
    )

{-| Tailwind CSS utility classes as Elm functions.

Following elm-tailwind-modules naming conventions:
- Hyphens become underscores: \`flex-col\` → \`flex_col\`
- Numeric prefixes get 'n': \`2xl\` → \`n2xl\`
- Fractions use 'over': \`w-1/2\` → \`w_1over2\`
- Decimals use '_dot_': \`p-0.5\` → \`p_0_dot_5\`


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
${spacingFunctions}

${layoutDefs}

-- SIZING
${sizingFunctions}

${typographyDefs}

-- FONT SIZE
${fontSizeFunctions.join('\n')}

-- FONT WEIGHT
${fontWeightFunctions.join('\n')}

${borderDefs}

-- BORDER RADIUS
${radiusFunctions.join('\n')}

${effectDefs}

-- SHADOW SIZES
${shadowFunctions.join('\n')}

${colorUtilDefs}

${opacityDefs}

-- Z-INDEX
${zIndexDefs.join('\n')}
`;

  writeElmFile('Tailwind/Utilities.elm', content);
}

// Generate Tailwind/Breakpoints.elm - responsive utilities
function generateBreakpoints(theme) {
  const breakpoints = Object.keys(theme.breakpoints);

  const breakpointFunctions = breakpoints.map(bp => {
    const name = toElmName(bp);
    return `
{-| Apply classes at the ${bp} breakpoint (${theme.breakpoints[bp]}) and above.

    ${name} [ flex, p_8 ]

produces classes like "sm:flex sm:p-8"

-}
${name} : List String -> Attribute msg
${name} classes =
    class (String.join " " (List.map (\\c -> "${bp}:" ++ c) classes))
`;
  });

  const breakpointExports = breakpoints.map(bp => toElmName(bp));

  // State variants
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
{-| Apply classes with ${prefix}: prefix.
-}
${name} : List String -> Attribute msg
${name} classes =
    class (String.join " " (List.map (\\c -> "${prefix}:" ++ c) classes))
`);

  const stateExports = stateVariants.map(([name]) => name);

  const content = `module Tailwind.Breakpoints exposing
    ( ${breakpointExports.join('\n    , ')}
    , ${stateExports.join('\n    , ')}
    , withVariant
    , classesToString
    )

{-| Responsive breakpoints and state variants for Tailwind CSS.


## Responsive Breakpoints

@docs ${breakpointExports.join(', ')}


## State Variants

@docs ${stateExports.join(', ')}


## Utilities

@docs withVariant, classesToString

-}

import Html exposing (Attribute)
import Html.Attributes exposing (class)

${breakpointFunctions.join('\n')}

${stateFunctions.join('\n')}

{-| Apply a custom variant prefix to a list of class names.

    withVariant "aria-selected" [ "bg-blue-500", "text-white" ]

produces "aria-selected:bg-blue-500 aria-selected:text-white"

-}
withVariant : String -> List String -> Attribute msg
withVariant variant classes =
    class (String.join " " (List.map (\\c -> variant ++ ":" ++ c) classes))


{-| Convert a list of class names to a single space-separated string.
Useful when you need to extract class names.
-}
classesToString : List String -> String
classesToString =
    String.join " "
`;

  writeElmFile('Tailwind/Breakpoints.elm', content);
}

main().catch(console.error);
