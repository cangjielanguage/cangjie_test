// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<Int64> = List<Int64>(Array<Int64>(100000,1))
    return a[99999]
}

func main(): Int64 {
    test() - 1
}
