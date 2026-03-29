/// <reference types="cypress" />

// Tests that HMR works with Browser.application + elm-tailwind-classes + @tailwindcss/vite.
// Verifies: Elm code swap, Tailwind CSS generation for new classes, CSS HMR injection,
// and no full page reload through multiple extraction cycles.

const APP_ELM = Cypress.config('projectRoot') + '/src/App.elm'

const BLUE_VERSION = `module App exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, p, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Theme exposing (blue, red, s4, s500)
import Url

type alias Model = { key : Nav.Key, count : Int }
type Msg = UrlRequested Browser.UrlRequest | UrlChanged Url.Url | NoOp

main : Program () Model Msg
main = Browser.application
    { init = init, view = view, update = update
    , subscriptions = \\_ -> Sub.none
    , onUrlRequest = UrlRequested, onUrlChange = UrlChanged
    }

init _ _ key = ( { key = key, count = 0 }, Cmd.none )

update msg model =
    case msg of
        UrlRequested _ -> ( model, Cmd.none )
        UrlChanged _ -> ( model, Cmd.none )
        NoOp -> ( model, Cmd.none )

view _ =
    { title = "HMR Test"
    , body =
        [ div [ classes [ Tw.p s4, Tw.bg_color (blue s500) ] ]
            [ h1 [ classes [ Tw.text_n3xl, Tw.font_bold ] ] [ text "HMR Test" ]
            , p [] [ text "Blue version" ]
            ]
        ]
    }
`

const RED_VERSION = BLUE_VERSION
  .replace('Tw.bg_color (blue s500)', 'Tw.bg_color (red s500)')
  .replace('Blue version', 'Red version')

describe('HMR with Browser.application', () => {
  beforeEach(() => {
    // Restore base version before each test so tests are independent
    cy.task('writeFile', { path: APP_ELM, content: BLUE_VERSION })
    // Small delay for Vite to pick up the file change
    // eslint-disable-next-line cypress/no-unnecessary-waiting
    cy.wait(500)
  })

  it('survives blue→red→blue round-trip without full page reload', () => {
    cy.visit('/')
    cy.contains('Blue version').should('be.visible')

    // Capture initial blue color
    let blueColor
    cy.get('[class*="bg-blue-500"]').should('exist').then(($el) => {
      blueColor = window.getComputedStyle($el[0]).backgroundColor
      expect(blueColor).to.not.equal('rgba(0, 0, 0, 0)')
    })

    // Set reload marker
    cy.window().then((win) => { win.__HMR_MARKER = true })

    // === First swap: blue → red ===
    cy.task('writeFile', { path: APP_ELM, content: RED_VERSION })

    cy.contains('Red version', { timeout: 15000 }).should('be.visible')
    cy.get('[class*="bg-red-500"]').should('exist').then(($el) => {
      const redColor = window.getComputedStyle($el[0]).backgroundColor
      expect(redColor).to.not.equal('rgba(0, 0, 0, 0)')
      expect(redColor).to.not.equal(blueColor)
    })

    // No extraction wait needed — @source inline() pre-declared all class
    // combinations at startup, so @tailwindcss/vite handles CSS HMR instantly.
    cy.window().its('__HMR_MARKER').should('eq', true)

    // === Second swap: red → blue ===
    cy.task('writeFile', { path: APP_ELM, content: BLUE_VERSION })

    cy.contains('Blue version', { timeout: 15000 }).should('be.visible')
    cy.get('[class*="bg-blue-500"]').should('exist').then(($el) => {
      const bg = window.getComputedStyle($el[0]).backgroundColor
      expect(bg).to.not.equal('rgba(0, 0, 0, 0)')
    })

    // Marker still set after TWO swaps — no full reload at any point
    cy.window().its('__HMR_MARKER').should('eq', true)
    cy.contains('Blue version').should('be.visible')
  })

  it('applies a new static utility added during HMR (not in initial safelist)', () => {
    cy.visit('/')
    cy.contains('Blue version').should('be.visible')
    cy.window().then((win) => { win.__HMR_MARKER = true })

    // Add Tw.italic — a static utility not used at startup, so it's not in
    // the initial safelist or @source inline(). Tailwind's JS scanner must
    // find 'italic' in the compiled output for this to work.
    const WITH_ITALIC = BLUE_VERSION
      .replace('Tw.font_bold', 'Tw.font_bold, Tw.italic')
      .replace('Blue version', 'Italic version')

    cy.task('writeFile', { path: APP_ELM, content: WITH_ITALIC })

    cy.contains('Italic version', { timeout: 15000 }).should('be.visible')
    cy.get('[class*="italic"]').should('exist')

    // Verify font-style is actually italic (CSS applied, not just class attr)
    cy.get('[class*="italic"]').then(($el) => {
      const fontStyle = window.getComputedStyle($el[0]).fontStyle
      expect(fontStyle).to.equal('italic')
    })

    cy.window().its('__HMR_MARKER').should('eq', true)
  })

  it('applies hover variant on a new parameterized color via HMR', () => {
    cy.visit('/')
    cy.contains('Blue version').should('be.visible')
    cy.window().then((win) => { win.__HMR_MARKER = true })

    // Add hover:bg-red-500 (variant + parameterized color, not in initial safelist)
    const HOVER_VERSION = BLUE_VERSION
      .replace(
        'Tw.bg_color (blue s500) ]',
        'Tw.bg_color (blue s500), Tw.rounded_lg ]\n            , Tw.text_n3xl\n            ]'
      )
      .replace(
        "[ h1 [ classes [ Tw.text_n3xl, Tw.font_bold ] ] [ text \"HMR Test\" ]",
        "[ h1 [ classes [ Tw.text_n3xl, Tw.font_bold ] ] [ text \"Hover Test\" ]"
      )
      // Simpler: just add hover variant to the imports and view
      .replace('Tailwind.Theme exposing (blue, red, s4, s500)',
               'Tailwind.Theme exposing (blue, red, s4, s500)')

    // Use a dedicated version with hover variant
    const WITH_HOVER = `module App exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, p, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Breakpoints exposing (hover)
import Tailwind.Theme exposing (blue, red, s4, s500)
import Url

type alias Model = { key : Nav.Key, count : Int }
type Msg = UrlRequested Browser.UrlRequest | UrlChanged Url.Url | NoOp

main : Program () Model Msg
main = Browser.application
    { init = init, view = view, update = update
    , subscriptions = \\_ -> Sub.none
    , onUrlRequest = UrlRequested, onUrlChange = UrlChanged
    }

init _ _ key = ( { key = key, count = 0 }, Cmd.none )

update msg model =
    case msg of
        UrlRequested _ -> ( model, Cmd.none )
        UrlChanged _ -> ( model, Cmd.none )
        NoOp -> ( model, Cmd.none )

view _ =
    { title = "HMR Test"
    , body =
        [ div
            [ classes
                [ Tw.p s4
                , Tw.bg_color (blue s500)
                , hover [ Tw.bg_color (red s500) ]
                ]
            ]
            [ h1 [ classes [ Tw.text_n3xl, Tw.font_bold ] ] [ text "Hover Test" ]
            , p [] [ text "Has hover variant" ]
            ]
        ]
    }
`

    cy.task('writeFile', { path: APP_ELM, content: WITH_HOVER })

    cy.contains('Hover Test', { timeout: 15000 }).should('be.visible')

    // The hover:bg-red-500 class should be in the DOM
    cy.get('[class*="hover:bg-red-500"]').should('exist')

    // Verify the CSS rule exists in the stylesheet — check that
    // a stylesheet contains a rule matching hover\:bg-red-500
    cy.document().then((doc) => {
      let found = false
      for (const sheet of doc.styleSheets) {
        try {
          for (const rule of sheet.cssRules) {
            if (rule.cssText && rule.cssText.includes('bg-red-500') && rule.cssText.includes('hover')) {
              found = true
              break
            }
          }
        } catch (e) {
          // Cross-origin stylesheet, skip
        }
        if (found) break
      }
      expect(found, 'hover:bg-red-500 CSS rule exists in stylesheet').to.be.true
    })

    // No full page reload
    cy.window().its('__HMR_MARKER').should('eq', true)
  })

  it('applies breakpoint variant on a new parameterized color added during HMR', () => {
    cy.visit('/')
    cy.contains('Blue version').should('be.visible')
    cy.window().then((win) => { win.__HMR_MARKER = true })

    // Add md:bg-green-300 — a breakpoint variant on a parameterized color
    // that wasn't used at startup. Green is not in the initial safelist,
    // so it must come from @source inline(). The md: variant must be
    // applied automatically by Tailwind on top of the @source inline class.
    const WITH_MD_GREEN = `module App exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, p, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Breakpoints exposing (md)
import Tailwind.Theme exposing (blue, green, s4, s300, s500)
import Url

type alias Model = { key : Nav.Key, count : Int }
type Msg = UrlRequested Browser.UrlRequest | UrlChanged Url.Url | NoOp

main : Program () Model Msg
main = Browser.application
    { init = init, view = view, update = update
    , subscriptions = \\_ -> Sub.none
    , onUrlRequest = UrlRequested, onUrlChange = UrlChanged
    }

init _ _ key = ( { key = key, count = 0 }, Cmd.none )

update msg model =
    case msg of
        UrlRequested _ -> ( model, Cmd.none )
        UrlChanged _ -> ( model, Cmd.none )
        NoOp -> ( model, Cmd.none )

view _ =
    { title = "HMR Test"
    , body =
        [ div
            [ classes
                [ Tw.p s4
                , Tw.bg_color (blue s500)
                , md [ Tw.bg_color (green s300) ]
                ]
            ]
            [ h1 [ classes [ Tw.text_n3xl, Tw.font_bold ] ] [ text "Breakpoint Test" ]
            , p [] [ text "Has md:bg-green-300" ]
            ]
        ]
    }
`

    cy.task('writeFile', { path: APP_ELM, content: WITH_MD_GREEN })

    cy.contains('Breakpoint Test', { timeout: 15000 }).should('be.visible')

    // The md:bg-green-300 class should be in the DOM
    cy.get('[class*="md:bg-green-300"]').should('exist')

    // Verify the CSS rule exists in the stylesheet with a media query
    cy.document().then((doc) => {
      let found = false
      for (const sheet of doc.styleSheets) {
        try {
          for (const rule of sheet.cssRules) {
            // @media rules contain nested rules
            if (rule.cssRules) {
              for (const nested of rule.cssRules) {
                if (nested.cssText && nested.cssText.includes('bg-green-300')) {
                  found = true
                  break
                }
              }
            }
            if (found) break
          }
        } catch (e) { /* cross-origin */ }
        if (found) break
      }
      expect(found, 'md:bg-green-300 CSS rule exists inside a @media query').to.be.true
    })

    cy.window().its('__HMR_MARKER').should('eq', true)
  })

  after(() => {
    // Restore committed version (which has all patterns for the build test)
    cy.task('gitRestore', { path: APP_ELM })
  })
})
