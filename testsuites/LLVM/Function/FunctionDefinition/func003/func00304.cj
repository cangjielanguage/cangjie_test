// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(test1:Int64): Int64 {
    return test1
}

func main(): Int64 {
    return test(0)
}
