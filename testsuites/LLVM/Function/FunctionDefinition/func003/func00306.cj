// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(test_test:Int64): Int64 {
    return test_test
}

func main(): Int64 {
    return test(0)
}
