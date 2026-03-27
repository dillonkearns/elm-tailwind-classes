/// <reference types="cypress" />

// Tests that HMR works with Browser.application + elm-tailwind-classes + @tailwindcss/vite.
// Verifies: Elm code swap, Tailwind CSS generation for new classes, CSS HMR injection,
// and no full page reload through the extraction cycle.

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

// Swaps blue → red background color
const RED_VERSION = BLUE_VERSION
  .replace('Tw.bg_color (blue s500)', 'Tw.bg_color (red s500)')
  .replace('Blue version', 'Red version')

describe('HMR with Browser.application', () => {
  it('swaps Tailwind color and applies new CSS without full reload', () => {
    cy.visit('/')
    cy.contains('Blue version').should('be.visible')

    // Verify initial blue background is applied.
    // Store the computed color to compare after swap (Tailwind v4 uses oklch).
    let blueColor
    cy.get('[class*="bg-blue-500"]').should('exist').then(($el) => {
      blueColor = window.getComputedStyle($el[0]).backgroundColor
      // Should be some non-transparent color
      expect(blueColor).to.not.equal('rgba(0, 0, 0, 0)')
    })

    // Marker to detect full page reloads
    cy.window().then((win) => { win.__HMR_MARKER = true })

    // Swap blue → red
    cy.task('writeFile', { path: APP_ELM, content: RED_VERSION })

    // Elm HMR swaps the view — new text and class appear
    cy.contains('Red version', { timeout: 15000 }).should('be.visible')
    cy.get('[class*="bg-red-500"]').should('exist')

    // Tailwind generates CSS for bg-red-500 and it's applied via CSS HMR.
    // The background color should be different from the original blue.
    cy.get('[class*="bg-red-500"]').then(($el) => {
      const redColor = window.getComputedStyle($el[0]).backgroundColor
      expect(redColor).to.not.equal('rgba(0, 0, 0, 0)')
      expect(redColor).to.not.equal(blueColor)
    })

    // Wait for elm-tailwind's delayed extraction + CSS HMR cycle
    // (300ms debounce + elm-review extraction + CSS update).
    // This is the path that previously triggered a full page reload.
    // eslint-disable-next-line cypress/no-unnecessary-waiting
    cy.wait(10000)

    // After the full cycle: no full page reload, color still red (not blue)
    cy.window().its('__HMR_MARKER').should('eq', true)
    cy.contains('Red version').should('be.visible')
    cy.get('[class*="bg-red-500"]').then(($el) => {
      const redColor = window.getComputedStyle($el[0]).backgroundColor
      expect(redColor).to.not.equal('rgba(0, 0, 0, 0)')
      expect(redColor).to.not.equal(blueColor)
    })
  })

  after(() => {
    cy.task('writeFile', { path: APP_ELM, content: BLUE_VERSION })
  })
})
