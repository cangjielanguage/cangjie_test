// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(a! : Int64 = 0, b! : Int64 = 0): Int64 {
    return a + b
}

func main(): Int64 {
    return test()
}


