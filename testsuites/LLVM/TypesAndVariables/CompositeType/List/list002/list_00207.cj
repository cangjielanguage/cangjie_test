// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R<T>{}

func test<T>(i: T): Int64 {
    [R<Int64>()]
    var a : List<R<Int64>> = [R<Int64>()]
    var b : List<R<Int64>> = List<R<Int64>>([R<Int64>()].toArray())
    var c : List<R<Int64>> = List<R<Int64>>(Array<R<Int64>>(1,R<Int64>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
