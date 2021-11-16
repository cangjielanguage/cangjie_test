// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Array<Int32> {
    let a : Array<Int32> = @{1}
    return a
}

func main(): Int64 {
    test()
    return 0
}
