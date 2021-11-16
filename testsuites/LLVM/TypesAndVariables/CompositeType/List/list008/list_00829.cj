// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64{
    var a = { input:List<Int64> => input}
    return a([0]).size() - 1
}

func main(): Int64 {
    return test()
}
