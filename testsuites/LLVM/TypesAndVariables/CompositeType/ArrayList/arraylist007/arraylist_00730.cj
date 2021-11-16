// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{e(Int64)}

func main(): Int64 {
    //var a : Array<E> = [E.e(1)].toArray()
    var a : Array<E> = @{E.e(1)}
    var b : ArrayList<E> = ArrayList<E>(a)
    return b.size() - 1
}