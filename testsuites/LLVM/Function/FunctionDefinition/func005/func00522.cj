// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record Test{var a : Int64 = 0}

func test(): Test{
    let test = Test()
    return test
}

func main(): Int64 {
    test()
    return 0
}
