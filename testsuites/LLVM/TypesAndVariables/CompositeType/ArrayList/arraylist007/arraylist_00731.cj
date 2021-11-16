// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    //var a : Array<Array<Int64>> = [[1].toArray()].toArray()
    var a : Array<Array<Int64>> = @{@{1}}
    var b : ArrayList<Array<Int64>> = ArrayList<Array<Int64>>(a)
    return b.size() - 1
}