// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 0
    var j : Float32 = 0.0
    match (i) {
        case j => "0" // j is a new identifier inside matchExpression.
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
