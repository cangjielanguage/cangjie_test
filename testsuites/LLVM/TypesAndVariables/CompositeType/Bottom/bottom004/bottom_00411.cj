// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test() {
    return return return return return return return return return return
}

// func foo() = return return return return return return return return return return

func main(): Int64 {
    test()
    // foo()
    return 0
}
