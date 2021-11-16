// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record R<T>{}

func main(): Int64 {
    //var a : Array<R<Int64>> = [R<Int64>()].toArray()
    var a : Array<R<Int64>> = @{R<Int64>()}
    var b : ArrayList<R<Int64>> = ArrayList<R<Int64>>(a)
    return b.size() - 1
}