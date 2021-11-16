// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<List<Int64>> = [[1,0],[1,1]]
    return a[0][1]
}

func main(): Int64 {
    test()
}
