// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : String = "1"
    match (i) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
