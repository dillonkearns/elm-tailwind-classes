import { defineConfig } from 'cypress';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig({
  e2e: {
    baseUrl: 'http://localhost:5173',
    supportFile: false,
    specPattern: 'cypress/e2e/**/*.cy.{js,ts}',
    video: false,
    screenshotOnRunFailure: true,
    defaultCommandTimeout: 15000,
    setupNodeEvents(on, config) {
      // Pass project root to tests via env
      config.env.projectRoot = __dirname;

      on('task', {
        writeFile({ filePath, content }) {
          fs.writeFileSync(filePath, content);
          return null;
        },
        readFile(filePath) {
          return fs.readFileSync(filePath, 'utf-8');
        },
      });

      return config;
    },
  },
});
