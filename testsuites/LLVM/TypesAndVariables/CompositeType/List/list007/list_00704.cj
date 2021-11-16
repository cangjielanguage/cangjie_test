// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    var a : List<Int64> = [1,2,3]
    var b : List<Int64> = [0]
    a = b
    return a[0]
}

func main(): Int64 {
    return test()
}
