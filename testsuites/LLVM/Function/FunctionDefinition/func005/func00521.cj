// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Range<Int32>{
    let a : Range<Int32> = 0..10
    return a
}

func main(): Int64 {
    test()
    return 0
}
