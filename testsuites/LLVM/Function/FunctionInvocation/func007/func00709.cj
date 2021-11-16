// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a! : Int64 = 0){return 0}

func main(): Int64 {
    return test()
}
