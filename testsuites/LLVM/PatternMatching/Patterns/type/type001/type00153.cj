// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    var i : Int32 = 5
    var res = match (i) {
        case a : Int32 => a
        case _ => 1
    }
    if (res != i) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
