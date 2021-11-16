// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func x<T>(input:T):T{input}

func test<T>(i: T): Int64 {
    var a : List<(Int64)->Int64> = [x<Int64>]
    var b : List<(Int64)->Int64> = List<(Int64)->Int64>([x<Int64>].toArray())
    var c : List<(Int64)->Int64> = List<(Int64)->Int64>(Array<((Int64)->Int64)>(1,x<Int64>))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
