module Snapshots exposing (run)

{-| Snapshot tests for generated Tailwind utilities.

Catches silent additions or removals of utility functions by snapshotting
the full list of exposed names from the generated Tailwind module.

-}

import BackendTask
import BackendTask.File as File
import FatalError exposing (FatalError)
import Pages.Script exposing (Script)
import Snapshot


run : Script
run =
    let
        tailwindSource =
            File.rawFile "../.elm-tailwind/Tailwind.elm"
                |> BackendTask.allowFatal
    in
    Snapshot.run "Snapshots"
        [ Snapshot.taskTest "exposed utilities" <|
            BackendTask.map extractTypeSignatures tailwindSource
        , Snapshot.taskTest "class mappings" <|
            BackendTask.map extractClassMappings tailwindSource
        ]


{-| Extract all type signatures from the generated Tailwind.elm source.

Captures every top-level type annotation (lines matching `name : Type`)
including both simple utilities (`flex : Tailwind`) and parameterized
functions (`p : Spacing -> Tailwind`, `text_color : Color -> Tailwind`).
Sorts for stable diffing.

-}
extractTypeSignatures : String -> String
extractTypeSignatures source =
    source
        |> String.lines
        |> List.filterMap
            (\line ->
                let
                    trimmed =
                        String.trim line
                in
                -- Match top-level type annotations: starts with lowercase, contains " : "
                -- Skip lines that are part of doc comments or record fields
                if isTypeAnnotation trimmed then
                    Just trimmed

                else
                    Nothing
            )
        |> List.sort
        |> String.join "\n"


{-| Extract function-name-to-class-string mappings from the source.

Parses patterns like:

    flex =
        Tailwind "flex"

and produces sorted lines like:

    flex -> flex
    text_balance -> text-balance
    neg_m_px -> -m-px

This catches if a utility's CSS class string silently changes.
Only covers static utilities (not parameterized ones like `p : Spacing -> Tailwind`).

-}
extractClassMappings : String -> String
extractClassMappings source =
    let
        lines =
            String.lines source |> List.indexedMap Tuple.pair
    in
    lines
        |> List.filterMap
            (\( i, line ) ->
                -- Look for `    Tailwind "some-class"` and pair with the function name
                -- from the line two above (pattern: `name =\n    Tailwind "class"`)
                case extractClassName (String.trim line) of
                    Just className ->
                        -- The function name is on the line before (name =) or two before
                        findFunctionName lines i
                            |> Maybe.map (\name -> name ++ " -> " ++ className)

                    Nothing ->
                        Nothing
            )
        |> List.sort
        |> String.join "\n"


extractClassName : String -> Maybe String
extractClassName line =
    if String.startsWith "Tailwind \"" line && String.endsWith "\"" line then
        line
            |> String.dropLeft (String.length "Tailwind \"")
            |> String.dropRight 1
            |> Just

    else
        Nothing


findFunctionName : List ( Int, String ) -> Int -> Maybe String
findFunctionName lines currentIndex =
    -- Look at the previous line for `name =`
    lines
        |> List.filter (\( i, _ ) -> i == currentIndex - 1)
        |> List.head
        |> Maybe.andThen
            (\( _, prevLine ) ->
                let
                    trimmed =
                        String.trim prevLine
                in
                if String.endsWith " =" trimmed then
                    Just (String.dropRight 2 trimmed)

                else
                    Nothing
            )


isTypeAnnotation : String -> Bool
isTypeAnnotation line =
    case String.uncons line of
        Just ( firstChar, _ ) ->
            Char.isLower firstChar
                && String.contains " : " line
                && not (String.contains "=" line)

        Nothing ->
            False
