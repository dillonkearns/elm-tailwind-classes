module TailwindExtractor exposing (rule)

{-| Extracts Tailwind CSS class names from Elm code.

Supports:

  - Simple constants: `Tw.flex` → "flex"
  - Parameterized spacing: `Tw.p s4` → "p-4"
  - Parameterized colors: `Tw.bg_color (blue s500)` → "bg-blue-500"
  - Simple colors: `Tw.text_simple white` → "text-white"
  - Variants: `hover [ Tw.opacity_50 ]` → "hover:opacity-50"
  - Responsive: `md [ Tw.p s8 ]` → "md:p-8"
  - Raw strings: `Tw.raw "custom-class"` → "custom-class"

@docs rule

-}

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
    { classes : Set String
    }


type alias ModuleContext =
    { classes : Set String
    , lookupTable : ModuleNameLookupTable
    , breakpointsDepth : Int
    }


initialProjectContext : ProjectContext
initialProjectContext =
    { classes = Set.empty
    }


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
            { classes = moduleContext.classes
            }
        )


foldProjectContexts : ProjectContext -> ProjectContext -> ProjectContext
foldProjectContexts new old =
    { classes = Set.union new.classes old.classes
    }


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
                    extractClasses "" node context.lookupTable
            in
            ( []
            , { context
                | classes = Set.union context.classes (Set.fromList extractedClasses)
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
                extractClasses "" node context.lookupTable
        in
        ( [], { context | classes = Set.union context.classes (Set.fromList extractedClasses) } )


expressionExitVisitor : Node Expression -> ModuleContext -> ( List (Rule.Error {}), ModuleContext )
expressionExitVisitor node context =
    if isBreakpointsApplication node context.lookupTable then
        -- Exiting a Breakpoints call: decrement depth
        ( [], { context | breakpointsDepth = context.breakpointsDepth - 1 } )

    else
        ( [], context )


{-| Extract classes from an expression, with an optional variant prefix.
-}
extractClasses : String -> Node Expression -> ModuleNameLookupTable -> List String
extractClasses variantPrefix node lookupTable =
    case Node.value node of
        -- Function application
        Expression.Application ((Node funcRange (Expression.FunctionOrValue _ funcName)) :: args) ->
            case ModuleNameLookupTable.moduleNameAt lookupTable funcRange of
                Just [ "Tailwind" ] ->
                    -- Utility function call
                    case extractUtilityClass funcName args lookupTable of
                        Just className ->
                            [ applyPrefix variantPrefix className ]

                        Nothing ->
                            -- Might be a simple constant used in application context
                            []

                Just [ "Tailwind", "Breakpoints" ] ->
                    -- Variant/breakpoint function
                    let
                        newPrefix =
                            getVariantPrefix funcName variantPrefix
                    in
                    case args of
                        [ listArg ] ->
                            extractFromListArg newPrefix listArg lookupTable

                        _ ->
                            []

                _ ->
                    -- Not a Tailwind function, but recurse into args
                    List.concatMap (\arg -> extractClasses variantPrefix arg lookupTable) args

        -- Simple value reference: Tw.flex, Tw.items_center
        Expression.FunctionOrValue _ funcName ->
            case ModuleNameLookupTable.moduleNameAt lookupTable (Node.range node) of
                Just [ "Tailwind" ] ->
                    if isParameterizedFunction funcName || isNonUtilityFunction funcName then
                        []

                    else
                        case elmNameToClassName funcName of
                            Just className ->
                                [ applyPrefix variantPrefix className ]

                            Nothing ->
                                []

                _ ->
                    []

        -- List expressions (for classes [ ... ])
        Expression.ListExpr items ->
            List.concatMap (\item -> extractClasses variantPrefix item lookupTable) items

        -- Parenthesized expressions
        Expression.ParenthesizedExpression inner ->
            extractClasses variantPrefix inner lookupTable

        _ ->
            []


{-| Extract classes from a list argument to a variant function.
-}
extractFromListArg : String -> Node Expression -> ModuleNameLookupTable -> List String
extractFromListArg variantPrefix node lookupTable =
    case Node.value node of
        Expression.ListExpr items ->
            List.concatMap (\item -> extractClasses variantPrefix item lookupTable) items

        _ ->
            []


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
getVariantPrefix : String -> String -> String
getVariantPrefix funcName existingPrefix =
    let
        variantStr =
            case funcName of
                "sm" ->
                    "sm"

                "md" ->
                    "md"

                "lg" ->
                    "lg"

                "xl" ->
                    "xl"

                "xxl" ->
                    "2xl"

                "hover" ->
                    "hover"

                "focus" ->
                    "focus"

                "active" ->
                    "active"

                "disabled" ->
                    "disabled"

                "visited" ->
                    "visited"

                "focus_within" ->
                    "focus-within"

                "focus_visible" ->
                    "focus-visible"

                "first" ->
                    "first"

                "last" ->
                    "last"

                "odd" ->
                    "odd"

                "even" ->
                    "even"

                "dark" ->
                    "dark"

                "group_hover" ->
                    "group-hover"

                _ ->
                    funcName
    in
    if String.isEmpty existingPrefix then
        variantStr

    else
        existingPrefix ++ ":" ++ variantStr


{-| Non-utility functions (type constructors, helper functions, etc.)
-}
isNonUtilityFunction : String -> Bool
isNonUtilityFunction name =
    List.member name
        [ "Tailwind"
        , "classes"
        , "batch"
        , "toClass"
        ]


{-| Functions that take parameters (should not be extracted as simple constants)
-}
isParameterizedFunction : String -> Bool
isParameterizedFunction name =
    List.member name
        [ "p"
        , "px"
        , "py"
        , "pt"
        , "pr"
        , "pb"
        , "pl"
        , "m"
        , "mx"
        , "my"
        , "mt"
        , "mr"
        , "mb"
        , "ml"
        , "gap"
        , "gap_x"
        , "gap_y"
        , "w"
        , "h"
        , "min_w"
        , "max_w"
        , "min_h"
        , "max_h"
        , "text_color"
        , "bg_color"
        , "border_color"
        , "ring_color"
        , "placeholder_color"
        , "neg_m"
        , "neg_mx"
        , "neg_my"
        , "neg_mt"
        , "neg_mr"
        , "neg_mb"
        , "neg_ml"
        , "raw"
        , "text_simple"
        , "bg_simple"
        , "border_simple"
        ]


{-| Extract a class from a utility function application.
-}
extractUtilityClass : String -> List (Node Expression) -> ModuleNameLookupTable -> Maybe String
extractUtilityClass funcName args lookupTable =
    case args of
        -- One argument: spacing, simple color, or raw string
        [ arg ] ->
            -- Check for raw function with string literal
            if funcName == "raw" then
                extractRawString arg

            else
                extractOneArg funcName arg lookupTable

        -- Two arguments: color with shade (text_color red s500)
        [ colorArg, shadeArg ] ->
            if isColorFunction funcName then
                extractTwoArgColor funcName colorArg shadeArg lookupTable

            else
                Nothing

        _ ->
            Nothing


{-| Extract a string literal from a raw function call.
-}
extractRawString : Node Expression -> Maybe String
extractRawString node =
    case Node.value node of
        Expression.Literal str ->
            Just str

        Expression.ParenthesizedExpression inner ->
            extractRawString inner

        _ ->
            Nothing


{-| Extract from single-argument function.
-}
extractOneArg : String -> Node Expression -> ModuleNameLookupTable -> Maybe String
extractOneArg funcName arg lookupTable =
    case Node.value arg of
        -- Simple value: Theme.white, Theme.s4
        Expression.FunctionOrValue _ argName ->
            case ModuleNameLookupTable.moduleNameAt lookupTable (Node.range arg) of
                Just [ "Tailwind", "Theme" ] ->
                    if isColorFunction funcName then
                        -- Simple color like white, black (for text_color white)
                        Just (colorFunctionPrefix funcName ++ argName)

                    else if isSimpleColorFunction funcName then
                        -- Simple color function like text_simple white
                        Just (simpleColorFunctionPrefix funcName ++ argName)

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


{-| Check if function is a color function (takes Color argument).
-}
isColorFunction : String -> Bool
isColorFunction name =
    List.member name [ "text_color", "bg_color", "border_color", "ring_color", "placeholder_color" ]


{-| Check if function is a simple color function (takes SimpleColor argument).
-}
isSimpleColorFunction : String -> Bool
isSimpleColorFunction name =
    List.member name [ "text_simple", "bg_simple", "border_simple" ]


{-| Get the CSS prefix for a color function.
-}
colorFunctionPrefix : String -> String
colorFunctionPrefix funcName =
    case funcName of
        "text_color" ->
            "text-"

        "bg_color" ->
            "bg-"

        "border_color" ->
            "border-"

        "ring_color" ->
            "ring-"

        "placeholder_color" ->
            "placeholder-"

        _ ->
            ""


{-| Get the CSS prefix for a simple color function.
-}
simpleColorFunctionPrefix : String -> String
simpleColorFunctionPrefix funcName =
    case funcName of
        "text_simple" ->
            "text-"

        "bg_simple" ->
            "bg-"

        "border_simple" ->
            "border-"

        _ ->
            ""


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


{-| Extract from two-argument color function: text_color red s500
-}
extractTwoArgColor : String -> Node Expression -> Node Expression -> ModuleNameLookupTable -> Maybe String
extractTwoArgColor funcName colorArg shadeArg lookupTable =
    case ( Node.value colorArg, Node.value shadeArg ) of
        ( Expression.FunctionOrValue _ colorName, Expression.FunctionOrValue _ shadeName ) ->
            case ( ModuleNameLookupTable.moduleNameAt lookupTable (Node.range colorArg), ModuleNameLookupTable.moduleNameAt lookupTable (Node.range shadeArg) ) of
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
    let
        prefix =
            case funcName of
                "p" ->
                    Just "p"

                "px" ->
                    Just "px"

                "py" ->
                    Just "py"

                "pt" ->
                    Just "pt"

                "pr" ->
                    Just "pr"

                "pb" ->
                    Just "pb"

                "pl" ->
                    Just "pl"

                "m" ->
                    Just "m"

                "mx" ->
                    Just "mx"

                "my" ->
                    Just "my"

                "mt" ->
                    Just "mt"

                "mr" ->
                    Just "mr"

                "mb" ->
                    Just "mb"

                "ml" ->
                    Just "ml"

                "gap" ->
                    Just "gap"

                "gap_x" ->
                    Just "gap-x"

                "gap_y" ->
                    Just "gap-y"

                "w" ->
                    Just "w"

                "h" ->
                    Just "h"

                "min_w" ->
                    Just "min-w"

                "max_w" ->
                    Just "max-w"

                "min_h" ->
                    Just "min-h"

                "max_h" ->
                    Just "max-h"

                "neg_m" ->
                    Just "-m"

                "neg_mx" ->
                    Just "-mx"

                "neg_my" ->
                    Just "-my"

                "neg_mt" ->
                    Just "-mt"

                "neg_mr" ->
                    Just "-mr"

                "neg_mb" ->
                    Just "-mb"

                "neg_ml" ->
                    Just "-ml"

                _ ->
                    Nothing

        spacingValue =
            spacingArgToClass argName
    in
    Maybe.map2 (\p s -> p ++ "-" ++ s) prefix spacingValue


{-| Convert spacing argument name to class suffix.
s4 → "4", s0\_dot\_5 → "0.5", spx → "px"
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
flex → "flex", items\_center → "items-center", text\_2xl → "text-2xl"
-}
elmNameToClassName : String -> Maybe String
elmNameToClassName elmName =
    let
        -- Convert _dot_ to .
        withDots =
            String.replace "_dot_" "." elmName

        -- Convert remaining underscores to hyphens
        className =
            String.replace "_" "-" withDots
    in
    Just className


{-| Extract collected classes as JSON.
-}
dataExtractor : ProjectContext -> Encode.Value
dataExtractor context =
    Encode.object
        [ ( "classes"
          , Encode.list Encode.string (Set.toList context.classes)
          )
        ]
