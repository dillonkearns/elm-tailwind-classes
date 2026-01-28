# TODO / Open Questions

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
