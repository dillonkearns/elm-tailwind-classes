module TailwindExtractor exposing (rule)

{-| Extracts Tailwind CSS class names from Elm code.

MVP scope:

  - Simple constants: `Tw.flex` → "flex"
  - Parameterized spacing: `Tw.p s4` → "p-4"
  - Parameterized colors: `Tw.bg_color blue s500` → "bg-blue-500"
  - Simple colors: `Tw.bg_simple white` → "bg-white"

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
        |> Rule.withExpressionEnterVisitor expressionVisitor


expressionVisitor : Node Expression -> ModuleContext -> ( List (Rule.Error {}), ModuleContext )
expressionVisitor node context =
    case Node.value node of
        -- Function application: Tw.p s4, Tw.bg_color blue s500, Tw.bg_simple white
        Expression.Application ((Node funcRange (Expression.FunctionOrValue _ funcName)) :: args) ->
            case ModuleNameLookupTable.moduleNameAt context.lookupTable funcRange of
                Just [ "Tailwind", "Utilities" ] ->
                    case extractFromApplication funcName args context.lookupTable of
                        Just className ->
                            ( [], { context | classes = Set.insert className context.classes } )

                        Nothing ->
                            -- Function not recognized as parameterized, try as simple constant
                            case elmNameToClassName funcName of
                                Just className ->
                                    ( [], { context | classes = Set.insert className context.classes } )

                                Nothing ->
                                    ( [], context )

                _ ->
                    ( [], context )

        -- Simple value reference: Tw.flex, Tw.items_center
        -- Only match if this is NOT part of an application (avoid double-counting)
        Expression.FunctionOrValue _ funcName ->
            case ModuleNameLookupTable.moduleNameAt context.lookupTable (Node.range node) of
                Just [ "Tailwind", "Utilities" ] ->
                    -- Check if this is a function that takes arguments
                    -- If so, we'll handle it in the Application case above
                    if isParameterizedFunction funcName then
                        ( [], context )

                    else
                        case elmNameToClassName funcName of
                            Just className ->
                                ( [], { context | classes = Set.insert className context.classes } )

                            Nothing ->
                                ( [], context )

                _ ->
                    ( [], context )

        _ ->
            ( [], context )


{-| Functions that take parameters (should not be extracted as simple constants)
-}
isParameterizedFunction : String -> Bool
isParameterizedFunction name =
    List.member name
        [ "p", "px", "py", "pt", "pr", "pb", "pl"
        , "m", "mx", "my", "mt", "mr", "mb", "ml"
        , "gap", "gap_x", "gap_y"
        , "w", "h", "min_w", "max_w", "min_h", "max_h"
        , "text_color", "bg_color", "border_color", "ring_color", "placeholder_color"
        , "text_simple", "bg_simple", "border_simple"
        , "neg_m", "neg_mx", "neg_my", "neg_mt", "neg_mr", "neg_mb", "neg_ml"
        ]


{-| Extract class from a function application
-}
extractFromApplication : String -> List (Node Expression) -> ModuleNameLookupTable -> Maybe String
extractFromApplication funcName args lookupTable =
    case args of
        -- Two arguments: color functions like bg_color blue s500
        [ arg1, arg2 ] ->
            extractTwoArgColor funcName arg1 arg2 lookupTable

        -- One argument: spacing functions like p s4, or simple colors like bg_simple white
        [ arg ] ->
            extractOneArg funcName arg lookupTable

        _ ->
            Nothing


{-| Extract from two-argument color function: bg_color blue s500 → "bg-blue-500"
-}
extractTwoArgColor : String -> Node Expression -> Node Expression -> ModuleNameLookupTable -> Maybe String
extractTwoArgColor funcName colorArg shadeArg lookupTable =
    case ( Node.value colorArg, Node.value shadeArg ) of
        ( Expression.FunctionOrValue _ colorName, Expression.FunctionOrValue _ shadeName ) ->
            case ( ModuleNameLookupTable.moduleNameAt lookupTable (Node.range colorArg), ModuleNameLookupTable.moduleNameAt lookupTable (Node.range shadeArg) ) of
                ( Just [ "Tailwind", "Theme" ], Just [ "Tailwind", "Theme" ] ) ->
                    let
                        prefix =
                            case funcName of
                                "text_color" ->
                                    Just "text"

                                "bg_color" ->
                                    Just "bg"

                                "border_color" ->
                                    Just "border"

                                "ring_color" ->
                                    Just "ring"

                                "placeholder_color" ->
                                    Just "placeholder"

                                _ ->
                                    Nothing

                        colorStr =
                            -- Color names are lowercase in Theme: blue, red, gray
                            Just colorName

                        shadeStr =
                            -- Shade names are s50, s100, etc. → 50, 100
                            if String.startsWith "s" shadeName then
                                Just (String.dropLeft 1 shadeName)

                            else
                                Nothing
                    in
                    Maybe.map3 (\p c s -> p ++ "-" ++ c ++ "-" ++ s) prefix colorStr shadeStr

                _ ->
                    Nothing

        _ ->
            Nothing


{-| Extract from single-argument function
-}
extractOneArg : String -> Node Expression -> ModuleNameLookupTable -> Maybe String
extractOneArg funcName arg lookupTable =
    case Node.value arg of
        Expression.FunctionOrValue _ argName ->
            case ModuleNameLookupTable.moduleNameAt lookupTable (Node.range arg) of
                Just [ "Tailwind", "Theme" ] ->
                    -- Check if this is a simple color function
                    case funcName of
                        "text_simple" ->
                            Just ("text-" ++ argName)

                        "bg_simple" ->
                            Just ("bg-" ++ argName)

                        "border_simple" ->
                            Just ("border-" ++ argName)

                        _ ->
                            -- Spacing function
                            extractSpacingClass funcName argName

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
flex → "flex", items\_center → "items-center", text\_n2xl → "text-2xl"
-}
elmNameToClassName : String -> Maybe String
elmNameToClassName elmName =
    -- Convert underscores to hyphens, handle special prefixes
    let
        -- Handle numeric prefix at start (n2xl → 2xl)
        withoutStartNumericPrefix =
            if String.startsWith "n" elmName && String.length elmName > 1 then
                case String.toInt (String.slice 1 2 elmName) of
                    Just _ ->
                        String.dropLeft 1 elmName

                    Nothing ->
                        elmName

            else
                elmName

        -- Handle _n prefix for numbers within compound names (text_n2xl → text_2xl)
        -- We need to replace _n followed by a digit with just _
        withoutInnerNumericPrefix =
            replaceNumericPrefixes withoutStartNumericPrefix

        -- Convert _dot_ to .
        withDots =
            String.replace "_dot_" "." withoutInnerNumericPrefix

        -- Convert remaining underscores to hyphens
        className =
            String.replace "_" "-" withDots
    in
    Just className


{-| Replace \_n followed by digit with just \_ (e.g., text\_n2xl → text\_2xl)
-}
replaceNumericPrefixes : String -> String
replaceNumericPrefixes str =
    -- Look for patterns like _n2, _n3, etc. and replace with _2, _3
    String.toList str
        |> replaceNumericPrefixesHelper []
        |> String.fromList


replaceNumericPrefixesHelper : List Char -> List Char -> List Char
replaceNumericPrefixesHelper acc remaining =
    case remaining of
        '_' :: 'n' :: digit :: rest ->
            if Char.isDigit digit then
                -- Skip the 'n', keep underscore and digit
                replaceNumericPrefixesHelper (digit :: '_' :: acc) rest

            else
                replaceNumericPrefixesHelper ('n' :: '_' :: acc) (digit :: rest)

        c :: rest ->
            replaceNumericPrefixesHelper (c :: acc) rest

        [] ->
            List.reverse acc


{-| Extract collected classes as JSON.
-}
dataExtractor : ProjectContext -> Encode.Value
dataExtractor context =
    Encode.object
        [ ( "classes"
          , Encode.list Encode.string (Set.toList context.classes)
          )
        ]
