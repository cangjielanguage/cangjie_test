// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{
    e(Int64)
}


func test<T>():ArrayList<E<T>>{
    //var a : Array<E<T>> = [E<T>.e(1)].toArray()
    var a : Array<E<T>> = @{E<T>.e(1)}
    var b : ArrayList<E<T>> = ArrayList<E<T>>(a)
    return b
}

func main(): Int64 {
    return test<Int64>().size() - 1
}