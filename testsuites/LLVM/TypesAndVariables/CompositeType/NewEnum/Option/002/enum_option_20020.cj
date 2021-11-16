// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Int64{1}

func main(): Int64 {
    var i : ?Int64 = test()
    return 0
}
