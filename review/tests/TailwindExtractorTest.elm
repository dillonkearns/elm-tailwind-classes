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
        , variantTests
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
        , test "extracts text_2xl as text-2xl" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw

view = Tw.text_2xl
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
    describe "parameterized colors (Color with shade)"
        [ test "extracts bg_color blue s500 as bg-blue-500 (two args)" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.bg_color Theme.blue Theme.s500
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["bg-blue-500"]}"""
        , test "extracts text_color gray s800 as text-gray-800 (two args)" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.text_color Theme.gray Theme.s800
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["text-gray-800"]}"""
        , test "extracts text_color red s400 as text-red-400 (two args)" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.text_color Theme.red Theme.s400
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["text-red-400"]}"""
        ]


simpleColorTests : Test
simpleColorTests =
    describe "simple colors"
        [ test "extracts text_color white as text-white" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.text_color Theme.white
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["text-white"]}"""
        , test "extracts bg_color black as bg-black" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Theme as Theme

view = Tw.bg_color Theme.black
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["bg-black"]}"""
        ]


variantTests : Test
variantTests =
    describe "variants"
        [ test "extracts hover variant" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Breakpoints as Bp

view = Bp.hover [ Tw.opacity_50 ]
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["hover:opacity-50"]}"""
        , test "extracts md breakpoint" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Breakpoints as Bp
import Tailwind.Theme as Theme

view = Bp.md [ Tw.p Theme.s8 ]
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["md:p-8"]}"""
        , test "extracts nested variant (md hover)" <|
            \() ->
                """module A exposing (..)
import Tailwind.Utilities as Tw
import Tailwind.Breakpoints as Bp
import Tailwind.Theme as Theme

view = Bp.md [ Bp.hover [ Tw.bg_color Theme.blue Theme.s600 ] ]
"""
                    |> Review.Test.runWithProjectData projectWithTailwind TailwindExtractor.rule
                    |> Review.Test.expectDataExtract """{"classes":["md:hover:bg-blue-600"]}"""
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
        |> Project.addModule
            { path = "src/Tailwind/Breakpoints.elm"
            , source = tailwindBreakpointsStub
            }


tailwindUtilitiesStub : String
tailwindUtilitiesStub =
    """module Tailwind.Utilities exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (class)
import Tailwind.Theme exposing (Color, Shade, Spacing(..))

flex : Attribute msg
flex = class "flex"

items_center : Attribute msg
items_center = class "items-center"

text_2xl : Attribute msg
text_2xl = class "text-2xl"

opacity_50 : Attribute msg
opacity_50 = class "opacity-50"

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

type Color = Color String

type Shade = S50 | S100 | S400 | S500 | S600 | S800 | S900

blue : Color
blue = Color "blue"

gray : Color
gray = Color "gray"

red : Color
red = Color "red"

s50 : Shade
s50 = S50

s100 : Shade
s100 = S100

s400 : Shade
s400 = S400

s500 : Shade
s500 = S500

s600 : Shade
s600 = S600

s800 : Shade
s800 = S800

s900 : Shade
s900 = S900

white : Color
white = Color "white"

black : Color
black = Color "black"
"""


tailwindBreakpointsStub : String
tailwindBreakpointsStub =
    """module Tailwind.Breakpoints exposing (..)

import Html exposing (Attribute)

type Tailwind = Tailwind String

hover : List Tailwind -> Tailwind
hover _ = Tailwind ""

md : List Tailwind -> Tailwind
md _ = Tailwind ""

lg : List Tailwind -> Tailwind
lg _ = Tailwind ""
"""
