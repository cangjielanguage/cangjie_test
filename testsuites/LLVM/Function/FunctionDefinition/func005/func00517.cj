// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Char{
    let a : Char = 'a'
    return a
}

func main(): Int64 {
    test()
    return 0
}
