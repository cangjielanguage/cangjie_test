// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test() : Unit {
    var a : Int32 = 0
    return a = 1
}

func main() : Int64 {
    if (test() == ()) {
        return 0
    }
    return 1
}
