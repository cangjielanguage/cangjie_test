// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(){}

func test2(): Int64 {
    var a = [test()]
    return a.size() - 1
}

func main(): Int64 {
    return test2()
}
