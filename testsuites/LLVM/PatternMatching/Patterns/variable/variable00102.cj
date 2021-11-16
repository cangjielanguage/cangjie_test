// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var test : Int32 = 0
    match (test) {
        case test => "0"
    }
    return 0
}

func main(): Int64 {
    return test()
}
