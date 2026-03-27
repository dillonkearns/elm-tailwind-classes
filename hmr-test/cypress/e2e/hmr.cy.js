/// <reference types="cypress" />

// Tests that HMR works with Browser.application + elm-tailwind-classes + @tailwindcss/vite.
// Specifically exercises the delayed extraction + CSS HMR update path that previously
// caused full page reloads (safelist.txt write triggered Vite reload).

const APP_ELM = Cypress.config('projectRoot') + '/src/App.elm'

const ORIGINAL = `module App exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, p, text)
import Tailwind as Tw exposing (classes)
import Tailwind.Theme exposing (blue, s4, s500)
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
            , p [] [ text "Version 1" ]
            ]
        ]
    }
`

// Adds rounded_lg + changes text
const MODIFIED = ORIGINAL
  .replace('Tw.bg_color (blue s500) ]', 'Tw.bg_color (blue s500), Tw.rounded_lg ]')
  .replace('Version 1', 'Version 2')

describe('HMR with Browser.application', () => {
  it('preserves state through extraction + CSS HMR cycle', () => {
    cy.visit('/')
    cy.contains('Version 1').should('be.visible')

    // Marker to detect full page reloads — cleared on reload, preserved on HMR
    cy.window().then((win) => { win.__HMR_MARKER = true })

    // Modify Elm source: add new Tailwind class + change text
    cy.task('writeFile', { path: APP_ELM, content: MODIFIED })

    // vite-plugin-elm HMR swaps the Elm app — text and class appear
    cy.contains('Version 2', { timeout: 15000 }).should('be.visible')
    cy.get('[class*="rounded-lg"]').should('exist')

    // Wait for elm-tailwind's delayed extraction cycle to complete.
    // This is 300ms debounce + elm-review extraction + 100ms CSS HMR trigger.
    // The extraction finds new classes, writes them inline into the wrapper CSS,
    // and emits a CSS HMR update. Previously this wrote safelist.txt which
    // triggered a full page reload.
    // eslint-disable-next-line cypress/no-unnecessary-waiting
    cy.wait(10000)

    // After the full cycle: no full page reload occurred
    cy.window().its('__HMR_MARKER').should('eq', true)

    // App still shows updated content
    cy.contains('Version 2').should('be.visible')
    cy.get('[class*="rounded-lg"]').should('exist')
  })

  after(() => {
    cy.task('writeFile', { path: APP_ELM, content: ORIGINAL })
  })
})
