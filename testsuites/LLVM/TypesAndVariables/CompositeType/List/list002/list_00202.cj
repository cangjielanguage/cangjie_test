// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test<T>(i: T): Int64 {
    [i].toArray()
    var a : List<Array<T>> = [[i].toArray()]
    var b : List<Array<T>> = List<Array<T>>([[i].toArray()].toArray())
    var c : List<Array<T>> = List<Array<T>>(Array<Array<T>>(1,[i].toArray()))
    //return a.size() + b.size() + c.size() - 3
    return 0
}

func main(): Int64 {
    return test<Int64>(1)
}
