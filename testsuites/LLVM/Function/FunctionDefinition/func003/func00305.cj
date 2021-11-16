// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(test_:Int64): Int64 {
    return test_
}

func main(): Int64 {
    return test(0)
}
