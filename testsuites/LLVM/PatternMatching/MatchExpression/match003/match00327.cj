// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record Test{}

func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case _ => Test()
    }
    return 0
}

func main(): Int64 {
    return test()
}
