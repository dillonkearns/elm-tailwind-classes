module TailwindExtractor exposing (rule)

{-| Extracts Tailwind CSS class names from Elm code.

MVP scope:

  - Simple constants: `Tw.flex` → "flex"
  - Parameterized spacing: `Tw.p Theme.s4` → "p-4"
  - Parameterized colors: `Tw.bg_color Theme.blue_500` → "bg-blue-500"

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
        -- Function application: Tw.p Theme.s4, Tw.bg_color Theme.blue_500
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
        , "neg_m", "neg_mx", "neg_my", "neg_mt", "neg_mr", "neg_mb", "neg_ml"
        ]


{-| Extract class from a function application like `Tw.p Theme.s4`
-}
extractFromApplication : String -> List (Node Expression) -> ModuleNameLookupTable -> Maybe String
extractFromApplication funcName args lookupTable =
    case args of
        [ arg ] ->
            case Node.value arg of
                Expression.FunctionOrValue _ argName ->
                    case ModuleNameLookupTable.moduleNameAt lookupTable (Node.range arg) of
                        Just [ "Tailwind", "Theme" ] ->
                            -- This is a Theme value, extract based on function
                            extractParameterizedClass funcName argName

                        _ ->
                            Nothing

                _ ->
                    Nothing

        _ ->
            Nothing


{-| Extract class from parameterized function + theme value.
For example: funcName="p", argName="s4" → "p-4"
For example: funcName="bg_color", argName="blue_500" → "bg-blue-500"
-}
extractParameterizedClass : String -> String -> Maybe String
extractParameterizedClass funcName argName =
    case funcName of
        -- Spacing functions
        "p" ->
            spacingArgToClass argName |> Maybe.map (\s -> "p-" ++ s)

        "px" ->
            spacingArgToClass argName |> Maybe.map (\s -> "px-" ++ s)

        "py" ->
            spacingArgToClass argName |> Maybe.map (\s -> "py-" ++ s)

        "pt" ->
            spacingArgToClass argName |> Maybe.map (\s -> "pt-" ++ s)

        "pr" ->
            spacingArgToClass argName |> Maybe.map (\s -> "pr-" ++ s)

        "pb" ->
            spacingArgToClass argName |> Maybe.map (\s -> "pb-" ++ s)

        "pl" ->
            spacingArgToClass argName |> Maybe.map (\s -> "pl-" ++ s)

        "m" ->
            spacingArgToClass argName |> Maybe.map (\s -> "m-" ++ s)

        "mx" ->
            spacingArgToClass argName |> Maybe.map (\s -> "mx-" ++ s)

        "my" ->
            spacingArgToClass argName |> Maybe.map (\s -> "my-" ++ s)

        "mt" ->
            spacingArgToClass argName |> Maybe.map (\s -> "mt-" ++ s)

        "mr" ->
            spacingArgToClass argName |> Maybe.map (\s -> "mr-" ++ s)

        "mb" ->
            spacingArgToClass argName |> Maybe.map (\s -> "mb-" ++ s)

        "ml" ->
            spacingArgToClass argName |> Maybe.map (\s -> "ml-" ++ s)

        "gap" ->
            spacingArgToClass argName |> Maybe.map (\s -> "gap-" ++ s)

        "gap_x" ->
            spacingArgToClass argName |> Maybe.map (\s -> "gap-x-" ++ s)

        "gap_y" ->
            spacingArgToClass argName |> Maybe.map (\s -> "gap-y-" ++ s)

        -- Sizing functions
        "w" ->
            spacingArgToClass argName |> Maybe.map (\s -> "w-" ++ s)

        "h" ->
            spacingArgToClass argName |> Maybe.map (\s -> "h-" ++ s)

        "min_w" ->
            spacingArgToClass argName |> Maybe.map (\s -> "min-w-" ++ s)

        "max_w" ->
            spacingArgToClass argName |> Maybe.map (\s -> "max-w-" ++ s)

        "min_h" ->
            spacingArgToClass argName |> Maybe.map (\s -> "min-h-" ++ s)

        "max_h" ->
            spacingArgToClass argName |> Maybe.map (\s -> "max-h-" ++ s)

        -- Color functions
        "text_color" ->
            colorArgToClass argName |> Maybe.map (\c -> "text-" ++ c)

        "bg_color" ->
            colorArgToClass argName |> Maybe.map (\c -> "bg-" ++ c)

        "border_color" ->
            colorArgToClass argName |> Maybe.map (\c -> "border-" ++ c)

        _ ->
            Nothing


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


{-| Convert color argument name to class suffix.
blue\_500 → "blue-500", gray\_100 → "gray-100", white → "white"
-}
colorArgToClass : String -> Maybe String
colorArgToClass argName =
    -- Convert underscores to hyphens
    Just (String.replace "_" "-" argName)


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
