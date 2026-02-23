#!/usr/bin/env node

// elm-tailwind-classes CLI
// Generate Elm modules from Tailwind config, useful for CI

import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';
import { generateElmModules } from './codegen.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function usage() {
  console.log(`Usage: elm-tailwind-classes <command> [options]

Commands:
  gen    generate Elm modules from Tailwind config,
         useful for CI where you need the generated API
         before Elm compilation

Options:
  --output <dir>    directory for generated Elm modules (default: .elm-tailwind)
  --css <path>      path to CSS file with Tailwind config (auto-detected)
  --debug           enable debug logging
  -h, --help        display help
  -V, --version     display version`);
}

function version() {
  const pkg = JSON.parse(fs.readFileSync(path.resolve(__dirname, '..', 'package.json'), 'utf-8'));
  console.log(pkg.version);
}

// --- Helpers ---

function findCssFiles(dir, depth = 0, maxDepth = 3) {
  const files = [];
  if (depth > maxDepth) return files;

  try {
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    for (const entry of entries) {
      const fullPath = path.join(dir, entry.name);
      if (entry.isDirectory() && !entry.name.startsWith('.') && entry.name !== 'node_modules' && entry.name !== 'elm-stuff') {
        files.push(...findCssFiles(fullPath, depth + 1, maxDepth));
      } else if (entry.isFile() && entry.name.endsWith('.css')) {
        files.push(fullPath);
      }
    }
  } catch (e) {
    // Ignore permission errors etc
  }

  return files;
}

function findCssPath(cwd, cssPathOption) {
  if (cssPathOption) {
    const specified = path.resolve(cwd, cssPathOption);
    if (fs.existsSync(specified)) return specified;
    console.warn(`[elm-tailwind] Specified CSS not found: ${specified}`);
  }

  const candidates = [
    path.join(cwd, 'src', 'styles.css'),
    path.join(cwd, 'src', 'style.css'),
    path.join(cwd, 'src', 'index.css'),
    path.join(cwd, 'styles', 'main.css'),
    path.join(cwd, 'style.css'),
    path.join(cwd, 'styles.css'),
    path.join(cwd, 'app', 'styles.css'),  // elm-pages
  ];

  for (const candidate of candidates) {
    if (fs.existsSync(candidate)) {
      const content = fs.readFileSync(candidate, 'utf-8');
      if (content.includes('@import') && content.includes('tailwindcss')) {
        return candidate;
      }
    }
  }

  const cssFiles = findCssFiles(cwd);
  for (const file of cssFiles) {
    const content = fs.readFileSync(file, 'utf-8');
    if (content.includes('@import') && content.includes('tailwindcss')) {
      return file;
    }
  }

  return null;
}

// --- Main ---

function parseArgs(argv) {
  const args = argv.slice(2);
  const opts = {
    command: null,
    output: '.elm-tailwind',
    css: null,
    debug: false,
  };

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    switch (arg) {
      case '-h':
      case '--help':
        usage();
        process.exit(0);
      case '-V':
      case '--version':
        version();
        process.exit(0);
      case '--output':
        opts.output = args[++i];
        break;
      case '--css':
        opts.css = args[++i];
        break;
      case '--debug':
        opts.debug = true;
        break;
      default:
        if (!arg.startsWith('-') && !opts.command) {
          opts.command = arg;
        } else {
          console.error(`Unknown option: ${arg}`);
          usage();
          process.exit(1);
        }
    }
  }

  return opts;
}

async function runGen(opts) {
  const cwd = process.cwd();
  const generateDir = opts.output;

  function log(...args) {
    if (opts.debug) console.log('[elm-tailwind]', ...args);
  }

  console.log('Generating Elm modules...');

  const cssPath = findCssPath(cwd, opts.css);
  const outputDir = path.resolve(cwd, generateDir);

  if (!cssPath) {
    log('No CSS file with Tailwind import found, using default theme');
    const tempCss = path.join(outputDir, '_temp.css');
    fs.mkdirSync(path.dirname(tempCss), { recursive: true });
    fs.writeFileSync(tempCss, '@import "tailwindcss";');

    const result = await generateElmModules(tempCss, outputDir);
    try { fs.unlinkSync(tempCss); } catch (e) {}

    if (!result.success) {
      console.error('Code generation failed:', result.error);
      process.exit(1);
    }
  } else {
    log('Using CSS file:', cssPath);
    const result = await generateElmModules(cssPath, outputDir);

    if (!result.success) {
      console.error('Code generation failed:', result.error);
      process.exit(1);
    }
  }

  console.log(`  Generated Elm modules to ${generateDir}/`);
  console.log('  - Tailwind.elm');
  console.log('  - Tailwind/Theme.elm');
  console.log('  - Tailwind/Breakpoints.elm');
  console.log('Done!');
}

const opts = parseArgs(process.argv);

if (!opts.command) {
  usage();
  process.exit(1);
}

if (opts.command === 'gen') {
  runGen(opts).catch(e => {
    console.error(e);
    process.exit(1);
  });
} else {
  console.error(`Unknown command: ${opts.command}`);
  usage();
  process.exit(1);
}
