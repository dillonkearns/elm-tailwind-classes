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
    Snapshot.run "Snapshots"
        [ Snapshot.taskTest "exposed utilities" <|
            (File.rawFile "../.elm-tailwind/Tailwind.elm"
                |> BackendTask.allowFatal
                |> BackendTask.map extractTypeSignatures
            )
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


isTypeAnnotation : String -> Bool
isTypeAnnotation line =
    case String.uncons line of
        Just ( firstChar, _ ) ->
            Char.isLower firstChar
                && String.contains " : " line
                && not (String.contains "=" line)

        Nothing ->
            False
