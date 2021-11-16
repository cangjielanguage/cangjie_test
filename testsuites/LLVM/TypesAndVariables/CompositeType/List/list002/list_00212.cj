// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{}

func test<T>(i: T): Int64 {
    var a : List<C<Int64>> = [C<Int64>()]
    var b : List<C<Int64>> = List<C<Int64>>([C<Int64>()].toArray())
    var c : List<C<Int64>> = List<C<Int64>>(Array<C<Int64>>(1,C<Int64>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
