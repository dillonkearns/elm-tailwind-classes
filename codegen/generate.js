// Thin wrapper around vite-plugin/codegen.js — the single source of truth
// for Elm module generation. This script writes the reference copies to src/.
import { generateElmModules } from '../vite-plugin/codegen.js';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const cssPath = path.join(__dirname, 'sample.css');
const outputDir = path.join(__dirname, '..', 'src');

console.log('Generating Elm modules to src/ ...');

const result = await generateElmModules(cssPath, outputDir);

if (result.success) {
  console.log('Done!');
} else {
  console.error('Failed:', result.error);
  process.exit(1);
}
