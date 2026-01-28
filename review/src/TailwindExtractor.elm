module TailwindExtractor exposing (rule)

{-| Extracts all Tailwind CSS class names used in the project.

This rule analyzes calls to Tailwind.Utilities functions and extracts the
corresponding CSS class names. The output can be used to generate a safelist
for Tailwind CSS tree-shaking.

@docs rule

-}

import Dict exposing (Dict)
import Elm.Syntax.Expression as Expression exposing (Expression)
import Elm.Syntax.Node as Node exposing (Node(..))
import Json.Encode as Encode
import Review.ModuleNameLookupTable as ModuleNameLookupTable exposing (ModuleNameLookupTable)
import Review.Rule as Rule exposing (Rule)
import Set exposing (Set)


{-| Provides an elm-review rule that extracts Tailwind class names.

    config =
        [ TailwindExtractor.rule
        ]

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
        Expression.Application ((Node funcRange (Expression.FunctionOrValue _ funcName)) :: args) ->
            -- Look up what module the function actually comes from
            case ModuleNameLookupTable.moduleNameAt context.lookupTable funcRange of
                Just [ "Tailwind", "Utilities" ] ->
                    case extractClassFromUtility funcName args context.lookupTable of
                        Just className ->
                            ( [], { context | classes = Set.insert className context.classes } )

                        Nothing ->
                            -- Try as a simple utility (no args needed)
                            case Dict.get funcName utilitiesMap of
                                Just className ->
                                    ( [], { context | classes = Set.insert className context.classes } )

                                Nothing ->
                                    ( [], context )

                _ ->
                    ( [], context )

        Expression.FunctionOrValue _ name ->
            -- Look up what module this value comes from
            case ModuleNameLookupTable.moduleNameAt context.lookupTable (Node.range node) of
                Just [ "Tailwind", "Utilities" ] ->
                    case Dict.get name utilitiesMap of
                        Just className ->
                            ( [], { context | classes = Set.insert className context.classes } )

                        Nothing ->
                            ( [], context )

                _ ->
                    ( [], context )

        _ ->
            ( [], context )


{-| Extract the CSS class from a utility function call with arguments.
-}
extractClassFromUtility : String -> List (Node Expression) -> ModuleNameLookupTable -> Maybe String
extractClassFromUtility funcName args lookupTable =
    case ( funcName, args ) of
        -- Parameterized color functions
        ( "text_color", [ colorArg ] ) ->
            extractColorClass "text-" colorArg lookupTable

        ( "bg_color", [ colorArg ] ) ->
            extractColorClass "bg-" colorArg lookupTable

        ( "border_color", [ colorArg ] ) ->
            extractColorClass "border-" colorArg lookupTable

        ( "ring_color", [ colorArg ] ) ->
            extractColorClass "ring-" colorArg lookupTable

        ( "placeholder_color", [ colorArg ] ) ->
            extractColorClass "placeholder-" colorArg lookupTable

        -- Simple utilities (no args) - use the map
        _ ->
            Dict.get funcName utilitiesMap


{-| Extract a color class from a color argument.
-}
extractColorClass : String -> Node Expression -> ModuleNameLookupTable -> Maybe String
extractColorClass prefix colorArg lookupTable =
    case Node.value colorArg of
        Expression.FunctionOrValue _ colorName ->
            -- Check if this is from Tailwind.Theme
            case ModuleNameLookupTable.moduleNameAt lookupTable (Node.range colorArg) of
                Just [ "Tailwind", "Theme" ] ->
                    colorNameToClass colorName
                        |> Maybe.map (\c -> prefix ++ c)

                _ ->
                    Nothing

        _ ->
            Nothing


{-| Convert an Elm color name to a Tailwind class suffix.
For example: red_500 -> "red-500"
-}
colorNameToClass : String -> Maybe String
colorNameToClass elmName =
    -- Convert underscores back to hyphens
    -- red_500 -> red-500
    -- slate_50 -> slate-50
    Just (String.replace "_" "-" elmName)


{-| Map of utility function names to their CSS class names.
This covers all the simple (non-parameterized) utilities.
-}
utilitiesMap : Dict String String
utilitiesMap =
    Dict.fromList
        ([ -- Display
           ( "flex", "flex" )
         , ( "inline_flex", "inline-flex" )
         , ( "block", "block" )
         , ( "inline_block", "inline-block" )
         , ( "inline", "inline" )
         , ( "grid", "grid" )
         , ( "hidden", "hidden" )

         -- Flex direction
         , ( "flex_row", "flex-row" )
         , ( "flex_row_reverse", "flex-row-reverse" )
         , ( "flex_col", "flex-col" )
         , ( "flex_col_reverse", "flex-col-reverse" )

         -- Flex wrap
         , ( "flex_wrap", "flex-wrap" )
         , ( "flex_wrap_reverse", "flex-wrap-reverse" )
         , ( "flex_nowrap", "flex-nowrap" )

         -- Flex grow/shrink
         , ( "grow", "grow" )
         , ( "grow_0", "grow-0" )
         , ( "shrink", "shrink" )
         , ( "shrink_0", "shrink-0" )

         -- Align items
         , ( "items_start", "items-start" )
         , ( "items_end", "items-end" )
         , ( "items_center", "items-center" )
         , ( "items_baseline", "items-baseline" )
         , ( "items_stretch", "items-stretch" )

         -- Justify content
         , ( "justify_start", "justify-start" )
         , ( "justify_end", "justify-end" )
         , ( "justify_center", "justify-center" )
         , ( "justify_between", "justify-between" )
         , ( "justify_around", "justify-around" )
         , ( "justify_evenly", "justify-evenly" )

         -- Positioning
         , ( "relative", "relative" )
         , ( "absolute", "absolute" )
         , ( "fixed", "fixed" )
         , ( "sticky", "sticky" )
         , ( "static", "static" )

         -- Visibility
         , ( "visible", "visible" )
         , ( "invisible", "invisible" )

         -- Overflow
         , ( "overflow_auto", "overflow-auto" )
         , ( "overflow_hidden", "overflow-hidden" )
         , ( "overflow_visible", "overflow-visible" )
         , ( "overflow_scroll", "overflow-scroll" )
         , ( "overflow_x_auto", "overflow-x-auto" )
         , ( "overflow_y_auto", "overflow-y-auto" )
         , ( "overflow_x_hidden", "overflow-x-hidden" )
         , ( "overflow_y_hidden", "overflow-y-hidden" )

         -- Typography
         , ( "text_left", "text-left" )
         , ( "text_center", "text-center" )
         , ( "text_right", "text-right" )
         , ( "text_justify", "text-justify" )
         , ( "font_sans", "font-sans" )
         , ( "font_serif", "font-serif" )
         , ( "font_mono", "font-mono" )
         , ( "italic", "italic" )
         , ( "not_italic", "not-italic" )
         , ( "uppercase", "uppercase" )
         , ( "lowercase", "lowercase" )
         , ( "capitalize", "capitalize" )
         , ( "normal_case", "normal-case" )
         , ( "underline", "underline" )
         , ( "line_through", "line-through" )
         , ( "no_underline", "no-underline" )
         , ( "truncate", "truncate" )

         -- Borders
         , ( "border", "border" )
         , ( "border_0", "border-0" )
         , ( "border_2", "border-2" )
         , ( "border_4", "border-4" )
         , ( "border_8", "border-8" )
         , ( "border_t", "border-t" )
         , ( "border_r", "border-r" )
         , ( "border_b", "border-b" )
         , ( "border_l", "border-l" )
         , ( "rounded", "rounded" )
         , ( "rounded_none", "rounded-none" )
         , ( "rounded_full", "rounded-full" )

         -- Effects
         , ( "shadow", "shadow" )
         , ( "shadow_none", "shadow-none" )
         , ( "transition", "transition" )
         , ( "transition_all", "transition-all" )
         , ( "transition_none", "transition-none" )
         , ( "transition_colors", "transition-colors" )
         ]
            ++ spacingClasses
            ++ sizingClasses
            ++ fontSizeClasses
            ++ fontWeightClasses
            ++ roundedClasses
            ++ shadowClasses
            ++ opacityClasses
            ++ zIndexClasses
        )


spacingClasses : List ( String, String )
spacingClasses =
    let
        values =
            [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "14", "16", "20", "24", "28", "32", "36", "40", "44", "48", "52", "56", "60", "64", "72", "80", "96" ]

        fractional =
            [ ( "0_dot_5", "0.5" ), ( "1_dot_5", "1.5" ), ( "2_dot_5", "2.5" ), ( "3_dot_5", "3.5" ) ]

        directions =
            [ "", "x", "y", "t", "r", "b", "l" ]
    in
    -- Padding
    List.concatMap
        (\v ->
            List.map
                (\d ->
                    let
                        prefix =
                            if d == "" then
                                "p"

                            else
                                "p" ++ d
                    in
                    ( prefix ++ "_" ++ v, prefix ++ "-" ++ v )
                )
                directions
        )
        values
        ++ List.concatMap
            (\( elmV, cssV ) ->
                List.map
                    (\d ->
                        let
                            prefix =
                                if d == "" then
                                    "p"

                                else
                                    "p" ++ d
                        in
                        ( prefix ++ "_" ++ elmV, prefix ++ "-" ++ cssV )
                    )
                    directions
            )
            fractional
        -- Margin
        ++ List.concatMap
            (\v ->
                List.map
                    (\d ->
                        let
                            prefix =
                                if d == "" then
                                    "m"

                                else
                                    "m" ++ d
                        in
                        ( prefix ++ "_" ++ v, prefix ++ "-" ++ v )
                    )
                    directions
            )
            values
        ++ List.concatMap
            (\( elmV, cssV ) ->
                List.map
                    (\d ->
                        let
                            prefix =
                                if d == "" then
                                    "m"

                                else
                                    "m" ++ d
                        in
                        ( prefix ++ "_" ++ elmV, prefix ++ "-" ++ cssV )
                    )
                    directions
            )
            fractional
        -- Negative margin
        ++ List.map (\v -> ( "neg_m_" ++ v, "-m-" ++ v )) (List.filter (\v -> v /= "0") values)
        -- Gap
        ++ List.map (\v -> ( "gap_" ++ v, "gap-" ++ v )) values
        ++ List.concatMap
            (\v ->
                [ ( "gap_x_" ++ v, "gap-x-" ++ v )
                , ( "gap_y_" ++ v, "gap-y-" ++ v )
                ]
            )
            values


sizingClasses : List ( String, String )
sizingClasses =
    let
        values =
            [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "14", "16", "20", "24", "28", "32", "36", "40", "44", "48", "52", "56", "60", "64", "72", "80", "96" ]
    in
    List.concatMap
        (\v ->
            [ ( "w_" ++ v, "w-" ++ v )
            , ( "h_" ++ v, "h-" ++ v )
            ]
        )
        values
        ++ [ ( "w_full", "w-full" )
           , ( "w_screen", "w-screen" )
           , ( "w_auto", "w-auto" )
           , ( "w_min", "w-min" )
           , ( "w_max", "w-max" )
           , ( "w_fit", "w-fit" )
           , ( "h_full", "h-full" )
           , ( "h_screen", "h-screen" )
           , ( "h_auto", "h-auto" )
           , ( "h_min", "h-min" )
           , ( "h_max", "h-max" )
           , ( "h_fit", "h-fit" )
           , ( "min_w_0", "min-w-0" )
           , ( "min_w_full", "min-w-full" )
           , ( "min_h_0", "min-h-0" )
           , ( "min_h_full", "min-h-full" )
           , ( "min_h_screen", "min-h-screen" )
           , ( "max_w_none", "max-w-none" )
           , ( "max_w_full", "max-w-full" )
           , ( "max_h_none", "max-h-none" )
           , ( "max_h_full", "max-h-full" )
           , ( "max_h_screen", "max-h-screen" )
           ]


fontSizeClasses : List ( String, String )
fontSizeClasses =
    [ ( "text_xs", "text-xs" )
    , ( "text_sm", "text-sm" )
    , ( "text_base", "text-base" )
    , ( "text_lg", "text-lg" )
    , ( "text_xl", "text-xl" )
    , ( "text_n2xl", "text-2xl" )
    , ( "text_n3xl", "text-3xl" )
    , ( "text_n4xl", "text-4xl" )
    , ( "text_n5xl", "text-5xl" )
    , ( "text_n6xl", "text-6xl" )
    , ( "text_n7xl", "text-7xl" )
    , ( "text_n8xl", "text-8xl" )
    , ( "text_n9xl", "text-9xl" )
    ]


fontWeightClasses : List ( String, String )
fontWeightClasses =
    [ ( "font_thin", "font-thin" )
    , ( "font_extralight", "font-extralight" )
    , ( "font_light", "font-light" )
    , ( "font_normal", "font-normal" )
    , ( "font_medium", "font-medium" )
    , ( "font_semibold", "font-semibold" )
    , ( "font_bold", "font-bold" )
    , ( "font_extrabold", "font-extrabold" )
    , ( "font_black", "font-black" )
    ]


roundedClasses : List ( String, String )
roundedClasses =
    [ ( "rounded_xs", "rounded-xs" )
    , ( "rounded_sm", "rounded-sm" )
    , ( "rounded_md", "rounded-md" )
    , ( "rounded_lg", "rounded-lg" )
    , ( "rounded_xl", "rounded-xl" )
    , ( "rounded_n2xl", "rounded-2xl" )
    , ( "rounded_n3xl", "rounded-3xl" )
    , ( "rounded_n4xl", "rounded-4xl" )
    ]


shadowClasses : List ( String, String )
shadowClasses =
    [ ( "shadow_n2xs", "shadow-2xs" )
    , ( "shadow_xs", "shadow-xs" )
    , ( "shadow_sm", "shadow-sm" )
    , ( "shadow_md", "shadow-md" )
    , ( "shadow_lg", "shadow-lg" )
    , ( "shadow_xl", "shadow-xl" )
    , ( "shadow_n2xl", "shadow-2xl" )
    , ( "shadow_inner", "shadow-inner" )
    ]


opacityClasses : List ( String, String )
opacityClasses =
    [ ( "opacity_0", "opacity-0" )
    , ( "opacity_5", "opacity-5" )
    , ( "opacity_10", "opacity-10" )
    , ( "opacity_20", "opacity-20" )
    , ( "opacity_25", "opacity-25" )
    , ( "opacity_30", "opacity-30" )
    , ( "opacity_40", "opacity-40" )
    , ( "opacity_50", "opacity-50" )
    , ( "opacity_60", "opacity-60" )
    , ( "opacity_70", "opacity-70" )
    , ( "opacity_75", "opacity-75" )
    , ( "opacity_80", "opacity-80" )
    , ( "opacity_90", "opacity-90" )
    , ( "opacity_95", "opacity-95" )
    , ( "opacity_100", "opacity-100" )
    ]


zIndexClasses : List ( String, String )
zIndexClasses =
    [ ( "z_0", "z-0" )
    , ( "z_10", "z-10" )
    , ( "z_20", "z-20" )
    , ( "z_30", "z-30" )
    , ( "z_40", "z-40" )
    , ( "z_50", "z-50" )
    , ( "z_auto", "z-auto" )
    ]


{-| Extract the collected classes as JSON for use by build tools.
-}
dataExtractor : ProjectContext -> Encode.Value
dataExtractor context =
    Encode.object
        [ ( "classes"
          , Encode.list Encode.string (Set.toList context.classes)
          )
        ]
