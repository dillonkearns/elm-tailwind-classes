# Changelog

All notable changes to `elm-tailwind-classes` will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/dillonkearns/elm-tailwind-classes/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/dillonkearns/elm-tailwind-classes/releases/tag/v0.1.0
