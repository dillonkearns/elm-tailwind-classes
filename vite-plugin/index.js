// elm-tailwind Vite plugin
// Extracts Tailwind classes from Elm code via elm-review and injects them into CSS

import { execSync } from 'child_process';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

export function elmTailwind(options = {}) {
  const {
    reviewConfig = './review',
    debug = false
  } = options;

  let extractedClasses = [];
  let extractTimeout = null;

  function log(...args) {
    if (debug) console.log('[elm-tailwind]', ...args);
  }

  // Find elm-review binary - check node_modules/.bin first
  function findElmReview(cwd) {
    const localBin = path.join(cwd, 'node_modules', '.bin', 'elm-review');
    if (fs.existsSync(localBin)) {
      return localBin;
    }
    // Fall back to PATH
    return 'elm-review';
  }

  // Clean up elm-review template files that conflict with ReviewConfig module names
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

  function runExtraction(cwd) {
    try {
      log('Running elm-review extraction...');

      const elmReviewBin = findElmReview(cwd);
      log('Using elm-review at:', elmReviewBin);

      const output = execSync(
        `"${elmReviewBin}" --extract --report=json --config ${reviewConfig}`,
        {
          encoding: 'utf-8',
          cwd,
          stdio: ['pipe', 'pipe', 'pipe'],
          maxBuffer: 10 * 1024 * 1024, // 10MB for large projects
          shell: true
        }
      );

      const result = JSON.parse(output);
      const classes = result.extracts?.TailwindExtractor?.classes || [];

      log(`Extracted ${classes.length} classes:`, classes.slice(0, 5).join(', ') + (classes.length > 5 ? '...' : ''));

      return classes;
    } catch (e) {
      if (e.stdout) {
        // elm-review ran but may have had errors - try to parse anyway
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
      console.error('  And TailwindExtractor rule is in your review config.');
      console.error('  Error:', e.message);
      if (e.stderr) console.error('  Stderr:', e.stderr.toString());
      if (e.stdout) console.error('  Stdout (first 500 chars):', e.stdout.toString().slice(0, 500));

      return [];
    }
  }

  return {
    name: 'elm-tailwind',

    // Run extraction at build start
    async buildStart() {
      const cwd = process.cwd();
      cleanElmReviewTemplates(cwd);
      extractedClasses = runExtraction(cwd);
    },

    // Inject classes into CSS that imports tailwindcss
    transform(code, id) {
      // Only transform CSS files
      if (!id.endsWith('.css')) return null;

      // Only transform if it imports tailwindcss
      if (!code.includes('@import "tailwindcss"') && !code.includes("@import 'tailwindcss'")) {
        return null;
      }

      if (extractedClasses.length === 0) {
        log('No classes extracted, skipping injection');
        return null;
      }

      log(`Injecting ${extractedClasses.length} classes into ${path.basename(id)}`);

      // Inject @source inline after the tailwindcss import
      const classesString = extractedClasses.join(' ');
      const injection = `@source inline("${classesString}");`;

      const transformed = code
        .replace('@import "tailwindcss"', `@import "tailwindcss";\n${injection}`)
        .replace("@import 'tailwindcss'", `@import 'tailwindcss';\n${injection}`);

      return {
        code: transformed,
        map: null
      };
    },

    // HMR: re-extract when Elm files change
    handleHotUpdate({ file, server }) {
      if (!file.endsWith('.elm')) return;

      log(`Elm file changed: ${path.basename(file)}`);

      // Debounce rapid changes
      clearTimeout(extractTimeout);
      extractTimeout = setTimeout(async () => {
        const newClasses = runExtraction(process.cwd());

        // Only reload if classes changed
        if (JSON.stringify(newClasses) !== JSON.stringify(extractedClasses)) {
          extractedClasses = newClasses;
          log('Classes changed, reloading CSS...');

          // Find and reload CSS modules
          server.moduleGraph.fileToModulesMap.forEach((modules, filePath) => {
            if (filePath.endsWith('.css')) {
              modules.forEach(mod => {
                server.reloadModule(mod);
              });
            }
          });
        }
      }, 150);
    }
  };
}

export default elmTailwind;
