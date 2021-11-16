// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64*Int64{
    let a : Int64*Int64 = (1,1)
    return a
}

func main(): Int64 {
    test()
    return 0
}
