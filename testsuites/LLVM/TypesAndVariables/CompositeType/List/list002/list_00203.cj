// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test<T>(i: T): Int64 {
    var a : List<(T)->T> = [ { input:T => input}]
    var b : List<(T)->T> = List<(T)->T>([ { input:T => input}].toArray())
    var c : List<(T)->T> = List<(T)->T>(Array<((T)->T)>(1, { input:T => input}))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
