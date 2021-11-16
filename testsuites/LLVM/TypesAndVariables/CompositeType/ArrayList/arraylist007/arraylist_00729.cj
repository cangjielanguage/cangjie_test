// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{e(Int64)}

func main(): Int64 {
    //var a : Array<E<Int64>> = [E<Int64>.e(1)].toArray()
    var a : Array<E<Int64>> = @{E<Int64>.e(1)}
    var b : ArrayList<E<Int64>> = ArrayList<E<Int64>>(a)
    return b.size() - 1
}