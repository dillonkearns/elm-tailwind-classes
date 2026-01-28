// Explore the tailwind-resolver output to understand what theme values are available
import { resolveTheme } from 'tailwind-resolver';
import fs from 'fs';

async function exploreTheme() {
  try {
    const result = await resolveTheme({
      input: './sample.css'
    });

    const theme = result.variants?.default;

    // Write full result to a file for inspection
    fs.writeFileSync('theme-output.json', JSON.stringify(result, null, 2));

    console.log('Theme output written to theme-output.json');
    console.log('\nTop-level result keys:', Object.keys(result));

    // Explore variants if they exist
    if (result.variants) {
      console.log('\nVariant keys:', Object.keys(result.variants));
    }

    if (theme) {
      console.log('\nDefault theme keys:', Object.keys(theme));

      // Look for colors
      if (theme.colors) {
        console.log('\nColor keys (first 20):', Object.keys(theme.colors).slice(0, 20));
        // Show one color example
        const firstColorKey = Object.keys(theme.colors)[0];
        console.log(`Example color (${firstColorKey}):`, theme.colors[firstColorKey]);
      }

      // Look for spacing
      if (theme.spacing) {
        console.log('\nSpacing keys:', Object.keys(theme.spacing));
        // Show all spacing values
        console.log('Spacing values:', theme.spacing);
      }

      // Look for breakpoints
      if (theme.breakpoints) {
        console.log('\nBreakpoint keys:', Object.keys(theme.breakpoints));
        console.log('Breakpoints:', theme.breakpoints);
      }

      // Look for font sizes
      if (theme.fontSize) {
        console.log('\nFont size keys:', Object.keys(theme.fontSize));
      }
    }

  } catch (error) {
    console.error('Error resolving theme:', error);
    console.error('Stack:', error.stack);
  }
}

exploreTheme();
