// EXEC: %ictu -m tests/HLT/LSP/ictu/DTS2021081318163 -a open_file -p default -f %f 2>&1 | compare %f
// ASSERT: regex OPEN_FILE Action on file: spec_types_4.4.1.5TuplePatterns_01.cj in package 'default' causes '0' errors

func main():Int64{
    let scoreTuple = ("Allen", 90)
    var scoreResult: String = match (scoreTuple) {
        case ("Bob", 90) => "Bob got 90"
        case ("Allen", score) => "Allen got ${score}" // matched
        case (_, 100) => "someone got 100"
        case (_, _) => ""
    }
// print("${scoreResult}")
    return 0
}

