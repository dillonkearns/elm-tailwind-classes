import { defineConfig } from 'cypress'
import fs from 'fs'
import { execSync } from 'child_process'

export default defineConfig({
  e2e: {
    baseUrl: process.env.CYPRESS_BASE_URL || 'http://localhost:5173',
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
        },
        gitRestore({ path }) {
          execSync(`git checkout -- "${path}"`)
          return null
        }
      })
    }
  },
  defaultCommandTimeout: 10000,
})
