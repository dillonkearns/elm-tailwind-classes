// Main code generator for elm-tailwind-classes
// Generates an opaque Tailwind type with type-safe utilities
import { resolveTheme } from 'tailwind-resolver';
import { __unstable__loadDesignSystem } from 'tailwindcss';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
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

  console.log('Loading Tailwind design system...');
  const twDir = path.join(__dirname, 'node_modules', 'tailwindcss');
  const designSystem = await __unstable__loadDesignSystem('@import "tailwindcss";', {
    loadStylesheet: async (id, base) => {
      let resolved;
      if (id === 'tailwindcss') resolved = path.join(twDir, 'index.css');
      else if (id.startsWith('tailwindcss/')) resolved = path.join(twDir, id.replace('tailwindcss/', ''));
      else resolved = path.resolve(base, id);
      return { content: fs.readFileSync(resolved, 'utf8'), base: path.dirname(resolved) };
    },
  });

  console.log('Generating Elm modules...');

  // Ensure output directories exist
  ensureDir(path.join(OUTPUT_DIR, 'Tailwind'));

  // Generate modules
  generateTailwindCore();      // Main Tailwind module with opaque type
  generateTheme(theme);        // Colors, spacing, opacity types
  generateUtilities(theme, designSystem);    // All utility functions
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
  let name = className;
  // Handle leading negative sign (-m-px -> neg_m_px)
  if (name.startsWith('-')) {
    name = 'neg_' + name.slice(1);
  }
  // Handle numeric prefixes (2xl -> n2xl)
  if (/^\d/.test(name)) {
    name = 'n' + name;
  }
  // Replace hyphens with underscores, dots with _dot_
  name = name.replace(/-/g, '_').replace(/\./g, '_dot_');
  // Handle fractions like 1/2 -> 1over2
  name = name.replace(/\//g, 'over');
  return name;
}

// Extract a clean one-line CSS doc comment from candidatesToCss output.
// Strips the selector, @property blocks, and escapes -{- / -}- for Elm comments.
function cssDocComment(css, fallback) {
  if (!css) return fallback;
  // Extract just the first rule's declarations
  const match = css.match(/^\.[^\s{]+\s*\{([^}]*)\}/);
  if (!match) return fallback;
  const body = match[1].trim()
    .replace(/-\}/g, '- }')   // escape Elm comment close
    .replace(/\{-/g, '{ -');  // escape Elm comment open
  return body || fallback;
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

  // Add special simple colors that Tailwind supports
  const specialSimpleColors = ['transparent', 'current', 'inherit'];

  // Standard Tailwind shade scale
  const shadeScale = ['50', '100', '200', '300', '400', '500', '600', '700', '800', '900', '950'];

  // Build Shade type constructors
  const shadeConstructors = shadeScale.map(s => `S${s}`);

  // Build shade value definitions
  const shadeValueDefs = shadeScale.map(s => {
    const label = s === '50' ? ' (lightest)' : s === '500' ? ' (medium)' : s === '950' ? ' (darkest)' : '';
    return `
{-| Shade ${s}${label}
-}
s${s} : Shade
s${s} =
    S${s}`;
  });
  const shadeValueExports = shadeScale.map(s => `s${s}`);

  // Build shadeToString case expression
  const shadeCases = shadeScale.map(s => `        S${s} ->\n            "${s}"`);

  // Build shaded color function definitions (blue : Shade -> Color)
  const shadedColorDefs = shadedColors.map(c => {
    const elmName = toElmName(c);
    const capitalized = elmName.charAt(0).toUpperCase() + elmName.slice(1);
    return `
{-| ${capitalized} color. Apply a shade: \`${elmName} s500\`
-}
${elmName} : Shade -> Color
${elmName} shade =
    Color ("${c}-" ++ shadeToString shade)`;
  });
  const shadedColorExports = shadedColors.map(c => toElmName(c));

  // Build simple color definitions (white : Color)
  const simpleColorDefs = simpleColors.map(c => {
    const elmName = toElmName(c);
    const capitalized = elmName.charAt(0).toUpperCase() + elmName.slice(1);
    return `
{-| ${capitalized} color. Usage: \`text_color ${elmName}\`
-}
${elmName} : Color
${elmName} =
    Color "${c}"`;
  });

  // Add special colors
  const specialColorDefs = `
{-| Transparent color. Usage: \`bg_color transparent\`
-}
transparent : Color
transparent =
    Color "transparent"


{-| Current color (inherits from text color). Usage: \`border_color currentColor\`
-}
currentColor : Color
currentColor =
    Color "current"


{-| Inherit color. Usage: \`text_color inherit\`
-}
inherit : Color
inherit =
    Color "inherit"`;

  const simpleColorExports = [...simpleColors.map(c => toElmName(c)), 'transparent', 'currentColor', 'inherit'];

  // Tailwind's default spacing scale
  const spacingScale = [
    '0', 'px', '0.5', '1', '1.5', '2', '2.5', '3', '3.5', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '14', '16', '20', '24', '28', '32', '36', '40', '44', '48', '52', '56', '60',
    '64', '72', '80', '96'
  ];

  // Build Spacing type constructors
  const spacingConstructors = spacingScale.map(v => {
    const elmName = 'S' + toElmName(v).replace(/^n/, '');
    return elmName;
  });

  // Build spacing value definitions
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

  // Build spacingToString case expression
  const spacingCases = spacingScale.map(v => {
    const constructorName = 'S' + toElmName(v).replace(/^n/, '');
    return `        ${constructorName} ->\n            "${v}"`;
  });

  // Opacity values
  const opacityValues = [0, 5, 10, 20, 25, 30, 40, 50, 60, 70, 75, 80, 90, 95, 100];
  const opacityDefs = opacityValues.map(v => `
{-| Opacity ${v}%
-}
opacity${v} : Opacity
opacity${v} =
    Opacity ${v}`);
  const opacityExports = opacityValues.map(v => `opacity${v}`);

  const content = `module Tailwind.Theme exposing
    ( Color, colorToString
    , ${shadedColorExports.join(', ')}
    , Shade, shadeToString, ${shadeValueExports.join(', ')}
    , ${simpleColorExports.join(', ')}
    , Spacing(..), spacingToString, ${spacingValueExports.join(', ')}
    , Opacity(..), ${opacityExports.join(', ')}
    )

{-| Theme values for Tailwind CSS.

This module provides type-safe color, shade, spacing, and opacity values.


## Color Type

@docs Color, colorToString


## Shaded Colors

Colors that take a shade parameter. Usage: \`text_color (blue s500)\`

@docs ${shadedColorExports.join(', ')}


## Shades

@docs Shade, shadeToString, ${shadeValueExports.join(', ')}


## Simple Colors

Colors without shades. Usage: \`text_color white\`

@docs ${simpleColorExports.join(', ')}


## Spacing

@docs Spacing, spacingToString, ${spacingValueExports.join(', ')}


## Opacities

@docs Opacity, ${opacityExports.join(', ')}

-}


{-| A color value that can be used with color utilities like \`text_color\`, \`bg_color\`, etc.

Colors are either shaded (created by applying a shade to a color name like \`blue s500\`)
or simple (like \`white\`, \`black\`, \`transparent\`).

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

${shadedColorDefs.join('\n')}



-- SHADES

${shadeValueDefs.join('\n')}



-- SIMPLE COLORS

${simpleColorDefs.join('\n')}

${specialColorDefs}



-- SPACING VALUES

${spacingValueDefs.join('\n')}



-- OPACITY VALUES

${opacityDefs.join('\n')}
`;

  writeElmFile('Tailwind/Theme.elm', content);
}

// Generate Tailwind/Utilities.elm - all utility functions returning Tailwind type
function generateUtilities(theme, designSystem) {
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

  // Layout utilities — static utilities (flex, block, items-center, etc.) are now
  // generated from the Tailwind design system. Only functional expansions that
  // aren't in the static utility registry need to stay here.
  const layoutDefs = ``;
  const layoutExports = [];

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

  // Typography utilities — now generated from the design system
  const typographyDefs = ``;
  const typographyExports = [];

  // Border utilities — now generated from the design system
  const borderDefs = ``;
  const borderExports = [];

  // Effect utilities — now generated from the design system
  const effectDefs = ``;
  const effectExports = [];

  // Color utility functions (parameterized with Color + Shade)
  const colorUtilDefs = `
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
`;

  const colorUtilExports = [
    'text_color', 'bg_color', 'border_color', 'ring_color', 'placeholder_color'
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

  // Generate static utilities from Tailwind's design system
  // This automatically picks up all static utilities (like text-balance, text-pretty, etc.)
  // without needing to hardcode them.
  const existingExports = new Set([
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
  ]);

  const designSystemStaticDefs = [];
  const designSystemStaticExports = [];

  if (designSystem) {
    const staticKeys = [...designSystem.utilities.keys('static')].sort();
    for (const className of staticKeys) {
      const elmName = toElmName(className);
      // Skip if already covered by existing handwritten sections
      if (existingExports.has(elmName)) continue;

      // Get the CSS this utility generates for the doc comment
      const cssArray = designSystem.candidatesToCss([className]);
      const cssBody = cssDocComment(cssArray?.[0], className);

      designSystemStaticDefs.push(`
{-| ${cssBody}
-}
${elmName} : Tailwind
${elmName} =
    Tailwind "${className}"`);
      designSystemStaticExports.push(elmName);
    }
    console.log(`  Generated ${designSystemStaticExports.length} static utilities from design system`);
  }

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
    ...designSystemStaticExports,
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

${designSystemStaticExports.length > 0 ? `

## Additional Utilities

@docs ${designSystemStaticExports.join(', ')}

` : ''}
-}

import Tailwind exposing (Tailwind(..))
import Tailwind.Theme exposing (Color, Spacing(..), colorToString, spacingToString)


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

-- ADDITIONAL UTILITIES (from Tailwind design system)
${designSystemStaticDefs.join('\n')}
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
