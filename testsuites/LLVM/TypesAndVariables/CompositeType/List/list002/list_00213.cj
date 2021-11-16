// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{}

func test<T>(i: T): Int64 {
    var a : List<C<T>> = [C<T>()]
    var b : List<C<T>> = List<C<T>>([C<T>()].toArray())
    var c : List<C<T>> = List<C<T>>(Array<C<T>>(1,C<T>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
