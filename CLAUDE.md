# Type-Safe Tailwind CSS for Elm: Design Document

## Problem Statement

Elm developers face a tradeoff when using Tailwind CSS:

1. **Native Tailwind (class strings)**: Small bundle size, standard tooling, but no type safety. Typos like `"flexz"` or invalid values like `"text-gray-550"` silently fail.

2. **elm-tailwind-modules + elm-css**: Type-safe, parameterized API (`Tw.p 4`, `Tw.textColor Theme.gray500`), but includes the elm-css runtime in the bundle and generates CSS at runtime rather than build time.

The core tension: **runtime performance vs. compile-time safety**.

## Goals

1. **Type safety**: Catch typos and invalid values at compile time
2. **Parameterized API**: Write `Tw.p 4` not `Tw.p4`, enabling programmatic styling
3. **Small bundle**: No elm-css runtime, no generated Tailwind Elm modules in the bundle
4. **CSS tree shaking**: Only include CSS for classes actually used
5. **Standard tooling**: Use Tailwind's native CSS generation and tooling

## Existing Solutions

### elm-tailwind-modules (matheus23)

**How it works**: Generates Elm functions that produce `Css.Style` values (elm-css). CSS is generated at runtime. Elm's dead code elimination removes unused functions.

**Pros**:
- Type-safe, parameterized API
- Tree shaking via Elm's DCE

**Cons**:
- elm-css runtime in bundle
- Not using Tailwind's optimized CSS output
- Runtime CSS generation overhead

### Native Tailwind with Class Strings

**How it works**: Write class strings directly: `class "flex p-4 text-gray-500"`

**Pros**:
- Smallest bundle (elm-css fully DCE'd out if unused)
- Build-time CSS generation
- Standard Tailwind tooling and documentation

**Cons**:
- No type safety
- No parameterization
- Typos fail silently

### Typed Constants (Middle Ground)

**How it works**: Define string constants for each class:

```elm
flex : String
flex = "flex"

p4 : String
p4 = "p-4"
```

**Pros**:
- Type safety for typos
- Tailwind can scan the string literals

**Cons**:
- No parameterization (`p4` not `p 4`)
- No CSS tree shaking (all strings present in source)

## Pitfalls and Challenges

### Tailwind's Detection Mechanism

Tailwind scans source files as **plain text** using regex. It does not parse or execute code. From the [Tailwind docs](https://tailwindcss.com/docs/content-configuration):

> "We don't actually parse or execute any of your code in the language it's written in, we just use regular expressions to extract every string that could possibly be a class name."

This means:
- `"p-4"` in source → detected
- `"p-" ++ String.fromInt n` → NOT detected (dynamic)
- Function calls like `Tw.p 4` → NOT detected (no string literal)

### No Custom Extractors in Tailwind v4

Tailwind v4 simplified the API and removed custom extractor support. The only options are:
- Configure which files/directories to scan
- Use `@source inline("...")` to safelist specific classes

### Build Order with Vite

With Vite, Tailwind typically scans source files during the build. For scanning compiled output to work, the build order must be:
1. Compile Elm → JS with class strings as literals
2. Scan compiled JS for classes
3. Generate CSS

This ordering isn't guaranteed by default Vite configuration.

### Dynamic Values

Some usages are truly dynamic and cannot be statically analyzed:

```elm
Tw.p model.userPreferredSpacing  -- Value from runtime
Tw.p (List.length items)          -- Computed at runtime
```

These require either:
- Warning the developer
- Falling back to including all possible values
- Restructuring to use a finite set of options

## Proposed Solution: elm-review Extractor

### Overview

A two-part solution:

1. **Elm Package**: Type-safe, parameterized Tailwind API that generates class strings
2. **elm-review Extractor**: Static analysis that extracts all used/possible classes as JSON

The JSON output feeds into Tailwind's `@source inline()` directive or a scanned safelist file.

### Part 1: Elm Package API

```elm
module Tw exposing (..)

-- Parameterized spacing
p : Int -> Attribute msg
p n = class ("p-" ++ String.fromInt n)

m : Int -> Attribute msg
px : Int -> Attribute msg
py : Int -> Attribute msg
-- etc.

-- Type-safe colors
type Color
    = Gray50 | Gray100 | Gray200 | Gray300 | Gray400
    | Gray500 | Gray600 | Gray700 | Gray800 | Gray900
    | Blue50 | Blue100 | Blue200 -- ... etc.

textColor : Color -> Attribute msg
textColor color = class ("text-" ++ colorToString color)

bgColor : Color -> Attribute msg
borderColor : Color -> Attribute msg

-- Variants (prefix child classes)
hover : List (Attribute msg) -> Attribute msg
focus : List (Attribute msg) -> Attribute msg
md : List (Attribute msg) -> Attribute msg
lg : List (Attribute msg) -> Attribute msg

-- Combining multiple classes
classes : List (Attribute msg) -> Attribute msg
```

**Usage**:

```elm
view model =
    div
        [ Tw.classes
            [ Tw.flex
            , Tw.itemsCenter
            , Tw.p 4
            , Tw.textColor Tw.Gray500
            , Tw.hover [ Tw.textColor Tw.Gray900 ]
            , Tw.md [ Tw.p 8 ]
            ]
        ]
        [ text "Hello" ]
```

### Part 2: elm-review Extractor

An elm-review rule that performs static analysis and outputs JSON:

```json
{
  "classes": {
    "definite": [
      "flex",
      "items-center",
      "p-4",
      "text-gray-500",
      "hover:text-gray-900",
      "md:p-8"
    ],
    "possible": [
      "p-2",
      "p-6"
    ]
  },
  "warnings": [
    {
      "file": "src/Components/Dynamic.elm",
      "line": 45,
      "message": "Cannot statically analyze: Tw.p with non-literal argument"
    }
  ]
}
```

**What the extractor can analyze**:

| Pattern | Analyzable | Result |
|---------|------------|--------|
| `Tw.p 4` | ✓ Definite | `"p-4"` |
| `if x then Tw.p 4 else Tw.p 8` | ✓ Definite | `"p-4"`, `"p-8"` |
| `case size of Small -> Tw.p 2; Large -> Tw.p 6` | ✓ Definite | `"p-2"`, `"p-6"` |
| `List.map Tw.p [1, 2, 4]` | ✓ Definite | `"p-1"`, `"p-2"`, `"p-4"` |
| `let spacing = 4 in Tw.p spacing` | ✓ Definite | `"p-4"` |
| `Tw.p model.spacing` | ✗ Warning | Cannot analyze |
| `Tw.p (compute x)` | ✗ Warning | Cannot analyze |

**Handling variants**:

```elm
Tw.md [ Tw.hover [ Tw.bgColor Tw.Blue500 ] ]
```

The extractor understands the nesting and outputs: `"md:hover:bg-blue-500"`

**Following bindings**:

```elm
buttonStyle : Attribute msg
buttonStyle =
    Tw.classes [ Tw.px 4, Tw.py 2, Tw.rounded ]

-- Used elsewhere
view = button [ buttonStyle ] [ text "Click" ]
```

The extractor follows the reference to `buttonStyle`, analyzes its definition, and includes `"px-4"`, `"py-2"`, `"rounded"`.

### Part 3: Build Integration

**Option A: Generate @source inline()**

```bash
# Extract classes
elm-review --extract > review-output.json

# Generate CSS directive
jq -r '.extracts.TailwindClasses.classes.definite | join(" ")' review-output.json \
  | xargs -I {} echo '@source inline("{}");' >> style.css

# Build
npm run build
```

**Option B: Vite Plugin**

```javascript
// elm-pages.config.mjs
import { extractTailwindClasses } from 'elm-tailwind-extractor';

export default {
  vite: {
    plugins: [
      extractTailwindClasses(), // Runs elm-review, generates safelist
      tailwindcss(),
      // ...
    ],
  },
};
```

**Option C: Safelist File**

Generate a file that Tailwind scans:

```javascript
// tailwind-safelist.js (generated)
export const classes = "flex items-center p-4 p-8 text-gray-500 hover:text-gray-900 md:p-8";
```

Configure Tailwind to scan this file.

### Assumptions

1. **Dead code removal**: The codebase uses elm-review rules like `NoUnused.Variables`, `NoUnused.CustomTypeConstructors`, etc. This ensures the extractor doesn't include classes from dead code paths.

2. **Static styling patterns**: Most styling can be expressed with literal values or finite sets. Truly dynamic styling (based on runtime data) is rare and can be handled with explicit safelisting.

3. **Build system integration**: The extraction step runs before Tailwind's CSS generation.

## Benefits of This Approach

1. **Type safety**: `Tw.flexx` won't compile. `Tw.textColor Tw.Gray550` won't compile.

2. **Parameterization**: Write `Tw.p 4` not `Tw.p4`. Programmatic patterns work.

3. **Small bundle**: No elm-css, no large generated Tailwind modules. Just a small API package.

4. **CSS tree shaking**: Only classes identified by the extractor are included.

5. **Standard Tailwind**: Uses Tailwind's native CSS generation, JIT compiler, and optimizations.

6. **Actionable warnings**: Developer knows when they've written something that can't be statically analyzed and can refactor.

7. **Leverages existing tools**: elm-review extractors are a proven pattern. No need to build custom Elm parsers.

## Open Questions

1. **Variant API design**: How should nested variants be represented for easy analysis?
   - Nested lists: `Tw.md [ Tw.hover [ Tw.bgColor Blue500 ] ]`
   - Pipeline: `Tw.bgColor Blue500 |> Tw.withHover |> Tw.withMd`
   - Explicit: `Tw.bgColor Blue500 |> Tw.variant "md:hover"`

2. **Arbitrary values**: Should the API support Tailwind's arbitrary value syntax like `p-[17px]`? These are harder to make type-safe.

3. **Custom theme values**: How to handle project-specific colors/spacing defined in `tailwind.config.js`? Code generation?

4. **Performance**: How fast is the elm-review extraction on large codebases? Is caching needed?

5. **Incremental builds**: Can the extraction be incremental, or must it re-analyze everything on each build?

## Next Steps

1. Prototype the Elm package API and validate ergonomics
2. Implement a basic elm-review extractor for core utilities
3. Test build integration with elm-pages
4. Benchmark extraction performance
5. Document patterns for handling dynamic styling needs
