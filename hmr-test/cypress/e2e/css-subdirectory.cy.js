/// <reference types="cypress" />

// Regression test: CSS files in subdirectories with relative @import paths
// should resolve imports relative to the CSS file, not the working directory.
//
// Bug: When styles.css lives in css/styles.css and contains @import "print.css",
// the tool looked for print.css in the project root instead of css/print.css.

describe('CSS in subdirectory with relative @import', () => {
  const projectRoot = Cypress.config('projectRoot')
  const cssDir = projectRoot + '/css'
  const cssFile = cssDir + '/styles.css'
  const printFile = cssDir + '/print.css'

  it('resolves relative @import paths from the CSS file directory, not CWD', () => {
    // Set up: create css/ subdirectory with styles.css that imports a sibling
    cy.task('mkdirp', cssDir)
    cy.task('writeFile', {
      path: cssFile,
      content: '@import "tailwindcss";\n@import "print.css";\n'
    })
    cy.task('writeFile', {
      path: printFile,
      content: '@media print { .no-print { display: none; } }\n'
    })

    // Run the CLI gen command pointing at the subdirectory CSS file.
    // This should succeed — the @import "print.css" should resolve to
    // css/print.css (relative to the CSS file), not ./print.css (CWD).
    cy.task('runGen', { cssPath: 'css/styles.css', cwd: projectRoot }).then((result) => {
      expect(result.success, `gen should succeed but got: ${result.error || ''}`).to.be.true
    })
  })

  after(() => {
    // Clean up the temporary css/ subdirectory
    cy.task('rmrf', cssDir)
  })
})
