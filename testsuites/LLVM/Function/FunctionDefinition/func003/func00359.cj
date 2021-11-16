// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a : Range<Int64>): Int32 {
    return 0
}

func main(): Int64 {
    let a : Range<Int64> = 0..10
    return Int64(test(a))
}
