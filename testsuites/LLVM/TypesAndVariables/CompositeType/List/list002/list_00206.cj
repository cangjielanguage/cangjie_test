// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func x<T>(input:T):T{input}

func test<T>(i: T): Int64 {
    var a : List<(T)->T> = [x<T>]
    var b : List<(T)->T> = List<(T)->T>([x<T>].toArray())
    var c : List<(T)->T> = List<(T)->T>(Array<((T)->T)>(1,x<T>))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
