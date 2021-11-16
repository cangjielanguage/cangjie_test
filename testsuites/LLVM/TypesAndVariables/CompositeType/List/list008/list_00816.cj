// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(input:T): T{
    var a : List<List<T>> = [[input]]
    return a[0][0]
}


func main(): Int64 {
    return test(1) - 1
}
