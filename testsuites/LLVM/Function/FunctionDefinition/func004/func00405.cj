// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    return 0
}

func callFunc(myfunc : () -> Int64): Int64 {
    return test()
}

func main(): Int64 {
    return callFunc(test)
}


