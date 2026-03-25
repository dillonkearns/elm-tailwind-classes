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
                |> BackendTask.map extractUtilityNames
            )
        ]


{-| Extract utility function names from the generated Tailwind.elm source.

Looks for lines matching the pattern `functionName : Tailwind` and extracts
the function name. Sorts the result for stable diffing.

-}
extractUtilityNames : String -> String
extractUtilityNames source =
    source
        |> String.lines
        |> List.filterMap
            (\line ->
                let
                    trimmed =
                        String.trim line
                in
                if String.endsWith " : Tailwind" trimmed then
                    Just (String.dropRight (String.length " : Tailwind") trimmed)

                else
                    Nothing
            )
        |> List.sort
        |> String.join "\n"
