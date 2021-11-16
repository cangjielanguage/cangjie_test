// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(a : Int64): Unit {
    return
}

func callFunc(myfunc : (Int64) -> Unit): Int64 {
    return 0
}

func main(): Int64 {
    return callFunc(test)
}


