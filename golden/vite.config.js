import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';
import { elmTailwind } from 'elm-tailwind-vite';
import elmPlugin from 'vite-plugin-elm';

export default defineConfig({
  plugins: [
    // Our plugin - extracts classes from Elm and injects into CSS
    elmTailwind({
      reviewConfig: '../review',
      debug: false
    }),

    // Tailwind CSS
    tailwindcss(),

    // Elm compilation
    elmPlugin()
  ],
  build: {
    outDir: 'dist',
    emptyDirBeforeWrite: true
  }
});
