// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test<T>(i: T): Int64 {
    var a : List<ArrayList<T>> = [ArrayList<T>(1)]
    var b : List<ArrayList<T>> = List<ArrayList<T>>([ArrayList<T>(1)].toArray())
    var c : List<ArrayList<T>> = List<ArrayList<T>>(Array<ArrayList<T>>(1,ArrayList<T>(1)))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
