// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test<T>(i: T): Int64 {
    var a : List<Option<T>> = [Some<T>(i)]
    var b : List<Option<T>> = List<Option<T>>([Some<T>(i)].toArray())
    var c : List<Option<T>> = List<Option<T>>(Array<Option<T>>(1,Some<T>(i)))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
