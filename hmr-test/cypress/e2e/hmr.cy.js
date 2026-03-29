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

  after(() => {
    // Restore committed version (which has all patterns for the build test)
    cy.task('gitRestore', { path: APP_ELM })
  })
})
