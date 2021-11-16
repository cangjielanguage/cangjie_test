// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let sum:(Float64, Float64)->Float64 = { a, b => a + b}
    return Int64(sum(0.5,-0.5))
}

func main(): Int64 {
    return test()
}
