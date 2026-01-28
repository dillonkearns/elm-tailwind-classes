module TailwindExtractorTest exposing (all)

import Review.Project as Project
import Review.Test
import Review.Test.Dependencies
import TailwindExtractor
import Test exposing (Test, describe, test)


all : Test
all =
    describe "TailwindExtractor"
        [ simpleConstantsTests
        , parameterizedSpacingTests
        , parameterizedColorTests
        , simpleColorTests
        ]


simpleConstantsTests : Test
simpleConstantsTests =
    describe "simple constants"
        [ test "extracts flex" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw

view = Tw.flex
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["flex"]}"""
        , test "extracts items_center as items-center" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw

view = Tw.items_center
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["items-center"]}"""
        , test "extracts text_n2xl as text-2xl" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw

view = Tw.text_n2xl
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["text-2xl"]}"""
        ]


parameterizedSpacingTests : Test
parameterizedSpacingTests =
    describe "parameterized spacing"
        [ test "extracts p Theme.s4 as p-4" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.p Theme.s4
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["p-4"]}"""
        , test "extracts m Theme.s0_dot_5 as m-0.5" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.m Theme.s0_dot_5
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["m-0.5"]}"""
        , test "extracts gap Theme.s8 as gap-8" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.gap Theme.s8
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["gap-8"]}"""
        ]


parameterizedColorTests : Test
parameterizedColorTests =
    describe "parameterized colors (two arguments)"
        [ test "extracts bg_color blue s500 as bg-blue-500" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.bg_color Theme.blue Theme.s500
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["bg-blue-500"]}"""
        , test "extracts text_color gray s800 as text-gray-800" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.text_color Theme.gray Theme.s800
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["text-gray-800"]}"""
        ]


simpleColorTests : Test
simpleColorTests =
    describe "simple colors (one argument)"
        [ test "extracts text_simple white as text-white" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.text_simple Theme.white
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["text-white"]}"""
        , test "extracts bg_simple black as bg-black" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.bg_simple Theme.black
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["bg-black"]}"""
        ]


{-| Project with stub Tailwind modules for testing.
-}
projectWithTailwind : Project.Project
projectWithTailwind =
    Review.Test.Dependencies.projectWithElmCore
        |> Project.addModule
            { path = "src/Tailwind/Utilities.elm"
            , source = tailwindUtilitiesStub
            }
        |> Project.addModule
            { path = "src/Tailwind/Theme.elm"
            , source = tailwindThemeStub
            }


tailwindUtilitiesStub : String
tailwindUtilitiesStub =
    """module Tailwind.Utilities exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (class)
import Tailwind.Theme exposing (Color(..), Shade(..), SimpleColor(..), Spacing(..))

flex : Attribute msg
flex = class "flex"

items_center : Attribute msg
items_center = class "items-center"

text_n2xl : Attribute msg
text_n2xl = class "text-2xl"

p : Spacing -> Attribute msg
p _ = class ""

m : Spacing -> Attribute msg
m _ = class ""

gap : Spacing -> Attribute msg
gap _ = class ""

bg_color : Color -> Shade -> Attribute msg
bg_color _ _ = class ""

text_color : Color -> Shade -> Attribute msg
text_color _ _ = class ""

bg_simple : SimpleColor -> Attribute msg
bg_simple _ = class ""

text_simple : SimpleColor -> Attribute msg
text_simple _ = class ""
"""


tailwindThemeStub : String
tailwindThemeStub =
    """module Tailwind.Theme exposing (..)

type Spacing = S0 | S4 | S8 | S0_dot_5

s0 : Spacing
s0 = S0

s4 : Spacing
s4 = S4

s8 : Spacing
s8 = S8

s0_dot_5 : Spacing
s0_dot_5 = S0_dot_5

type Color = Blue | Gray | Red

blue : Color
blue = Blue

gray : Color
gray = Gray

red : Color
red = Red

type Shade = S50 | S100 | S500 | S800 | S900

s50 : Shade
s50 = S50

s100 : Shade
s100 = S100

s500 : Shade
s500 = S500

s800 : Shade
s800 = S800

s900 : Shade
s900 = S900

type SimpleColor = SimpleColor String

white : SimpleColor
white = SimpleColor "white"

black : SimpleColor
black = SimpleColor "black"
"""
