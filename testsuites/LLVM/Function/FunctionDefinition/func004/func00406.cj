// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(a : Int64,b : Int64): Int64 {
    return a
}

func callFunc(myfunc : (Int64, Int64) -> Int64): Int64 {
    return myfunc(0, 0)
}

func main(): Int64 {
    return callFunc(test)
}


