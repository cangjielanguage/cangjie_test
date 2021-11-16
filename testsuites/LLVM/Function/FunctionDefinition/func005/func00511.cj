// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): UInt64{
    let a : UInt64 = 0
    return a
}

func main(): Int64 {
    test()
    return 0
}
