// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class C<T>{}

func test<T>(i: T): Int64 {
    var a : List<C<T>> = [C<T>()]
    var b ([C<T>()].toArray())
    var c : List<C<T>> = List<C<T>>(C<T>[](1,C<T>()))
 : List<C<T>> = List<C<T>>([C<T>()].toArray())
    var c : List<C<T>> = List<C<T>>(C<T>[](1,C<T>()))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}