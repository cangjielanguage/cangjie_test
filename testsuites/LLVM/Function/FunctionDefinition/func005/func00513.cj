// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Float32{
    let a : Float32 = 0.0
    return a
}

func main(): Int64 {
    test()
    return 0
}
