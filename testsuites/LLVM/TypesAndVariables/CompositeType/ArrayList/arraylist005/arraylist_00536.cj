// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{
    e(T)
}

func main(): Int64 {
    var x = E<ArrayList<Unit>>.e(ArrayList<Unit>(10))
    var res = match (x) {
        case e(i) => i.size()
    }
    return res
}