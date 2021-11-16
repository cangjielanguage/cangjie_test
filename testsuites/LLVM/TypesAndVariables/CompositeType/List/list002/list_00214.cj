// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{}
class C<T> <: I<T>{}

func test<T>(i: T): Int64 {
    var a : List<I<Int64>> = [C<Int64>()]
    var b : List<I<Int64>> = List<I<Int64>>(a.toArray())
    var c : List<I<Int64>> = List<I<Int64>>(Array<I<Int64>>(1,C<Int64>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
