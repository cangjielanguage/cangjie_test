// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    return [[0]][0][0]
}

func main(): Int64 {
    test()
}
