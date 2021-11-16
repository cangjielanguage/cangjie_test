// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 0
    match (i) {
        case _ => i
    }
    return 0
}

func main(): Int64 {
    return test()
}
