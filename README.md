# elm-tailwind-classes

Type-safe Elm API for regular Tailwind CSS classes — no elm-css needed.

- Uses regular Tailwind CSS classes under the hood — no elm-css runtime, no performance overhead
- The Vite plugin generates a type-safe Elm API matching your Tailwind theme
- At build time, the plugin analyzes your Elm code to find which classes to include in your CSS bundle
- Just install and configure the Vite plugin and you're ready to go (see [Quick Start](#quick-start))

## Demo

See it in action:
- **Live site**: [elm-tailwind-classes-demo.netlify.app](https://elm-tailwind-classes-demo.netlify.app/)
- **Source code**: [github.com/dillonkearns/elm-tailwind-classes-demo](https://github.com/dillonkearns/elm-tailwind-classes-demo) (elm-pages project)

## Motivation

Elm developers using Tailwind CSS have historically faced a frustrating tradeoff:

### The Problem with String Classes

Using Tailwind's class strings directly (`class "flex p-4 text-gray-500"`) gives you small bundles and standard tooling, but **no type safety**. Typos like `"flexz"` or invalid values like `"text-gray-550"` silently fail with no compiler help.

### The Problem with elm-css

Tools like [elm-tailwind-modules](https://github.com/matheus23/elm-tailwind-modules) solve type safety by generating Elm functions that produce `elm-css` styles. This gives you a nice parameterized API (`Tw.p_4`, `Tw.text_color Theme.gray_500`), but comes with significant costs:

- **Runtime overhead**: elm-css must collect and hash styles at runtime, which is more expensive than parsing stylesheets
- **Bundle size**: The elm-css runtime adds to your JavaScript bundle
- **Performance degradation**: Real-world examples show style recomputation taking ~3 seconds for pages with ~900 elements, each with ~20 styles applied
- **Sequential bottleneck**: CSS and JS parsing can be done in parallel by browsers, but computing styles in JS means that work happens *after* all JS has been parsed

### This Solution: Best of Both Worlds

**elm-tailwind-classes** gives you the **developer experience of elm-tailwind-modules** (type-safe, parameterized API) with the **runtime characteristics of plain Tailwind** (zero JS overhead, build-time CSS):

**String classes**: No type safety, no parameterization, small bundle, build-time CSS

**elm-tailwind-modules**: Type-safe, parameterized, but includes elm-css runtime and generates CSS at runtime

**elm-tailwind-classes**: Type-safe, parameterized, small bundle, build-time CSS - the best of both worlds!

The key insight: generate class *strings* (not elm-css styles), then use static analysis to extract them for Tailwind's JIT compiler. You get compile-time errors for typos, a nice API for programmatic styling, and zero runtime cost.

## Features

- **Type-safe API**: `Tw.bg_color (blue s500)` not `"bg-blue-500"` strings - typos are compile errors
- **Parameterized values**: `Tw.p s4` not `Tw.p_4` - use the same spacing value across padding, margin, gap, width
- **Composable variants**: Nest responsive and state variants naturally: `md [ hover [ Tw.bg_color (blue s600) ] ]`
- **Smart static extraction**: Even `List.map` and `case` expressions are analyzed - all possible classes are extracted
- **Auto-generated from your Tailwind config**: Custom colors, spacing, etc. just work
- **Zero config**: Just add the Vite plugin - no elm-review setup required
- **No runtime overhead**: Generates class strings, not elm-css styles

### Parameterized Example

```elm
-- Use the same spacing value everywhere
buttonPadding : Spacing
buttonPadding = s4

button [ classes [ Tw.px buttonPadding, Tw.py s2 ] ] [ text "Click" ]

-- Map over a list - all values are statically extracted!
List.map (\size -> div [ classes [ Tw.p size ] ] []) [ s2, s4, s8 ]

-- Conditional classes - both branches are extracted
classes [ if isLarge then Tw.p s8 else Tw.p s4 ]
```

## Quick Start

> **Prerequisites:** You need an existing Vite project with Elm. If you're starting fresh, check out [vite-plugin-elm](https://github.com/hmsk/vite-plugin-elm) or [elm-pages](https://elm-pages.com).

### 1. Install the packages

```bash
npm install github:dillonkearns/elm-tailwind-classes @tailwindcss/vite elm-review
```

### 2. Add the Vite plugins

```javascript
// vite.config.js
import { defineConfig } from 'vite'
import { elmTailwind } from 'elm-tailwind-classes'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    elmTailwind(),
    tailwindcss(),
  ]
})
```

### 3. Add the generated directory to elm.json

The plugin generates Elm modules to `.elm-tailwind/`. Add it to your source directories:

```json
{
  "source-directories": [
    "src",
    ".elm-tailwind"
  ]
}
```

### 4. Set up your CSS file

Create a CSS file (e.g., `style.css`) with:

```css
@import "tailwindcss";
```

Then import it in your JavaScript/TypeScript entry point:

```javascript
// index.js or index.ts
import "./style.css";
```

> **Note:** Import CSS via JavaScript (not a `<link>` tag) for hot-reloading to work when you add new Tailwind classes.

### 5. Run Vite and start coding!

When you run `npm run dev`, the plugin generates the Elm modules automatically. Now you can write:

```elm
import Tailwind as Tw exposing (classes)
import Tailwind.Theme exposing (blue, gray, s4, s500, s600, s800, white)
import Tailwind.Breakpoints exposing (hover, md)

view =
    div
        [ classes
            [ Tw.flex
            , Tw.items_center
            , Tw.p s4
            , Tw.bg_color (blue s500)
            , Tw.text_simple white
            , hover [ Tw.bg_color (blue s600) ]
            , md [ Tw.p s8 ]
            ]
        ]
        [ text "Hello, Tailwind!" ]
```

The plugin handles everything:
1. **Generates Elm modules** matching your Tailwind theme → `.elm-tailwind/`
2. **Analyzes your Elm code** to find which Tailwind classes you're using
3. **Tells Tailwind** which classes to include in your CSS bundle

### 6. Add `.elm-tailwind/` to .gitignore

The generated modules are specific to your Tailwind config, so don't commit them:

```
# Generated by elm-tailwind-classes
.elm-tailwind/
```

## Plugin Options

```javascript
elmTailwind({
  debug: true,                    // Log detailed info
  generateDir: '.elm-tailwind',   // Where to generate Elm modules
  cssPath: './src/styles.css',    // CSS with Tailwind config (auto-detected)
  elmJson: './elm.json'           // elm.json path (auto-detected)
})
```

## API

### Spacing (parameterized)

```elm
Tw.p s4      -- "p-4"
Tw.mx s2     -- "mx-2"
Tw.gap s8    -- "gap-8"
Tw.w s64     -- "w-64"
```

### Colors (parameterized)

```elm
-- Shaded colors: apply shade to color name
Tw.bg_color (blue s500)       -- "bg-blue-500"
Tw.text_color (gray s800)     -- "text-gray-800"
Tw.border_color (red s300)    -- "border-red-300"

-- Simple colors: SimpleColor -> Tailwind
Tw.bg_simple white            -- "bg-white"
Tw.text_simple black          -- "text-black"
```

### Variants (composable)

```elm
hover [ Tw.bg_color (blue s600) ]           -- "hover:bg-blue-600"
md [ Tw.p s8 ]                              -- "md:p-8"
md [ hover [ Tw.text_color (gray s900) ] ]  -- "md:hover:text-gray-900"
```

### Simple utilities

```elm
Tw.flex           -- "flex"
Tw.items_center   -- "items-center"
Tw.rounded_lg     -- "rounded-lg"
Tw.shadow_md      -- "shadow-md"
```

### Reusable style groups

```elm
-- Define reusable styles with batch
buttonBase : Tailwind
buttonBase =
    batch
        [ Tw.px s4
        , Tw.py s2
        , Tw.rounded_lg
        , Tw.font_semibold
        , hover [ Tw.opacity_90 ]
        ]

-- Use in multiple places
primaryButton =
    button [ classes [ buttonBase, Tw.bg_color (blue s500), Tw.text_simple white ] ]

secondaryButton =
    button [ classes [ buttonBase, Tw.bg_color (gray s200), Tw.text_color (gray s800) ] ]
```

### Escape hatch

```elm
Tw.raw "custom-plugin-class"  -- For classes not in the generated API
```

## elm-pages Integration

Works with elm-pages out of the box:

```javascript
// elm-pages.config.mjs
import { defineConfig } from 'vite'
import { elmTailwind } from 'elm-tailwind-classes'
import tailwindcss from '@tailwindcss/vite'

export default {
  vite: defineConfig({
    plugins: [elmTailwind(), tailwindcss()]
  })
}
```

Make sure to import your CSS in your entry point (e.g., `index.ts`):

```typescript
import "./style.css";

const config: ElmPagesInit = {
  // ...
};

export default config;
```

The plugin auto-detects elm.json location for elm-pages projects.

## Hot Module Replacement (HMR)

When you change Elm files, the plugin automatically:
1. Re-extracts used Tailwind classes via elm-review
2. Updates the safelist
3. Triggers Vite's CSS HMR to reload styles

### HMR Requirements

For HMR to work properly:

1. **Import CSS via JavaScript** - CSS must be imported in your JS/TS entry point (`import "./style.css"`), not via a `<link>` tag in HTML
2. **Don't use both** - Remove any `<link rel="stylesheet" href="./style.css">` from your HTML if you're using the JS import

### Troubleshooting HMR

If CSS changes aren't hot-reloading:

1. **Enable debug mode** to see what's happening:
   ```javascript
   elmTailwind({ debug: true })
   ```

2. **Check the console** for messages like:
   - `[elm-tailwind] Elm file changed: MyComponent.elm`
   - `[elm-tailwind] Re-extracted classes: 42`
   - `[elm-tailwind] Classes changed! New classes: ...`
   - `[elm-tailwind] Triggered Vite CSS HMR`

3. **Verify CSS import method** - Open browser DevTools Network tab, look for your CSS file. If loaded via `<link>` tag, switch to JS import.

4. **Check for errors** - Look for `[elm-tailwind]` errors in the terminal where Vite is running.

## Custom Tailwind Config

Your custom colors, spacing, etc. are automatically included in the generated Elm modules:

```css
/* styles.css */
@import "tailwindcss";

@theme {
  --color-brand-light: #e0f2fe;
  --color-brand: #0ea5e9;
  --color-brand-dark: #0369a1;
}
```

After running Vite, the plugin generates Elm functions for your custom colors:

```elm
-- Custom colors become simple Color values (no shade parameter)
Tw.bg_color brand       -- "bg-brand"
Tw.bg_color brandLight  -- "bg-brand-light"
Tw.bg_color brandDark   -- "bg-brand-dark"
```

> **Note:** Custom colors defined with `--color-name` become simple colors. If you want shaded colors (50-950 scale), define them with the full shade scale in your CSS.

## Local Development

```bash
# Install locally from path
npm install /path/to/elm-tailwind-classes

# Run tests
npm test
```

## License

BSD-3-Clause. See [LICENSE](./LICENSE) for details.
