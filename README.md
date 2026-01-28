# elm-tailwind-classes

Type-safe Tailwind CSS for Elm with automatic code generation and static class extraction.

## Features

- **Type-safe API**: `Tw.bg_color blue s500` not `"bg-blue-500"` strings
- **Auto-generated from your Tailwind config**: Custom colors, spacing, etc. just work
- **Static extraction**: Classes extracted at build time automatically
- **Zero config**: Just add the Vite plugin - no elm-review setup required
- **No runtime overhead**: Generates class strings, not elm-css styles

## Quick Start

### 1. Install

```bash
npm install elm-tailwind-classes elm-review
```

### 2. Add to elm.json

```json
{
  "source-directories": [
    "src",
    ".elm-tailwind"
  ]
}
```

### 3. Add Vite plugins

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

Make sure your CSS file has `@import "tailwindcss";` - the plugin handles everything else automatically.

### 4. Write type-safe Tailwind!

```elm
import Tailwind exposing (classes)
import Tailwind.Theme exposing (blue, gray, s4, s500, s800, white)
import Tailwind.Utilities as Tw
import Tailwind.Breakpoints exposing (hover, md)

view =
    div
        [ classes
            [ Tw.flex
            , Tw.items_center
            , Tw.p s4
            , Tw.bg_color blue s500
            , Tw.text_simple white
            , hover [ Tw.bg_color blue s600 ]
            , md [ Tw.p s8 ]
            ]
        ]
        [ text "Hello, Tailwind!" ]
```

That's it! The Vite plugin:
1. **Reads your Tailwind config** and generates type-safe Elm modules to `.elm-tailwind/`
2. **Extracts used classes** from your Elm code at build time
3. **Injects them into Tailwind** for optimized CSS output

### 5. Add `.elm-tailwind/` to .gitignore

```
# Generated Tailwind Elm modules
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
-- Shaded colors: Color -> Shade -> Tailwind
Tw.bg_color blue s500       -- "bg-blue-500"
Tw.text_color gray s800     -- "text-gray-800"
Tw.border_color red s300    -- "border-red-300"

-- Simple colors: SimpleColor -> Tailwind
Tw.bg_simple white          -- "bg-white"
Tw.text_simple black        -- "text-black"
```

### Variants (composable)

```elm
hover [ Tw.bg_color blue s600 ]           -- "hover:bg-blue-600"
md [ Tw.p s8 ]                            -- "md:p-8"
md [ hover [ Tw.text_color gray s900 ] ]  -- "md:hover:text-gray-900"
```

### Simple utilities

```elm
Tw.flex           -- "flex"
Tw.items_center   -- "items-center"
Tw.rounded_lg     -- "rounded-lg"
Tw.shadow_md      -- "shadow-md"
```

### Escape hatch

```elm
Tw.raw "custom-plugin-class"  -- For classes not in the generated API
```

## How it works

1. **Code generation**: Parses your Tailwind config, generates type-safe Elm modules to `.elm-tailwind/`
2. **Static extraction**: Runs bundled elm-review to find all Tailwind classes used in your Elm code
3. **CSS interception**: Intercepts your CSS requests and injects `@source` directive for extracted classes
4. **Tailwind JIT**: Only classes you actually use end up in the final CSS

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

The plugin auto-detects elm.json location for elm-pages projects.

## Custom Tailwind Config

Your custom colors, spacing, etc. are automatically included:

```css
/* styles.css */
@import "tailwindcss";

@theme {
  --color-brand-light: #e0f2fe;
  --color-brand: #0ea5e9;
  --color-brand-dark: #0369a1;
}
```

After running Vite, you can use:

```elm
Tw.bg_color brand s500  -- Uses your custom "brand" color
```

## Local Development

```bash
# Install locally from path
npm install /path/to/elm-tailwind-classes

# Run tests
npm test
```
