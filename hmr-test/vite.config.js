import { defineConfig } from 'vite'
import { elmTailwind } from 'elm-tailwind-classes/vite'
import tailwindcss from '@tailwindcss/vite'
import elmPlugin from 'vite-plugin-elm'

export default defineConfig({
  plugins: [
    elmTailwind({ debug: true }),
    tailwindcss(),
    elmPlugin()
  ]
})
