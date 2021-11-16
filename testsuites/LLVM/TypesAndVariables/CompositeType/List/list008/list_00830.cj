// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(input:T): Int64{
    var a = { input:List<T> => input}
    return a([input]).size() - 1
}

func main(): Int64 {
    return test(1)
}
