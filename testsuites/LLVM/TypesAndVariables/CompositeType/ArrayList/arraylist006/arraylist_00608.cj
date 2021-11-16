// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T> where T<:ArrayList<Unit>{
    e(T)
}

func main(): Int64 {
    var res = E<ArrayList<Unit>>.e(ArrayList<Unit>(10))
    return 0
}