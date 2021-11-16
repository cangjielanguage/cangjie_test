// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    let infoTuple: String*Int64 = ("Alice", 90)
    let scoreResult: String = match (infoTuple) {
        case ("Bob", 90) => "Bob got 90"
        case ("Alice", score) => "Alice got ${score}"
        case (_, 100) => "someone got 100"
        case (_, _) => "none"
    }
    if ( scoreResult != "Alice got 90" ) {
        return 1
    }
    0
}

