/// <reference types="cypress" />

// Tests that the production build generates correct CSS for all Tailwind patterns.
// Serves the Vite build output and verifies computed styles in the browser.

describe('Production build', () => {
  it('applies parameterized Tailwind colors', () => {
    cy.visit('/')
    cy.contains('HMR Test').should('be.visible')

    // bg-blue-500 is applied (parameterized color: blue s500)
    cy.get('[class*="bg-blue-500"]').should('exist').then(($el) => {
      const bg = window.getComputedStyle($el[0]).backgroundColor
      expect(bg).to.not.equal('rgba(0, 0, 0, 0)')
    })

    // bg-gray-100 is applied (parameterized color: gray s100)
    cy.get('[class*="bg-gray-100"]').should('exist').then(($el) => {
      const bg = window.getComputedStyle($el[0]).backgroundColor
      expect(bg).to.not.equal('rgba(0, 0, 0, 0)')
    })
  })

  it('applies parameterized spacing', () => {
    cy.visit('/')

    // p-4 (parameterized spacing: s4 = 1rem)
    cy.get('[class*="p-4"]').should('exist').then(($el) => {
      const padding = window.getComputedStyle($el[0]).padding
      expect(padding).to.not.equal('0px')
    })

    // mt-8 (parameterized spacing: s8 = 2rem)
    cy.get('[class*="mt-8"]').should('exist').then(($el) => {
      const mt = window.getComputedStyle($el[0]).marginTop
      expect(mt).to.not.equal('0px')
    })
  })

  it('applies static utilities', () => {
    cy.visit('/')

    // rounded-lg (static utility)
    cy.get('[class*="rounded-lg"]').should('exist').then(($el) => {
      const radius = window.getComputedStyle($el[0]).borderRadius
      expect(radius).to.not.equal('0px')
    })

    // font-bold (font weight)
    cy.get('[class*="font-bold"]').should('exist').then(($el) => {
      const weight = window.getComputedStyle($el[0]).fontWeight
      expect(Number(weight)).to.be.greaterThan(400)
    })
  })

  it('applies variant classes', () => {
    cy.visit('/')

    // hover:text-blue-600 — the class attribute should be present
    cy.get('[class*="hover:text-blue-600"]').should('exist')
  })

  it('applies text color from parameterized color', () => {
    cy.visit('/')

    // text-red-500
    cy.get('[class*="text-red-500"]').should('exist').then(($el) => {
      const color = window.getComputedStyle($el[0]).color
      expect(color).to.not.equal('rgba(0, 0, 0, 0)')
      // Should not be black (default)
      expect(color).to.not.equal('rgb(0, 0, 0)')
    })
  })
})
