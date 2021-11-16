// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int8{
    let a : Int8 = 0
    return a
}

func main(): Int64 {
    test()
    return 0
}
