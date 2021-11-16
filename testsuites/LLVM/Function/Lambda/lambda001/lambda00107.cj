// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let zero = {  => 0}
    return zero()
}

func main(): Int64 {
    return test()
}
