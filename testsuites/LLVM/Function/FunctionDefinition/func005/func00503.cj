// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Unit{
    let a : Int64 = 0
    return
}

func main(): Int64 {
    test()
    return 0
}
