// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a : List<Int64>): Int64 {
    return 0
}

func main(): Int64 {
    var a : List<Int64> =  [1]
    return test(a)
}
