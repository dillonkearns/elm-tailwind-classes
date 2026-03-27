import { defineConfig } from 'cypress'
import fs from 'fs'

export default defineConfig({
  e2e: {
    baseUrl: 'http://localhost:5173',
    supportFile: false,
    specPattern: 'cypress/e2e/**/*.cy.js',
    setupNodeEvents(on) {
      on('task', {
        writeFile({ path, content }) {
          fs.writeFileSync(path, content)
          return null
        },
        readFile({ path }) {
          return fs.readFileSync(path, 'utf-8')
        }
      })
    }
  },
  defaultCommandTimeout: 10000,
})
