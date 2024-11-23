module Test.Generated.Main exposing (main)

import PostTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 276917347064928
        , processes = 16
        , globs =
            [ "PostTests.elm"
            ]
        , paths =
            [ "E:\\Facultate\\3-sem1\\PF\\proiect\\tests\\PostTests.elm"
            ]
        }
        [ ( "PostTests"
          , [ Test.Runner.Node.check PostTests.requiredFields
            , Test.Runner.Node.check PostTests.fields
            , Test.Runner.Node.check PostTests.fieldNames
            , Test.Runner.Node.check PostTests.completePost
            , Test.Runner.Node.check PostTests.suite
            ]
          )
        ]