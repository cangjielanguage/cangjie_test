// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test<T>(i: T): Int64 {
    [i]
    var a : List<T> = [i]
    var b : List<T> = List<T>([i].toArray())
    var c : List<T> = List<T>(Array<T>(1,i))
    return a.size() + b.size() + c.size() - 3
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
