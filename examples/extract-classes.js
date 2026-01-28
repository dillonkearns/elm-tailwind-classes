#!/usr/bin/env node
// Extract Tailwind classes from Elm code and write to a safelist file
import { execSync } from 'child_process';
import fs from 'fs';

const output = execSync('cd /Users/dillonkearns/src/github.com/dillonkearns/elm-tailwind-classes/examples && elm-review --extract --report=json --config ../review 2>/dev/null', { encoding: 'utf-8' });

const result = JSON.parse(output);
const classes = result.extracts?.TailwindExtractor?.classes || [];

console.log(`Extracted ${classes.length} Tailwind classes:`);
classes.forEach(c => console.log(`  ${c}`));

// Write to safelist file for Tailwind
const safelistContent = classes.join('\n');
fs.writeFileSync('tailwind-safelist.txt', safelistContent);
console.log('\nWritten to tailwind-safelist.txt');

// Also create a JS export for @source
const jsContent = `// Auto-generated Tailwind safelist
export const classes = ${JSON.stringify(classes.join(' '))};
`;
fs.writeFileSync('tailwind-safelist.js', jsContent);
console.log('Written to tailwind-safelist.js');
