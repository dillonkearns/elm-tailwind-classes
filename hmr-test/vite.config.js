import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';
import elmTailwind from 'elm-tailwind-classes';
import elmPlugin from 'vite-plugin-elm';

export default defineConfig({
  plugins: [
    elmTailwind({ debug: true }),
    tailwindcss(),
    elmPlugin()
  ]
});
