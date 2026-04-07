import { defineConfig } from 'cypress'
import fs from 'fs'
import path from 'path'
import { execSync } from 'child_process'
import { generateElmModules } from '../vite-plugin/codegen.js'

export default defineConfig({
  e2e: {
    baseUrl: process.env.CYPRESS_BASE_URL === '' ? undefined : (process.env.CYPRESS_BASE_URL || 'http://localhost:5173'),
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
        },
        mkdirp(dir) {
          fs.mkdirSync(dir, { recursive: true })
          return null
        },
        rmrf(dir) {
          fs.rmSync(dir, { recursive: true, force: true })
          return null
        },
        async runGen({ cssPath, cwd }) {
          const outputDir = path.join(cwd, '.elm-tailwind-test-output')
          try {
            fs.mkdirSync(outputDir, { recursive: true })
            const result = await generateElmModules(
              path.resolve(cwd, cssPath),
              outputDir
            )
            fs.rmSync(outputDir, { recursive: true, force: true })
            return result
          } catch (e) {
            fs.rmSync(outputDir, { recursive: true, force: true })
            return { success: false, error: e.message }
          }
        }
      })
    }
  },
  defaultCommandTimeout: 10000,
})
