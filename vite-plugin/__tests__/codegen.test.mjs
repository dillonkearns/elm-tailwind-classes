// Codegen tests covering custom @theme color shapes that don't fit the
// "name-shade" convention assumed by Tailwind's defaults. Originally written
// to drive the fix for: multi-segment custom colors collapsing into a single
// useless function in Tailwind/Theme.elm.

import path from 'path';
import fs from 'fs';
import os from 'os';
import assert from 'node:assert/strict';
import test from 'node:test';
import { fileURLToPath } from 'url';
import { generateElmModules } from '../codegen.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// generateElmModules() loads Tailwind's design system via createRequire from
// the CSS file's directory. Use golden/ as the CSS base — it has tailwindcss
// installed for the existing build/snapshot tests, so the resolver can find
// the default theme variables (red, blue, etc.).
const baseDir = path.resolve(__dirname, '..', '..', 'golden');
const outDir = fs.mkdtempSync(path.join(os.tmpdir(), 'elm-tailwind-codegen-'));
fs.mkdirSync(path.join(outDir, 'Tailwind'), { recursive: true });

async function generateFor(cssBody, label) {
  const cssPath = path.join(baseDir, `__codegen_test_${label}.css`);
  fs.writeFileSync(cssPath, cssBody);
  let result;
  try {
    result = await generateElmModules(cssPath, outDir);
  } finally {
    fs.unlinkSync(cssPath);
  }
  if (!result.success) throw new Error(`codegen failed: ${result.error}`);
  return {
    theme: fs.readFileSync(path.join(outDir, 'Tailwind', 'Theme.elm'), 'utf8'),
    main: fs.readFileSync(path.join(outDir, 'Tailwind.elm'), 'utf8'),
  };
}

test('flat multi-segment shaded colors expose every distinct variable', async () => {
  const { theme } = await generateFor(`
@import 'tailwindcss';
@theme {
  --color-brand-palette-primary-0: #000000;
  --color-brand-palette-primary-14: #5a1019;
  --color-brand-palette-primary-92: #fac9d0;
  --color-brand-palette-primary-variation-40: #cc4458;
  --color-brand-palette-accent-40: #4040d4;
}
`, 'flat-shaded');

  const leafCases = [
    ['brand_palette_primary_0', 'brand-palette-primary-0'],
    ['brand_palette_primary_14', 'brand-palette-primary-14'],
    ['brand_palette_primary_92', 'brand-palette-primary-92'],
    ['brand_palette_primary_variation_40', 'brand-palette-primary-variation-40'],
    ['brand_palette_accent_40', 'brand-palette-accent-40'],
  ];

  for (const [elmName, suffix] of leafCases) {
    assert.match(theme, new RegExp(`^${elmName}\\s*:`, 'm'),
      `expected ${elmName} : ... in Theme.elm`);
    assert.ok(theme.includes(`"${suffix}"`),
      `expected ${elmName} to map to the literal "${suffix}"`);
  }

  assert.doesNotMatch(theme, /^brand\s*:\s*Shade\s*->\s*Color/m,
    'should not collapse multi-segment colors into a single `brand` shade function');
});

test('semantic (no-shade) multi-segment colors expose as identifiers', async () => {
  const { theme } = await generateFor(`
@import 'tailwindcss';
@theme {
  --color-brand-palette-primary-14: #5a1019;
  --color-brand-specific-primary: var(--color-brand-palette-primary-14);
  --color-brand-specific-on-primary: #fef0f2;
  --color-navigation-header-background: #5a1019;
}
`, 'semantic');

  for (const [name, suffix] of [
    ['brand_specific_primary', 'brand-specific-primary'],
    ['brand_specific_on_primary', 'brand-specific-on-primary'],
    ['navigation_header_background', 'navigation-header-background'],
  ]) {
    assert.match(theme, new RegExp(`^${name}\\s*:`, 'm'), `${name} missing`);
    assert.ok(theme.includes(`"${suffix}"`),
      `${name} should produce class suffix ${suffix}`);
  }
});

test('a path that has both a value and children (DEFAULT + extensions)', async () => {
  const { theme } = await generateFor(`
@import 'tailwindcss';
@theme {
  --color-brand-specific-primary: #5a1019;
  --color-brand-specific-primary-container: #fac9d0;
  --color-brand-specific-primary-variation: #cc4458;
}
`, 'default-plus-children');

  for (const [name, suffix] of [
    ['brand_specific_primary', 'brand-specific-primary'],
    ['brand_specific_primary_container', 'brand-specific-primary-container'],
    ['brand_specific_primary_variation', 'brand-specific-primary-variation'],
  ]) {
    assert.match(theme, new RegExp(`^${name}\\s*:`, 'm'), `${name} missing`);
    assert.ok(theme.includes(`"${suffix}"`), `${name} should produce ${suffix}`);
  }
});

test('standard top-level shaded colors keep parameterized API (regression guard)', async () => {
  const { theme } = await generateFor(`
@import 'tailwindcss';
@theme {
  --color-brand-palette-primary-14: #5a1019;
  --color-brand-specific-primary: #5a1019;
}
`, 'standard-untouched');

  assert.match(theme, /^blue\s*:\s*Shade\s*->\s*Color/m,
    '`blue : Shade -> Color` must remain (do not regress standard colors)');
  assert.match(theme, /^red\s*:\s*Shade\s*->\s*Color/m);
  assert.match(theme, /^gray\s*:\s*Shade\s*->\s*Color/m);

  assert.match(theme, /^black\s*:\s*SimpleColor/m);
  assert.match(theme, /^white\s*:\s*SimpleColor/m);
});

test('custom multi-segment colors are SimpleColor values', async () => {
  const { theme } = await generateFor(`
@import 'tailwindcss';
@theme {
  --color-brand-specific-primary: #5a1019;
}
`, 'simplecolor-shape');

  assert.match(theme, /^brand_specific_primary\s*:\s*SimpleColor/m,
    'multi-segment custom colors should be generated as SimpleColor values');
});

test('full bug-report CSS round-trips: every CSS variable has an Elm name', async () => {
  // The exact pattern from the bug report (message (4).txt).
  const css = `
@import 'tailwindcss';
@theme {
  --color-brand-palette-primary-0: #000000;
  --color-brand-palette-primary-5: #160407;
  --color-brand-palette-primary-6: #29070d;
  --color-brand-palette-primary-7: #2e080e;
  --color-brand-palette-primary-14: #5a1019;
  --color-brand-palette-primary-20: #7a1622;
  --color-brand-palette-primary-28: #a61e2f;
  --color-brand-palette-primary-40: #d4263c;
  --color-brand-palette-primary-92: #fac9d0;
  --color-brand-palette-primary-96: #fde0e3;
  --color-brand-palette-primary-98: #fef0f2;
  --color-brand-palette-primary-variation-40: #cc4458;
  --color-brand-palette-primary-variation-92: #f5c8d2;
  --color-brand-palette-primary-variation-95: #f9d8df;
  --color-brand-palette-primary-variation-96: #fae0e6;
  --color-brand-palette-accent-40: #4040d4;
  --color-brand-palette-accent-60: #8080f0;
  --color-universal-karnov-50: #777777;
  --color-universal-karnov-87: #cccccc;
  --color-brand-specific-primary: var(--color-brand-palette-primary-14);
  --color-brand-specific-on-primary: var(--color-brand-palette-primary-98);
  --color-brand-specific-primary-container: var(--color-brand-palette-primary-92);
  --color-brand-specific-on-primary-container: var(--color-brand-palette-primary-20);
  --color-brand-specific-primary-variation: var(--color-brand-palette-primary-variation-40);
  --color-brand-specific-on-primary-variation: var(--color-brand-palette-primary-96);
  --color-brand-specific-accent: var(--color-brand-palette-accent-40);
  --color-brand-specific-karnov: var(--color-universal-karnov-87);
  --color-navigation-header-background: var(--color-brand-palette-primary-14);
}
`;
  const { theme } = await generateFor(css, 'bug-report-full');

  // Every distinct --color-... variable should map to a string literal in
  // the generated module.
  const expected = [
    'brand-palette-primary-0', 'brand-palette-primary-5', 'brand-palette-primary-6',
    'brand-palette-primary-7', 'brand-palette-primary-14', 'brand-palette-primary-20',
    'brand-palette-primary-28', 'brand-palette-primary-40', 'brand-palette-primary-92',
    'brand-palette-primary-96', 'brand-palette-primary-98',
    'brand-palette-primary-variation-40', 'brand-palette-primary-variation-92',
    'brand-palette-primary-variation-95', 'brand-palette-primary-variation-96',
    'brand-palette-accent-40', 'brand-palette-accent-60',
    'universal-karnov-50', 'universal-karnov-87',
    'brand-specific-primary', 'brand-specific-on-primary',
    'brand-specific-primary-container', 'brand-specific-on-primary-container',
    'brand-specific-primary-variation', 'brand-specific-on-primary-variation',
    'brand-specific-accent', 'brand-specific-karnov',
    'navigation-header-background',
  ];

  const missing = expected.filter(s => !theme.includes(`"${s}"`));
  assert.deepEqual(missing, [],
    `These CSS color variables have no generated Elm name: ${JSON.stringify(missing)}`);
});

test('compiled Elm Theme module is well-formed (no duplicate definitions)', async () => {
  const { theme } = await generateFor(`
@import 'tailwindcss';
@theme {
  --color-brand-palette-primary-14: #5a1019;
  --color-brand-specific-primary: #5a1019;
  --color-brand-specific-primary-container: #fac9d0;
}
`, 'no-duplicates');

  // Find every top-level definition and ensure no name appears twice.
  const defs = [...theme.matchAll(/^([a-z][a-zA-Z0-9_]*)\s*:/gm)].map(m => m[1]);
  const dupes = defs.filter((n, i) => defs.indexOf(n) !== i);
  assert.deepEqual([...new Set(dupes)], [],
    `Theme.elm has duplicate definitions: ${JSON.stringify([...new Set(dupes)])}`);
});
