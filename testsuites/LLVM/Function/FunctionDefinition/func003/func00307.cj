// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(test_1:Int64): Int64 {
    return test_1
}

func main(): Int64 {
    return test(0)
}
