// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test<T>(): Int64 {
    var a = [1..10]
    //var b = List< >([1..10].toArray())
    //var c = List< >( [](1,1..10))
    return a.size() - 1
}

func main(): Int64 {
    return test<Int64>()
}