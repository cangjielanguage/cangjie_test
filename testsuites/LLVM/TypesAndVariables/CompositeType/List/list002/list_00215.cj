// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<T>{}
class C<T> <: I<T>{}

func test<T>(i: T): Int64 {
    var a : List<I<T>> = [C<T>()]
    var b : List<I<T>> = List<I<T>>(a.toArray())
    var c : List<I<T>> = List<I<T>>(Array<I<T>>(1,C<T>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
