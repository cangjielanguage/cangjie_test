// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<List<Int64>> = [[]]
    var b : List<Int64> = a[0]
    return b.size()
}

func main(): Int64 {
    test()
}
