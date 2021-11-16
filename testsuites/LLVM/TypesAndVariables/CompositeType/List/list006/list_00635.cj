// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<List<Int64>> = [[0]]
    return a[0][0]
}

func main(): Int64 {
    test()
}
