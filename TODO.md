# TODO / Open Questions

## Completed ✓

- [x] Opaque `Tailwind` type with `classes : List Tailwind -> Attribute msg`
- [x] Parameterized colors: `bg_color : Color -> Shade -> Tailwind` (e.g., `bg_color blue s500`)
- [x] Simple colors: `bg_simple : SimpleColor -> Tailwind` (e.g., `bg_simple white`)
- [x] Parameterized spacing: `p : Spacing -> Tailwind` (e.g., `p s4`)
- [x] elm-review extractor handles all patterns (34 classes from Demo.elm)
- [x] Vite plugin for build-time extraction
- [x] Unit tests for extractor (10 tests passing)

## Parameterized Colors Edge Cases

The current API assumes all colors have the same shade scale (50-950). Edge cases to handle:

1. **Custom theme colors** with non-standard shades (e.g., `brand: { light: '...', dark: '...' }`)
   - Could generate a separate type for custom colors
   - Or use string-based API for custom: `bg_custom "brand" "light"`

2. **Colors with missing shades** - Some themes may not define all 11 shades
   - Code generator should only emit shades that exist in the theme
   - Extractor doesn't need to change (it just extracts what's used)

3. **Simple colors without shades** - white, black, transparent, current, inherit
   - Already handled via `SimpleColor` type and `*_simple` functions

## End-to-End / Snapshot Tests

We should add "approval" (snapshot) tests that verify:

1. **Generated code validity** - Full generated Elm modules compile correctly
2. **Tree shaking** - Only used classes end up in final CSS
3. **Edge case configs** - Custom themes, missing shades, plugin utilities

Test approach:
- Generate Elm code from various Tailwind configs
- Snapshot the generated modules
- Compile and verify they produce expected class strings
- Run through full build pipeline and snapshot extracted classes

Edge cases to test:
- Custom theme colors that don't follow standard shade scale (e.g., `brand: { light: '...', dark: '...' }`)
- Colors with missing shades (not all 50-950)
- Simple colors (white, black, transparent, current, inherit)
- Custom spacing scales
- Plugin-added utilities

## elm-pages + Vite Integration

The Vite plugin runs `elm-review` as a subprocess, independent of Vite's module processing. This means:

- **Build**: Works fine - elm-review reads `elm.json` and scans source directories directly
- **HMR**: May need configuration if Elm files are in directories Vite doesn't watch by default

For elm-pages specifically, if HMR doesn't trigger on Elm file changes, you may need to add the Elm source directories to Vite's watcher:

```js
// vite.config.js
export default {
  server: {
    watch: {
      // Add paths where your Elm files live
      include: ['app/**/*.elm', 'src/**/*.elm']
    }
  }
}
```

## Composability with elm-css

### What elm-tailwind-modules (etwm) provided

In etwm, utilities returned `Css.Style` values, so you could compose with ALL of elm-css:

```elm
-- Tailwind breakpoint with Tailwind utility
Tailwind.Breakpoints.md [ Tw.mx_auto ]

-- elm-css combinator with Tailwind utility
Css.hover [ Tw.opacity_75 ]

-- Mix Tailwind with arbitrary elm-css
Css.batch
    [ Tw.flex
    , Css.property "custom-thing" "value"
    , Css.hover [ Tw.bg_color Theme.gray_50 ]
    ]
```

### What our approach provides

We generate `Html.Attribute msg` (class strings), so:

```elm
-- Our variants work (extracted as "hover:opacity-75")
Tw.hover [ Tw.opacity_75 ]

-- Nested variants work (extracted as "md:hover:bg-blue-500")
Tw.md [ Tw.hover [ Tw.bg_color Theme.blue_500 ] ]
```

### What we lose

1. **elm-css combinators don't work** - Can't use `Css.hover`, `Css.focus`, etc. with our utilities
2. **No arbitrary CSS** - Can't mix `Css.property` with Tailwind utilities
3. **No elm-css animations** - Keyframes defined in Elm won't work

### Tradeoffs

| | elm-tailwind-modules | This approach |
|---|---|---|
| Bundle size | Includes elm-css runtime | No elm-css needed |
| CSS output | Runtime-generated | Build-time Tailwind CSS |
| Composability | Full elm-css ecosystem | Only Tailwind variants |
| Arbitrary CSS | Yes (via elm-css) | No (use `raw` escape hatch) |

### Possible mitigations

1. **Escape hatch**: `Tw.raw "arbitrary-class"` for edge cases
2. **Side-by-side**: Use elm-css separately for non-Tailwind styles (different attributes)
3. **CSS file**: Put truly custom CSS in a `.css` file

### Open question

Is there a way to support BOTH paradigms? Could we:
- Generate `Css.Style` versions for elm-css users?
- Generate `Html.Attribute` versions for pure-Tailwind users?
- Let users choose at code-gen time?

This would require maintaining two APIs but might bridge the gap for teams migrating from etwm.
