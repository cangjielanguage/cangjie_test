// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R<T>{}

func test<T>(i: T): Int64 {
    var a : List<R<T>> = [R<T>()]
    var b : List<R<T>> = List<R<T>>([R<T>()].toArray())
    var c : List<R<T>> = List<R<T>>(Array<R<T>>(1,R<T>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
