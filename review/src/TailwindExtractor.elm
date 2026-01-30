module TailwindExtractor exposing (rule)

{-| Extracts Tailwind CSS class names from Elm code.

Supports:

  - Simple constants: `Tw.flex` → "flex"
  - Parameterized spacing: `Tw.p s4` → "p-4"
  - Parameterized colors: `Tw.bg_color red s500` → "bg-red-500"
  - Simple colors: `Tw.text_color white` → "text-white"
  - Variants: `hover [ Tw.opacity_50 ]` → "hover:opacity-50"
  - Responsive: `md [ Tw.p s8 ]` → "md:p-8"

@docs rule

-}

import Dict exposing (Dict)
import Elm.Syntax.Expression as Expression exposing (Expression)
import Elm.Syntax.Node as Node exposing (Node(..))
import Json.Encode as Encode
import Review.ModuleNameLookupTable as ModuleNameLookupTable exposing (ModuleNameLookupTable)
import Review.Rule as Rule exposing (Rule)
import Set exposing (Set)


{-| Rule that extracts Tailwind class names.
-}
rule : Rule
rule =
    Rule.newProjectRuleSchema "TailwindExtractor" initialProjectContext
        |> Rule.withModuleVisitor moduleVisitor
        |> Rule.withModuleContextUsingContextCreator
            { fromProjectToModule = fromProjectToModule
            , fromModuleToProject = fromModuleToProject
            , foldProjectContexts = foldProjectContexts
            }
        |> Rule.withDataExtractor dataExtractor
        |> Rule.fromProjectRuleSchema


type alias ProjectContext =
    Set String


type alias ModuleContext =
    { classes : Set String
    , lookupTable : ModuleNameLookupTable
    , breakpointsDepth : Int
    }


initialProjectContext : ProjectContext
initialProjectContext =
    Set.empty


fromProjectToModule : Rule.ContextCreator ProjectContext ModuleContext
fromProjectToModule =
    Rule.initContextCreator
        (\lookupTable _ ->
            { classes = Set.empty
            , lookupTable = lookupTable
            , breakpointsDepth = 0
            }
        )
        |> Rule.withModuleNameLookupTable


fromModuleToProject : Rule.ContextCreator ModuleContext ProjectContext
fromModuleToProject =
    Rule.initContextCreator
        (\moduleContext ->
            moduleContext.classes
        )


foldProjectContexts : ProjectContext -> ProjectContext -> ProjectContext
foldProjectContexts =
    Set.union


moduleVisitor : Rule.ModuleRuleSchema {} ModuleContext -> Rule.ModuleRuleSchema { hasAtLeastOneVisitor : () } ModuleContext
moduleVisitor schema =
    schema
        |> Rule.withExpressionEnterVisitor expressionEnterVisitor
        |> Rule.withExpressionExitVisitor expressionExitVisitor


{-| Check if an expression is a Tailwind.Breakpoints application.
-}
isBreakpointsApplication : Node Expression -> ModuleNameLookupTable -> Bool
isBreakpointsApplication node lookupTable =
    case Node.value node of
        Expression.Application ((Node funcRange (Expression.FunctionOrValue _ _)) :: _) ->
            case ModuleNameLookupTable.moduleNameAt lookupTable funcRange of
                Just [ "Tailwind", "Breakpoints" ] ->
                    True

                _ ->
                    False

        _ ->
            False


expressionEnterVisitor : Node Expression -> ModuleContext -> ( List (Rule.Error {}), ModuleContext )
expressionEnterVisitor node context =
    if isBreakpointsApplication node context.lookupTable then
        if context.breakpointsDepth > 0 then
            -- Nested Breakpoints call: just increment depth, don't re-extract
            -- (parent already handled this via extractClasses recursion)
            ( [], { context | breakpointsDepth = context.breakpointsDepth + 1 } )

        else
            -- Top-level Breakpoints call: extract classes and increment depth
            let
                extractedClasses =
                    extractClasses "" context.lookupTable ( context.classes, [ node ] )
            in
            ( []
            , { context
                | classes = extractedClasses
                , breakpointsDepth = context.breakpointsDepth + 1
              }
            )

    else if context.breakpointsDepth > 0 then
        -- Inside a Breakpoints call: skip extraction (already handled by parent)
        ( [], context )

    else
        -- Top-level: extract normally
        let
            extractedClasses =
                extractClasses "" context.lookupTable ( context.classes, [ node ] )
        in
        ( [], { context | classes = extractedClasses } )


expressionExitVisitor : Node Expression -> ModuleContext -> ( List (Rule.Error {}), ModuleContext )
expressionExitVisitor node context =
    if isBreakpointsApplication node context.lookupTable then
        -- Exiting a Breakpoints call: decrement depth
        ( [], { context | breakpointsDepth = context.breakpointsDepth - 1 } )

    else
        ( [], context )


{-| Extract classes from an expression, with an optional variant prefix.
-}
extractClasses : String -> ModuleNameLookupTable -> ( Set String, List (Node Expression) ) -> Set String
extractClasses variantPrefix lookupTable ( classes, nodes ) =
    case nodes of
        [] ->
            classes

        node :: nextNodes ->
            extractClasses variantPrefix
                lookupTable
                (extractClassesHelp variantPrefix lookupTable node ( classes, nextNodes ))


extractClassesHelp : String -> ModuleNameLookupTable -> Node Expression -> ( Set String, List (Node Expression) ) -> ( Set String, List (Node Expression) )
extractClassesHelp variantPrefix lookupTable (Node nodeRange node) ( classes, nextNodes ) =
    case node of
        -- Function application
        Expression.Application ((Node funcRange (Expression.FunctionOrValue _ funcName)) :: args) ->
            case ModuleNameLookupTable.moduleNameAt lookupTable funcRange of
                Just [ "Tailwind", "Utilities" ] ->
                    -- Utility function call
                    case extractUtilityClass funcName args lookupTable of
                        Just className ->
                            ( Set.insert (applyPrefix variantPrefix className) classes
                            , nextNodes
                            )

                        Nothing ->
                            -- Might be a simple constant used in application context
                            ( classes, nextNodes )

                Just [ "Tailwind", "Breakpoints" ] ->
                    -- Variant/breakpoint function
                    let
                        newPrefix =
                            applyPrefix variantPrefix (getVariantPrefix funcName)
                    in
                    case args of
                        [ listArg ] ->
                            ( extractFromListArg newPrefix listArg lookupTable classes
                            , nextNodes
                            )

                        _ ->
                            ( classes, nextNodes )

                _ ->
                    -- Not a Tailwind function, but visit other args
                    ( classes
                    , List.foldl (::) args nextNodes
                    )

        -- Simple value reference: Tw.flex, Tw.items_center
        Expression.FunctionOrValue _ funcName ->
            case ModuleNameLookupTable.moduleNameAt lookupTable nodeRange of
                Just [ "Tailwind", "Utilities" ] ->
                    ( if isParameterizedFunction funcName then
                        classes

                      else
                        Set.insert (applyPrefix variantPrefix (elmNameToClassName funcName)) classes
                    , nextNodes
                    )

                _ ->
                    ( classes, nextNodes )

        -- List expressions (for classes [ ... ])
        Expression.ListExpr items ->
            ( classes
            , List.foldl (::) nextNodes items
            )

        -- Parenthesized expressions
        Expression.ParenthesizedExpression inner ->
            ( classes, inner :: nextNodes )

        _ ->
            ( classes, nextNodes )


{-| Extract classes from a list argument to a variant function.
-}
extractFromListArg : String -> Node Expression -> ModuleNameLookupTable -> Set String -> Set String
extractFromListArg variantPrefix node lookupTable classes =
    case Node.value node of
        Expression.ListExpr items ->
            extractClasses variantPrefix lookupTable ( classes, items )

        _ ->
            classes


{-| Apply a variant prefix to a class name.
-}
applyPrefix : String -> String -> String
applyPrefix prefix className =
    if String.isEmpty prefix then
        className

    else
        prefix ++ ":" ++ className


{-| Get the CSS variant prefix for a breakpoint/variant function.
-}
getVariantPrefix : String -> String
getVariantPrefix funcName =
    case funcName of
        "xxl" ->
            "2xl"

        "focus_within" ->
            "focus-within"

        "focus_visible" ->
            "focus-visible"

        "group_hover" ->
            "group-hover"

        _ ->
            funcName


{-| Functions that take parameters (should not be extracted as simple constants)
-}
isParameterizedFunction : String -> Bool
isParameterizedFunction name =
    Dict.member name spacingClasses
        || Dict.member name colorFunctions


{-| Extract a class from a utility function application.
-}
extractUtilityClass : String -> List (Node Expression) -> ModuleNameLookupTable -> Maybe String
extractUtilityClass funcName args lookupTable =
    case args of
        -- One argument: spacing or simple color
        [ arg ] ->
            extractOneArg funcName arg lookupTable

        -- Two arguments: color with shade (text_color red s500)
        [ colorArg, shadeArg ] ->
            if isColorFunction funcName then
                extractTwoArgColor funcName colorArg shadeArg lookupTable

            else
                Nothing

        _ ->
            Nothing


{-| Extract from single-argument function.
-}
extractOneArg : String -> Node Expression -> ModuleNameLookupTable -> Maybe String
extractOneArg funcName arg lookupTable =
    case Node.value arg of
        -- Simple value: Theme.white, Theme.s4
        Expression.FunctionOrValue _ argName ->
            case ModuleNameLookupTable.moduleNameFor lookupTable arg of
                Just [ "Tailwind", "Theme" ] ->
                    if isColorFunction funcName then
                        -- Simple color like white, black
                        Just (colorFunctionPrefix funcName ++ argName)

                    else
                        -- Spacing function
                        extractSpacingClass funcName argName

                _ ->
                    Nothing

        -- Function application: (blue s500) - color with shade
        Expression.Application colorArgs ->
            if isColorFunction funcName then
                extractColorApplication funcName colorArgs lookupTable

            else
                Nothing

        -- Parenthesized: (blue s500)
        Expression.ParenthesizedExpression inner ->
            extractOneArg funcName inner lookupTable

        _ ->
            Nothing


{-| Check if function is a color function.
-}
isColorFunction : String -> Bool
isColorFunction name =
    Dict.member name colorFunctions


{-| Get the CSS prefix for a color function.
-}
colorFunctionPrefix : String -> String
colorFunctionPrefix funcName =
    Dict.get funcName colorFunctions
        |> Maybe.withDefault ""


{-| Extract from a color application like (blue s500).
-}
extractColorApplication : String -> List (Node Expression) -> ModuleNameLookupTable -> Maybe String
extractColorApplication funcName args lookupTable =
    case args of
        [ Node colorRange (Expression.FunctionOrValue _ colorName), Node shadeRange (Expression.FunctionOrValue _ shadeName) ] ->
            case ( ModuleNameLookupTable.moduleNameAt lookupTable colorRange, ModuleNameLookupTable.moduleNameAt lookupTable shadeRange ) of
                ( Just [ "Tailwind", "Theme" ], Just [ "Tailwind", "Theme" ] ) ->
                    let
                        shadeStr =
                            if String.startsWith "s" shadeName then
                                String.dropLeft 1 shadeName

                            else
                                shadeName
                    in
                    Just (colorFunctionPrefix funcName ++ colorName ++ "-" ++ shadeStr)

                _ ->
                    Nothing

        _ ->
            Nothing


{-| Extract from two-argument color function: `text_color red s500`
-}
extractTwoArgColor : String -> Node Expression -> Node Expression -> ModuleNameLookupTable -> Maybe String
extractTwoArgColor funcName colorArg shadeArg lookupTable =
    case ( Node.value colorArg, Node.value shadeArg ) of
        ( Expression.FunctionOrValue _ colorName, Expression.FunctionOrValue _ shadeName ) ->
            case ( ModuleNameLookupTable.moduleNameFor lookupTable colorArg, ModuleNameLookupTable.moduleNameFor lookupTable shadeArg ) of
                ( Just [ "Tailwind", "Theme" ], Just [ "Tailwind", "Theme" ] ) ->
                    let
                        shadeStr =
                            if String.startsWith "s" shadeName then
                                String.dropLeft 1 shadeName

                            else
                                shadeName
                    in
                    Just (colorFunctionPrefix funcName ++ colorName ++ "-" ++ shadeStr)

                _ ->
                    Nothing

        _ ->
            Nothing


{-| Extract spacing class: p s4 → "p-4"
-}
extractSpacingClass : String -> String -> Maybe String
extractSpacingClass funcName argName =
    Maybe.map2 (\p s -> p ++ "-" ++ s)
        (Dict.get funcName spacingClasses)
        (spacingArgToClass argName)


{-| Convert spacing argument name to class suffix.
`s4` → `"4"`, `s0_dot_5` → `"0.5"`, `spx` → `"px"`
-}
spacingArgToClass : String -> Maybe String
spacingArgToClass argName =
    if String.startsWith "s" argName then
        let
            rest =
                String.dropLeft 1 argName
        in
        if rest == "px" then
            Just "px"

        else
            -- Convert _dot_ back to .
            Just (String.replace "_dot_" "." rest)

    else
        Nothing


{-| Convert simple utility function name to CSS class.
`flex` → `"flex"`, `items_center` → `"items-center"`, `text_2xl` → `"text-2xl"`
-}
elmNameToClassName : String -> String
elmNameToClassName elmName =
    elmName
        -- Convert _dot_ to .
        |> String.replace "_dot_" "."
        -- Convert remaining underscores to hyphens
        |> String.replace "_" "-"


{-| Extract collected classes as JSON.
-}
dataExtractor : ProjectContext -> Encode.Value
dataExtractor classes =
    Encode.object
        [ ( "classes"
          , Encode.set Encode.string classes
          )
        ]



-- CLASSES


colorFunctions : Dict String String
colorFunctions =
    Dict.fromList
        [ ( "text_color", "text-" )
        , ( "bg_color", "bg-" )
        , ( "border_color", "border-" )
        , ( "ring_color", "ring-" )
        , ( "placeholder_color", "placeholder-" )
        ]


spacingClasses : Dict.Dict String String
spacingClasses =
    Dict.fromList
        [ ( "p", "p" )
        , ( "px", "px" )
        , ( "py", "py" )
        , ( "pt", "pt" )
        , ( "pr", "pr" )
        , ( "pb", "pb" )
        , ( "pl", "pl" )
        , ( "m", "m" )
        , ( "mx", "mx" )
        , ( "my", "my" )
        , ( "mt", "mt" )
        , ( "mr", "mr" )
        , ( "mb", "mb" )
        , ( "ml", "ml" )
        , ( "gap", "gap" )
        , ( "gap_x", "gap-x" )
        , ( "gap_y", "gap-y" )
        , ( "w", "w" )
        , ( "h", "h" )
        , ( "min_w", "min-w" )
        , ( "max_w", "max-w" )
        , ( "min_h", "min-h" )
        , ( "max_h", "max-h" )
        , ( "neg_m", "-m" )
        , ( "neg_mx", "-mx" )
        , ( "neg_my", "-my" )
        , ( "neg_mt", "-mt" )
        , ( "neg_mr", "-mr" )
        , ( "neg_mb", "-mb" )
        , ( "neg_ml", "-ml" )
        ]
