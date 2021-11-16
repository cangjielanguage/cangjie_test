// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Float64{
    let a : Float64 = 0.0
    return a
}

func main(): Int64 {
    test()
    return 0
}
