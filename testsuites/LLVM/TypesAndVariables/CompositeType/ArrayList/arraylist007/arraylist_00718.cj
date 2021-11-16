// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R{}

func main(): Int64 {
    //var a : Array<R> = [R()].toArray()
    var a : Array<R> = @{R()}
    var b : ArrayList<R> = ArrayList<R>(a)
    return b.size() - 1
}