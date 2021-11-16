// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): List<Int64>{
    let a : List<Int64> = [1]
    return a
}

func main(): Int64 {
    test()
    return 0
}
