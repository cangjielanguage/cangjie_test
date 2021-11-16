// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{e}

func test<T>(i: T): Int64 {
    [E<Int64>.e]
    var a : List<E<Int64>> = [E<Int64>.e]
    var b : List<E<Int64>> = List<E<Int64>>([E<Int64>.e].toArray())
    var c : List<E<Int64>> = List<E<Int64>>(Array<E<Int64>>(1,E<Int64>.e))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test<Int64>(1)
}
