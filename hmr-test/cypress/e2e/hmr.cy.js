// HMR test for elm-tailwind-classes Vite plugin
//
// Tests that:
// 1. Initial page renders with correct Tailwind CSS styles
// 2. Modifying an Elm file triggers HMR (not a full page reload)
// 3. New Tailwind classes added in Elm are extracted and applied via CSS HMR

// The original App.elm content (blue s500 background on the inner div)
const ORIGINAL_APP_ELM = `module App exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (id)
import Tailwind as Tw exposing (classes)
import Tailwind.Theme exposing (blue, gray, s4, s8, s100, s500, s800, s900)


main : Html msg
main =
    div
        [ classes
            [ Tw.p s8
            , Tw.bg_color (gray s100)
            ]
        ]
        [ div
            [ classes
                [ Tw.text_n2xl
                , Tw.font_bold
                , Tw.text_color (gray s900)
                ]
            ]
            [ text "HMR Test" ]
        , div
            [ id "test-target"
            , classes
                [ Tw.p s4
                , Tw.bg_color (blue s500)
                , Tw.text_color (gray s100)
                , Tw.rounded_lg
                ]
            ]
            [ text "Hello from Elm" ]
        ]
`;

// Modified App.elm: changes bg from blue s500 to red s500 (a completely new color
// family not present in the initial extraction — tests the full CSS HMR pipeline)
const MODIFIED_APP_ELM = `module App exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (id)
import Tailwind as Tw exposing (classes)
import Tailwind.Theme exposing (blue, gray, red, s4, s8, s100, s500, s800, s900)


main : Html msg
main =
    div
        [ classes
            [ Tw.p s8
            , Tw.bg_color (gray s100)
            ]
        ]
        [ div
            [ classes
                [ Tw.text_n2xl
                , Tw.font_bold
                , Tw.text_color (gray s900)
                ]
            ]
            [ text "HMR Test" ]
        , div
            [ id "test-target"
            , classes
                [ Tw.p s4
                , Tw.bg_color (red s500)
                , Tw.text_color (gray s100)
                , Tw.rounded_lg
                , Tw.font_bold
                ]
            ]
            [ text "Hello from Elm - UPDATED" ]
        ]
`;

function appElmPath() {
  return Cypress.env('projectRoot') + '/App.elm';
}

// Tailwind v4 uses oklch. These are the expected computed colors.
// blue-500: oklch(0.623 0.214 259.815)
// red-500:  oklch(0.637 0.237 25.331)
const BLUE_500 = 'oklch(0.623 0.214 259.815)';
const RED_500 = 'oklch(0.637 0.237 25.331)';

describe('Elm + Tailwind HMR', () => {
  before(() => {
    // Ensure we start from a clean state
    cy.task('writeFile', {
      filePath: appElmPath(),
      content: ORIGINAL_APP_ELM,
    });
    // Wait for Vite to recompile from the clean state
    cy.wait(5000);
  });

  afterEach(() => {
    cy.task('writeFile', {
      filePath: appElmPath(),
      content: ORIGINAL_APP_ELM,
    });
    cy.wait(3000);
  });

  it('renders initial page with Tailwind styles applied', () => {
    cy.visit('/');

    cy.contains('HMR Test').should('be.visible');

    // The #test-target div has bg-blue-500 - verify the CSS is applied
    cy.get('#test-target')
      .should('be.visible')
      .and('contain.text', 'Hello from Elm')
      .and('have.css', 'background-color', BLUE_500);
  });

  it('HMR updates styles when Elm file changes without full page reload', () => {
    cy.visit('/');

    // Verify initial state: blue-500 background
    cy.get('#test-target')
      .should('have.css', 'background-color', BLUE_500);

    // Set a window marker to detect full page reload
    cy.window().then((win) => {
      win.__HMR_TEST_MARKER = true;
    });

    // Modify the Elm file on disk
    cy.task('writeFile', {
      filePath: appElmPath(),
      content: MODIFIED_APP_ELM,
    });

    // Wait for Elm HMR: text should change
    cy.get('#test-target', { timeout: 30000 })
      .should('contain.text', 'Hello from Elm - UPDATED');

    // Verify it was HMR, not a full reload
    cy.window().its('__HMR_TEST_MARKER').should('equal', true);

    // THE KEY ASSERTION: Tailwind CSS should have updated via HMR
    // bg-red-500 is a completely new color family not in the initial extraction.
    // For this to work, the full pipeline must execute:
    //   elm change -> re-extract -> update safelist -> regenerate CSS -> CSS HMR
    cy.get('#test-target')
      .should('have.css', 'background-color', RED_500);
  });
});
