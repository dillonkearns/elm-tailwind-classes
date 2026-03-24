# Changelog

All notable changes to `elm-tailwind-classes` will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.2.2...HEAD
[0.2.2]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/dillonkearns/elm-tailwind-classes/releases/tag/v0.1.0
