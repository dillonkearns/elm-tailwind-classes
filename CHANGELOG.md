# Changelog

All notable changes to `elm-tailwind-classes` will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.6.2] - 2026-04-07

### Fixed

- Fix relative `@import` path resolution in CSS files located in subdirectories. When the CSS file (e.g. `css/app.css`) contained `@import "print.css"`, the codegen resolved the path from the working directory instead of from the CSS file's directory. This affected both the CLI (`elm-tailwind-classes gen`) and the Vite plugin's code generation step.

## [0.6.1] - 2026-03-30

### Fixed

- Pin `tailwind-resolver` to 0.3.5 to avoid broken 0.3.8 release that causes `Export 'u1' is not defined in module` errors.

## [0.6.0] - 2026-03-30

### Changed

- **Fast HMR (~5s faster per change).** Eliminated elm-review extraction during HMR. The codegen now generates `@source inline()` CSS directives at startup that pre-declare all parameterized class combinations (spacing, colors, variants). Tailwind's scanner handles new static utilities from the compiled JS, and `@source inline()` covers parameterized ones — no re-extraction needed. Extraction still runs once at startup and for production builds.

## [0.5.1] - 2026-03-29

### Fixed

- **Missing bare functional utilities like `rounded`, `resize`, `blur`, `sepia`, etc.** Some functional utilities produce valid CSS for their bare name (e.g. `rounded` → `border-radius: 0.25rem`) but don't include it in their completion groups. The codegen now checks `candidatesToCss` for the bare utility name in addition to enumerating completion values.

## [0.5.0] - 2026-03-29

### Fixed

- **HMR full page reload.** Adding or removing Tailwind classes in Elm code caused a full page reload instead of a CSS hot update. The root cause was that writing `safelist.txt` during HMR triggered Vite's file watcher on a non-CSS asset, which Vite can only handle via full reload. The fix uses `@source inline()` to write classes directly into the wrapper CSS during HMR, keeping the change within the CSS module graph where Vite can hot-replace it.
- Skip `handleHotUpdate` for generated `.elm` files in the output directory, preventing unnecessary extraction cycles during codegen.

### Added

- **Cypress integration tests** for both HMR and production builds. The HMR test verifies a blue-to-red-to-blue color swap with `Browser.application` survives two full extraction cycles without a page reload. The build test verifies parameterized colors, spacing, static utilities, and variants are applied in the production output.
- **CI runs Cypress tests** — HMR and build tests run on every push/PR alongside unit and golden tests.

## [0.4.0] - 2026-03-27

### Added

- **Auto-discover functional utilities from Tailwind's design system.** Utilities like `line-clamp-1`..`line-clamp-6`, `blur-*`, `brightness-*`, `contrast-*`, `scale-*`, `rotate-*`, `hue-rotate-*`, `saturate-*`, `sepia-*`, `grayscale-*`, `invert-*`, and many more are now generated automatically. Previously only static utilities were discovered; functional utilities with small value sets (up to 20 values per group) are now enumerated via `getCompletions()`.
- **Tailwind plugin support.** Plugins like `@tailwindcss/typography` now work automatically. The codegen reads the user's actual CSS file (including `@plugin` directives) and provides the `loadModule` callback, so plugin-registered utilities (e.g. `prose`, `prose-lg`) appear in the generated Elm API.
- **Custom `@utility` support.** Project-defined utilities via Tailwind's `@utility` directive are picked up by the design system and generated into the Elm API.

### Fixed

- Missing functional utilities (`line-clamp-1`..`6`, `blur-*`, `brightness-*`, `contrast-*`, `drop-shadow-*`, `hue-rotate-*`, `saturate-*`, `sepia-*`, `grayscale-*`, `invert-*`, `scale-*`, `skew-*`, `rotate-*`, etc.) that Tailwind classifies as "functional" rather than "static". These were previously only available via `Tw.raw`.
- `loadDesignSystem` was ignoring the user's CSS file, hardcoding `@import "tailwindcss"` instead. This meant `@plugin`, `@utility`, and other CSS directives were not picked up during code generation.

## [0.3.0] - 2026-03-25

### Added

- **Auto-discover static utilities from Tailwind's design system.** All ~800 static utility classes (like `text-balance`, `text-pretty`, `sr-only`, `isolate`, etc.) are now generated automatically from Tailwind's `__unstable__loadDesignSystem` API instead of being manually hardcoded. New utilities added by Tailwind will be picked up automatically on upgrade.
- **Negative utility support** with the `neg_` prefix convention (e.g., `neg_m_px`, `neg_translate_x_full`), matching the existing `neg_m`, `neg_mx` pattern.
- **Snapshot tests** using `dillonkearns/elm-snapshot` to catch any silent addition or removal of utility functions (975 type signatures) and class string mappings (931 pairs).

### Changed

- Utilities are back in the main `Tailwind` module (combined `Tailwind.elm`), reversing the v0.2.2 split into `Tailwind.Utilities`. This simplifies imports — use `import Tailwind as Tw` as before.
- Consolidated codegen to a single source of truth (`vite-plugin/codegen.js`). The standalone `codegen/generate.js` is now a thin wrapper.
- The plugin now **requires tailwindcss v4+** and fails with a clear error message if the design system cannot be loaded.

### Fixed

- Missing utility classes like `text-balance`, `text-pretty`, `text-wrap`, `text-nowrap`, and hundreds of other static utilities that were not previously exposed.
- Examples project now correctly references the root package and uses `src/` directory layout.

## [0.2.2] - 2026-03-24

### Fixed

- Fix CSS resolution error when user styles contain relative `@import` paths. The plugin was copying CSS content into `.elm-tailwind/user-styles.css`, breaking relative paths like `@import "./print.css"`. The wrapper now imports the original file directly so all paths resolve naturally.

### Changed

- Moved utility functions to dedicated `Tailwind.Utilities` module, keeping the core `Tailwind` module focused on the `Tailwind` type, `classes`, `batch`, and `raw`.

## [0.2.1] - 2026-03-23

### Fixed

- Changed `postinstall` script to `prepare` so that `elm-tooling install` no longer runs when users install the package — fixes installation failures with yarn and nix-based setups

### Changed

- Updated devDependencies: elm-review 2.13.5, elm-test 0.19.1-revision17, elm-tooling 1.17.0, prettier 3.8.1, vite 7.3.1

## [0.2.0] - 2026-02-23

### Added

- **CLI command `elm-tailwind-classes gen`** - generates Elm modules from your Tailwind config without running a full Vite build. Useful for CI or when Elm compilation needs the generated API before Vite runs (e.g. with elm-pages).

## [0.1.1] - 2026-01-31

### Changed

- Internal refactoring of the elm-review extractor for better performance and maintainability ([#1](https://github.com/dillonkearns/elm-tailwind-classes/pull/1) by [@jfmengels](https://github.com/jfmengels))
  - Uses work-list pattern instead of recursive list concatenation
  - Centralizes class mappings in Dict lookups for single source of truth

## [0.1.0] - 2025-01-31

### Added

- Initial release
- **Vite plugin** that generates type-safe Elm modules from your Tailwind config
- **Static class extraction** via elm-review - analyzes your Elm code to find used classes
- **Parameterized API** for spacing (`Tw.p s4`) and colors (`Tw.bg_color (blue s500)`)
- **Composable variants** with natural nesting: `md [ hover [ Tw.bg_color (blue s600) ] ]`
- **Smart extraction** that handles `List.map`, `case` expressions, `if/else`, and let bindings
- **HMR support** - classes are re-extracted when Elm files change
- **Custom theme support** - your Tailwind config's colors, spacing, etc. are reflected in generated Elm modules
- **Zero config** - just add the Vite plugin and start coding
- Support for `Tw.raw` escape hatch for custom classes

[Unreleased]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.6.2...HEAD
[0.6.2]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.6.1...v0.6.2
[0.6.1]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.6.0...v0.6.1
[0.6.0]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.5.1...v0.6.0
[0.5.1]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.2.2...v0.3.0
[0.2.2]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/dillonkearns/elm-tailwind-classes/releases/tag/v0.1.0
