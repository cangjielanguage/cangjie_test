// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test() : Int64 {
    return return 1
}

// func foo() : Int64 = return return 1

func main(): Int64 {
    test()
    // foo()
    return 0
}
