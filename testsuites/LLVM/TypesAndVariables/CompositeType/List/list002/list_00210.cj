// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{e}

func test<T>(i: T): Int64 {
    var a : List<E<T>> = [E<T>.e]
    var b : List<E<T>> = List<E<T>>([E<T>.e].toArray())
    var c : List<E<T>> = List<E<T>>(Array<E<T>>(1,E<T>.e))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
