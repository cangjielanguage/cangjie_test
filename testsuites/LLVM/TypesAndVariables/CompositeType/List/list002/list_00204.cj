// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test<T>(i: T): Int64 {
    var a : List<(T * T)> = [(i,i)]
    var b : List<(T * T)> = List<(T * T)>([(i,i)].toArray())
    var c : List<(T * T)> = List<(T * T)>(Array<(T * T)>(1,(i,i)))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
