// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var x = 1

func test(): Int64 {
    var a = [x]
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
