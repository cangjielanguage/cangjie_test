// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(input:T): T{
    var a : (List<T>*List<T>) = ([input],[input])
    return a[1][0]
}

func main(): Int64 {
    return test(0)
}
