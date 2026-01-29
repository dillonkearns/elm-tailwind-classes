// elm-tailwind Vite plugin
// Generates Elm modules from Tailwind config and extracts classes for CSS optimization

import { execSync } from 'child_process';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';
import { generateElmModules } from './codegen.js';

// Get the directory where this plugin is installed
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export function elmTailwind(options = {}) {
  const {
    debug = false,
    elmJson = null,  // Auto-detected if not specified
    generateDir = '.elm-tailwind',  // Where to generate Elm modules
    cssPath = null   // CSS file with Tailwind config (auto-detected)
  } = options;

  let extractedClasses = [];
  let extractTimeout = null;
  let codegenComplete = false;
  let userCssFile = null;  // Track the user's main CSS file

  // Path to the bundled review config (relative to this plugin)
  const bundledReviewConfig = path.resolve(__dirname, '..', 'review');

  function log(...args) {
    if (debug) console.log('[elm-tailwind]', ...args);
  }

  // Find elm-review binary
  function findElmReview(cwd) {
    const localBin = path.join(cwd, 'node_modules', '.bin', 'elm-review');
    if (fs.existsSync(localBin)) {
      return localBin;
    }
    return 'elm-review';
  }

  // Find the user's elm.json
  function findElmJson(cwd) {
    if (elmJson) {
      const specified = path.resolve(cwd, elmJson);
      if (fs.existsSync(specified)) return specified;
      log('Specified elm.json not found:', specified);
    }

    const candidates = [
      path.join(cwd, 'elm.json'),
      path.join(cwd, 'app', 'elm.json'),  // elm-pages v3
    ];

    for (const candidate of candidates) {
      if (fs.existsSync(candidate)) {
        return candidate;
      }
    }

    return null;
  }

  // Find CSS file with Tailwind config
  function findCssPath(cwd) {
    if (cssPath) {
      const specified = path.resolve(cwd, cssPath);
      if (fs.existsSync(specified)) return specified;
      log('Specified CSS not found:', specified);
    }

    // Common locations
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
        // Check if it imports tailwindcss
        const content = fs.readFileSync(candidate, 'utf-8');
        if (content.includes('@import') && content.includes('tailwindcss')) {
          return candidate;
        }
      }
    }

    // Fallback: find any CSS file that imports tailwindcss
    const cssFiles = findCssFiles(cwd);
    for (const file of cssFiles) {
      const content = fs.readFileSync(file, 'utf-8');
      if (content.includes('@import') && content.includes('tailwindcss')) {
        return file;
      }
    }

    return null;
  }

  // Recursively find CSS files (limited depth)
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

  // Clean up elm-review template files that conflict with ReviewConfig
  function cleanElmReviewTemplates(cwd) {
    const templatesDir = path.join(cwd, 'node_modules', 'elm-review', 'init-templates');
    if (fs.existsSync(templatesDir)) {
      try {
        const files = fs.readdirSync(templatesDir);
        for (const file of files) {
          if (file.endsWith('.elm')) {
            fs.unlinkSync(path.join(templatesDir, file));
            log('Removed conflicting template:', file);
          }
        }
      } catch (e) {
        log('Could not clean templates:', e.message);
      }
    }
  }

  // Run code generation
  async function runCodegen(cwd) {
    const css = findCssPath(cwd);
    if (!css) {
      log('No CSS file with Tailwind import found, using default theme');
      // Create a minimal CSS file for default theme
      const tempCss = path.join(cwd, generateDir, '_temp.css');
      fs.mkdirSync(path.dirname(tempCss), { recursive: true });
      fs.writeFileSync(tempCss, '@import "tailwindcss";');

      const outputDir = path.join(cwd, generateDir);
      const result = await generateElmModules(tempCss, outputDir);

      // Clean up temp file
      try { fs.unlinkSync(tempCss); } catch (e) {}

      if (!result.success) {
        console.error('[elm-tailwind] Codegen failed:', result.error);
        return false;
      }

      log('Generated Elm modules to', generateDir);
      return true;
    }

    log('Using CSS file:', css);
    const outputDir = path.join(cwd, generateDir);
    const result = await generateElmModules(css, outputDir);

    if (!result.success) {
      console.error('[elm-tailwind] Codegen failed:', result.error);
      return false;
    }

    log('Generated Elm modules to', generateDir);
    return true;
  }

  // Run extraction
  function runExtraction(cwd) {
    try {
      const elmJsonPath = findElmJson(cwd);
      if (!elmJsonPath) {
        console.warn('[elm-tailwind] Could not find elm.json. Skipping extraction.');
        return [];
      }

      const elmJsonDir = path.dirname(elmJsonPath);
      log('Running elm-review extraction...');
      log('  elm.json:', elmJsonPath);
      log('  review config:', bundledReviewConfig);

      const elmReviewBin = findElmReview(cwd);
      log('  elm-review:', elmReviewBin);

      const output = execSync(
        `"${elmReviewBin}" --extract --report=json --config "${bundledReviewConfig}"`,
        {
          encoding: 'utf-8',
          cwd: elmJsonDir,
          stdio: ['pipe', 'pipe', 'pipe'],
          maxBuffer: 10 * 1024 * 1024,
          shell: true
        }
      );

      const result = JSON.parse(output);
      const classes = result.extracts?.TailwindExtractor?.classes || [];

      log(`Extracted ${classes.length} classes:`, classes.slice(0, 5).join(', ') + (classes.length > 5 ? '...' : ''));

      return classes;
    } catch (e) {
      if (e.stdout) {
        try {
          const result = JSON.parse(e.stdout);
          const classes = result.extracts?.TailwindExtractor?.classes || [];
          if (classes.length > 0) {
            log(`Extracted ${classes.length} classes (with review errors)`);
            return classes;
          }
        } catch {}
      }

      console.error('[elm-tailwind] Could not run elm-review extraction.');
      console.error('  Make sure elm-review is installed: npm install -D elm-review');
      console.error('  Error:', e.message);
      if (debug && e.stderr) console.error('  Stderr:', e.stderr.toString());
      if (debug && e.stdout) console.error('  Stdout (first 500 chars):', e.stdout.toString().slice(0, 500));

      return [];
    }
  }

  return {
    name: 'elm-tailwind',
    enforce: 'pre',  // Run before other plugins like @tailwindcss/vite

    // Run codegen and extraction at build start
    async buildStart() {
      const cwd = process.cwd();

      // Step 1: Generate Elm modules from Tailwind config
      log('Starting code generation...');
      codegenComplete = await runCodegen(cwd);

      if (!codegenComplete) {
        console.warn('[elm-tailwind] Code generation failed, extraction may not work correctly');
      }

      // Step 2: Clean templates and run extraction
      cleanElmReviewTemplates(cwd);
      extractedClasses = runExtraction(cwd);

      // Step 3: Write safelist file for Tailwind to scan
      const safelistPath = path.join(cwd, generateDir, 'safelist.txt');
      // Always write the file (even if empty) so @source doesn't error
      fs.writeFileSync(safelistPath, extractedClasses.join(' '));
      if (extractedClasses.length > 0) {
        log(`Wrote ${extractedClasses.length} classes to ${safelistPath}`);
      }

      // Step 4: Generate wrapper CSS that imports Tailwind + safelist + user's custom styles
      userCssFile = findCssPath(cwd);
      const generatedStylesPath = path.join(cwd, generateDir, 'styles.css');

      let wrapperCss = `/* Generated by elm-tailwind-classes - do not edit */
@import "tailwindcss";
@source "./safelist.txt";
`;

      if (userCssFile) {
        // Read user's CSS and strip the tailwind import to avoid duplication
        let userStyles = fs.readFileSync(userCssFile, 'utf-8');
        userStyles = userStyles
          .replace(/@import\s+["']tailwindcss["'];?\s*/g, '')
          .replace(/@import\s+'tailwindcss';?\s*/g, '')
          .trim();

        if (userStyles) {
          // Write sanitized user styles to a temp file
          const userStylesPath = path.join(cwd, generateDir, 'user-styles.css');
          fs.writeFileSync(userStylesPath, `/* User styles (copied from ${path.basename(userCssFile)}) */\n${userStyles}\n`);
          wrapperCss += `\n@import "./user-styles.css";\n`;
          log('Copied user styles (without tailwind import) to user-styles.css');
        }
      }

      fs.writeFileSync(generatedStylesPath, wrapperCss);
      log('Wrote wrapper CSS to', generatedStylesPath);
    },

    // Redirect CSS imports to our wrapper CSS
    resolveId(id, importer) {
      if (!userCssFile) return null;

      const cssFileName = path.basename(userCssFile);

      // Check if this is an import of the user's CSS file
      if (id === './' + cssFileName || id === cssFileName || id.endsWith('/' + cssFileName)) {
        const wrapperPath = path.join(process.cwd(), generateDir, 'styles.css');
        log('Redirecting CSS import', id, '->', wrapperPath);
        return wrapperPath;
      }

      return null;
    },

    // Intercept HTTP requests - rewrite CSS requests to wrapper (fallback for non-module CSS)
    configureServer(server) {
      log('configureServer called');

      server.middlewares.use((req, res, next) => {
        if (!req.url || !userCssFile) return next();

        const cssFileName = path.basename(userCssFile);

        // Strip query parameters for matching
        const urlPath = req.url.split('?')[0];

        // Check if this request is for the user's CSS file
        if (!urlPath.endsWith('/' + cssFileName) && urlPath !== '/' + cssFileName) {
          return next();
        }

        // Rewrite to our wrapper CSS, preserving query params
        const queryString = req.url.includes('?') ? req.url.substring(req.url.indexOf('?')) : '';
        const newUrl = '/' + generateDir + '/styles.css' + queryString;
        log('Rewriting', req.url, '->', newUrl);
        req.url = newUrl;

        next();
      });
    },

    // HMR: re-extract when Elm files change
    handleHotUpdate({ file, server }) {
      if (!file.endsWith('.elm')) return;

      log('Elm file changed:', path.basename(file));

      clearTimeout(extractTimeout);
      // Short delay to let Elm compile, then extract
      extractTimeout = setTimeout(async () => {
        const cwd = process.cwd();
        cleanElmReviewTemplates(cwd);
        const newClasses = runExtraction(cwd);

        log('Re-extracted classes:', newClasses.length);

        if (JSON.stringify(newClasses) !== JSON.stringify(extractedClasses)) {
          extractedClasses = newClasses;
          log('Classes changed! New classes:', newClasses.join(', '));

          // Update safelist file
          const safelistPath = path.join(cwd, generateDir, 'safelist.txt');
          fs.writeFileSync(safelistPath, extractedClasses.join(' '));
          log('Updated safelist.txt');

          // Update wrapper CSS to trigger Vite's native CSS HMR
          const wrapperPath = path.join(cwd, generateDir, 'styles.css');
          let wrapperContent = fs.readFileSync(wrapperPath, 'utf-8');
          wrapperContent = wrapperContent.replace(
            /\/\* Generated by elm-tailwind-classes[^*]*\*\//,
            `/* Generated by elm-tailwind-classes - ${Date.now()} */`
          );
          fs.writeFileSync(wrapperPath, wrapperContent);
          log('Updated wrapper CSS');

          // Notify Vite's watcher about the change to trigger native CSS HMR
          setTimeout(() => {
            server.watcher.emit('change', wrapperPath);
            log('Triggered Vite CSS HMR');
          }, 100);
        }
      }, 300);
    }
  };
}

export default elmTailwind;
