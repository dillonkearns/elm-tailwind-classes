// Main code generator for elm-tailwind-classes
// Generates an opaque Tailwind type with type-safe utilities
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

  // Generate modules
  generateTailwindCore();      // Main Tailwind module with opaque type
  generateTheme(theme);        // Colors, spacing, opacity types
  generateUtilities(theme);    // All utility functions
  generateBreakpoints(theme);  // Responsive & state variants

  console.log('Done!');
}

// Generate Tailwind.elm - the main module with the opaque type
function generateTailwindCore() {
  const content = `module Tailwind exposing
    ( Tailwind(..)
    , classes
    , batch
    , raw
    , toClass
    )

{-| Type-safe Tailwind CSS for Elm.

This module provides the \`Tailwind\` type that represents Tailwind CSS classes.
Use the utilities in \`Tailwind.Utilities\` and variants in \`Tailwind.Breakpoints\`
to build up your styles, then convert to an \`Html.Attribute\` with \`classes\`.


## The Tailwind Type

@docs Tailwind


## Converting to Attributes

@docs classes


## Combining Classes

@docs batch


## Escape Hatch

@docs raw, toClass

-}

import Html exposing (Attribute)
import Html.Attributes


{-| A type representing a Tailwind CSS class or set of classes.

While the constructor is exposed for internal use by Tailwind.Utilities
and Tailwind.Breakpoints, you should use those modules to create values
rather than constructing them directly.

-}
type Tailwind
    = Tailwind String


{-| Convert a list of Tailwind values to an Html.Attribute.

This is the main entry point for using Tailwind classes in your view:

    import Tailwind exposing (classes)
    import Tailwind.Utilities as Tw
    import Tailwind.Theme exposing (s4, s8, blue, s500)
    import Tailwind.Breakpoints exposing (hover, md)

    view =
        div
            [ classes
                [ Tw.flex
                , Tw.items_center
                , Tw.p s4
                , Tw.bg_color blue_500
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
            , Tw.bg_color blue_500
            , hover [ Tw.bg_color blue_600 ]
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
`;

  writeElmFile('Tailwind.elm', content);
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

  // Separate shaded colors from simple colors
  const shadedColors = [];    // Colors with shade scale (blue, red, etc.)
  const simpleColors = [];    // Colors without shades (white, black, etc.)

  for (const colorName of colorNames) {
    const colorValue = colors[colorName];
    if (typeof colorValue === 'string') {
      simpleColors.push(colorName);
    } else {
      shadedColors.push(colorName);
    }
  }

  // Standard Tailwind shade scale
  const shadeScale = ['50', '100', '200', '300', '400', '500', '600', '700', '800', '900', '950'];

  // Build Color type (shaded colors only)
  const colorConstructors = shadedColors.map(c => toElmName(c).charAt(0).toUpperCase() + toElmName(c).slice(1));

  // Build color value definitions (lowercase)
  const colorValueDefs = shadedColors.map(c => {
    const constructorName = toElmName(c).charAt(0).toUpperCase() + toElmName(c).slice(1);
    const valueName = toElmName(c);
    return `
{-| ${c}
-}
${valueName} : Color
${valueName} =
    ${constructorName}`;
  });
  const colorValueExports = shadedColors.map(c => toElmName(c));

  // Build colorToString case expression
  const colorCases = shadedColors.map(c => {
    const constructorName = toElmName(c).charAt(0).toUpperCase() + toElmName(c).slice(1);
    return `        ${constructorName} ->\n            "${c}"`;
  });

  // Build Shade type
  const shadeConstructors = shadeScale.map(s => `S${s}`);

  // Build shade value definitions (lowercase)
  const shadeValueDefs = shadeScale.map(s => `
{-| Shade ${s}
-}
s${s} : Shade
s${s} =
    S${s}`);
  const shadeValueExports = shadeScale.map(s => `s${s}`);

  // Build shadeToString case expression
  const shadeCases = shadeScale.map(s => `        S${s} ->\n            "${s}"`);

  // Build simple color definitions (white, black, etc.)
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
    , Shade(..)
    , SimpleColor(..)
    , colorToString
    , shadeToString
    , Spacing(..)
    , spacingToString
    , Opacity(..)
    , ${colorValueExports.join('\n    , ')}
    , ${shadeValueExports.join('\n    , ')}
    , ${simpleColorExports.join('\n    , ')}
    , ${spacingValueExports.join('\n    , ')}
    , ${opacityExports.join('\n    , ')}
    )

{-| Theme values for Tailwind CSS.

This module provides type-safe color, shade, spacing, and opacity values.


## Color Types

@docs Color, Shade, SimpleColor, colorToString, shadeToString


## Shaded Colors

Use with shade parameter: \`bg_color blue s500\`

@docs ${colorValueExports.join(', ')}


## Shades

@docs ${shadeValueExports.join(', ')}


## Simple Colors

Use directly: \`bg_simple white\`

@docs ${simpleColorExports.join(', ')}


## Spacing

@docs Spacing, spacingToString, ${spacingValueExports.join(', ')}


## Opacities

@docs Opacity, ${opacityExports.join(', ')}

-}


{-| A shaded color name (blue, red, slate, etc.).

Use with a Shade to specify the full color:

    bg_color blue s500

-}
type Color
    = ${colorConstructors.join('\n    | ')}


{-| Convert a Color to its CSS class string.
-}
colorToString : Color -> String
colorToString color =
    case color of
${colorCases.join('\n\n')}


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

  writeElmFile('Tailwind/Theme.elm', content);
}

// Generate Tailwind/Utilities.elm - all utility functions returning Tailwind type
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
${name} : Tailwind
${name} =
    Tailwind "text-${size}"`;
  });
  const fontSizeExports = fontSizes.map(size => `text_${toElmName(size)}`);

  // Font weight utilities
  const fontWeightFunctions = fontWeights.map(weight => {
    const name = `font_${toElmName(weight)}`;
    return `
{-| font-weight: ${theme.fontWeight[weight]}
-}
${name} : Tailwind
${name} =
    Tailwind "font-${weight}"`;
  });
  const fontWeightExports = fontWeights.map(weight => `font_${toElmName(weight)}`);

  // Border radius utilities
  const radiusFunctions = radiusSizes.map(size => {
    const name = `rounded_${toElmName(size)}`;
    return `
{-| Border radius: ${size}
-}
rounded_${toElmName(size)} : Tailwind
rounded_${toElmName(size)} =
    Tailwind "rounded-${size}"`;
  });
  const radiusExports = radiusSizes.map(size => `rounded_${toElmName(size)}`);

  // Shadow utilities
  const shadowFunctions = shadowSizes.map(size => {
    const name = `shadow_${toElmName(size)}`;
    return `
{-| Shadow: ${size}
-}
shadow_${toElmName(size)} : Tailwind
shadow_${toElmName(size)} =
    Tailwind "shadow-${size}"`;
  });
  const shadowExports = shadowSizes.map(size => `shadow_${toElmName(size)}`);

  // Layout utilities
  const layoutDefs = `
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
${elmName} : Tailwind
${elmName} =
    Tailwind "w-${f}"`;
  });

  const heightFractionDefs = widthFractions.map(f => {
    const elmName = 'h_' + f.replace('/', 'over');
    return `
{-| Height ${f}
-}
${elmName} : Tailwind
${elmName} =
    Tailwind "h-${f}"`;
  });

  const widthFractionExports = widthFractions.map(f => 'w_' + f.replace('/', 'over'));
  const heightFractionExports = widthFractions.map(f => 'h_' + f.replace('/', 'over'));

  // Sizing functions using Spacing type
  const sizingFunctions = `
-- WIDTH (using Spacing)

{-| Width from spacing scale.

    w s64  -- produces "w-64" (16rem)

-}
w : Spacing -> Tailwind
w spacing =
    Tailwind ("w-" ++ spacingToString spacing)


-- WIDTH FRACTIONS
${widthFractionDefs.join('\n')}


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
${heightFractionDefs.join('\n')}


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
`;

  const sizingExports = [
    'w', ...widthFractionExports, 'w_full', 'w_screen', 'w_auto', 'w_min', 'w_max', 'w_fit',
    'h', ...heightFractionExports, 'h_full', 'h_screen', 'h_auto', 'h_min', 'h_max', 'h_fit',
    'min_w', 'max_w', 'min_h', 'max_h'
  ];

  // Typography utilities
  const typographyDefs = `
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
`;

  const borderExports = [
    'border', 'border_0', 'border_2', 'border_4', 'border_8',
    'border_t', 'border_r', 'border_b', 'border_l',
    'rounded', 'rounded_none', 'rounded_full'
  ];

  // Effect utilities
  const effectDefs = `
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
`;

  const effectExports = [
    'shadow', 'shadow_none',
    'transition', 'transition_all', 'transition_none', 'transition_colors', 'transition_opacity', 'transition_shadow', 'transition_transform',
    'animate_none', 'animate_spin', 'animate_ping', 'animate_pulse', 'animate_bounce',
    'cursor_auto', 'cursor_default', 'cursor_pointer', 'cursor_wait', 'cursor_text', 'cursor_move', 'cursor_not_allowed',
    'pointer_events_none', 'pointer_events_auto',
    'select_none', 'select_text', 'select_all', 'select_auto'
  ];

  // Color utility functions (parameterized with Color + Shade)
  const colorUtilDefs = `
-- COLOR UTILITIES (parameterized)

{-| Set text color with shade.

    text_color blue s500

-}
text_color : Color -> Shade -> Tailwind
text_color color shade =
    Tailwind ("text-" ++ colorToString color ++ "-" ++ shadeToString shade)


{-| Set background color with shade.

    bg_color blue s100

-}
bg_color : Color -> Shade -> Tailwind
bg_color color shade =
    Tailwind ("bg-" ++ colorToString color ++ "-" ++ shadeToString shade)


{-| Set border color with shade.

    border_color gray s300

-}
border_color : Color -> Shade -> Tailwind
border_color color shade =
    Tailwind ("border-" ++ colorToString color ++ "-" ++ shadeToString shade)


{-| Set ring color with shade.

    ring_color indigo s500

-}
ring_color : Color -> Shade -> Tailwind
ring_color color shade =
    Tailwind ("ring-" ++ colorToString color ++ "-" ++ shadeToString shade)


{-| Set placeholder color with shade.

    placeholder_color gray s400

-}
placeholder_color : Color -> Shade -> Tailwind
placeholder_color color shade =
    Tailwind ("placeholder-" ++ colorToString color ++ "-" ++ shadeToString shade)


-- SIMPLE COLOR UTILITIES (no shade)

{-| Set text color (simple colors like white, black).

    text_simple white

-}
text_simple : SimpleColor -> Tailwind
text_simple (SimpleColor c) =
    Tailwind ("text-" ++ c)


{-| Set background color (simple colors like white, black).

    bg_simple white

-}
bg_simple : SimpleColor -> Tailwind
bg_simple (SimpleColor c) =
    Tailwind ("bg-" ++ c)


{-| Set border color (simple colors like white, black).

    border_simple black

-}
border_simple : SimpleColor -> Tailwind
border_simple (SimpleColor c) =
    Tailwind ("border-" ++ c)
`;

  const colorUtilExports = [
    'text_color', 'bg_color', 'border_color', 'ring_color', 'placeholder_color',
    'text_simple', 'bg_simple', 'border_simple'
  ];

  // Opacity utilities
  const opacityDefs = `
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
{-| z-index: ${z}
-}
z_${z} : Tailwind
z_${z} =
    Tailwind "z-${z}"`);
  }
  zIndexExports.push('z_auto');
  zIndexDefs.push(`
{-| z-index: auto
-}
z_auto : Tailwind
z_auto =
    Tailwind "z-auto"`);

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

All functions return the opaque \`Tailwind\` type. Use \`Tailwind.classes\` to
convert a list of Tailwind values to an Html.Attribute.

Following elm-tailwind-modules naming conventions:

  - Hyphens become underscores: \`flex-col\` → \`flex_col\`
  - Numeric prefixes get 'n': \`2xl\` → \`n2xl\`
  - Fractions use 'over': \`w-1/2\` → \`w_1over2\`
  - Decimals use '_dot_': \`p-0.5\` → \`p_0_dot_5\`


## Spacing

@docs ${spacingExports.join(', ')}


## Layout

@docs ${layoutExports.join(', ')}


## Sizing

@docs ${sizingExports.join(', ')}


## Typography

@docs ${typographyExports.join(', ')}


## Font Sizes

@docs ${fontSizeExports.join(', ')}


## Font Weights

@docs ${fontWeightExports.join(', ')}


## Borders

@docs ${borderExports.join(', ')}


## Border Radius

@docs ${radiusExports.join(', ')}


## Effects

@docs ${effectExports.join(', ')}


## Shadows

@docs ${shadowExports.join(', ')}


## Colors

@docs ${colorUtilExports.join(', ')}


## Opacity

@docs ${opacityExports.join(', ')}


## Z-Index

@docs ${zIndexExports.join(', ')}

-}

import Tailwind exposing (Tailwind(..))
import Tailwind.Theme exposing (Color(..), Shade(..), SimpleColor(..), Spacing(..), colorToString, shadeToString, spacingToString)


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

// Generate Tailwind/Breakpoints.elm - responsive utilities using Tailwind type
function generateBreakpoints(theme) {
  const breakpoints = Object.keys(theme.breakpoints);

  const breakpointFunctions = breakpoints.map(bp => {
    const name = toElmName(bp);
    return `
{-| Apply classes at the ${bp} breakpoint (${theme.breakpoints[bp]}) and above.

    ${name} [ Tw.flex, Tw.p s8 ]

produces classes like "sm:flex sm:p-8"

-}
${name} : List Tailwind -> Tailwind
${name} twClasses =
    Tailwind (String.join " " (List.map (\\(Tailwind c) -> "${bp}:" ++ c) twClasses))
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
{-| Apply classes with ${prefix}: variant.

    ${name} [ Tw.bg_color blue_500, Tw.text_color white ]

produces "${prefix}:bg-blue-500 ${prefix}:text-white"

-}
${name} : List Tailwind -> Tailwind
${name} twClasses =
    Tailwind (String.join " " (List.map (\\(Tailwind c) -> "${prefix}:" ++ c) twClasses))
`);

  const stateExports = stateVariants.map(([name]) => name);

  const content = `module Tailwind.Breakpoints exposing
    ( ${breakpointExports.join('\n    , ')}
    , ${stateExports.join('\n    , ')}
    , withVariant
    )

{-| Responsive breakpoints and state variants for Tailwind CSS.

All functions take a \`List Tailwind\` and return a \`Tailwind\` value
with the appropriate variant prefix applied.

Example:

    import Tailwind exposing (classes)
    import Tailwind.Utilities as Tw
    import Tailwind.Breakpoints exposing (hover, md)
    import Tailwind.Theme exposing (s4, blue, s500, s600)

    button
        [ classes
            [ Tw.bg_color blue_500
            , hover [ Tw.bg_color blue_600 ]
            , md [ Tw.p s4 ]
            ]
        ]
        [ text "Click me" ]


## Responsive Breakpoints

@docs ${breakpointExports.join(', ')}


## State Variants

@docs ${stateExports.join(', ')}


## Custom Variants

@docs withVariant

-}

import Tailwind exposing (Tailwind(..))

${breakpointFunctions.join('\n')}

${stateFunctions.join('\n')}

{-| Apply a custom variant prefix to a list of Tailwind values.

    withVariant "aria-selected" [ Tw.bg_color blue_500, Tw.text_color white ]

produces "aria-selected:bg-blue-500 aria-selected:text-white"

-}
withVariant : String -> List Tailwind -> Tailwind
withVariant variant twClasses =
    Tailwind (String.join " " (List.map (\\(Tailwind c) -> variant ++ ":" ++ c) twClasses))
`;

  writeElmFile('Tailwind/Breakpoints.elm', content);
}

main().catch(console.error);
