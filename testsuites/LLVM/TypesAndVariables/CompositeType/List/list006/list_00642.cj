// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<Int64> = [0,1,2]
    return a[0]
}

func main(): Int64 {
    test()
}
