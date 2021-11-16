// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Bool{
    let a : Bool = true
    return a
}

func main(): Int64 {
    test()
    return 0
}
