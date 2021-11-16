// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    //var a : Array<ArrayList<Int64>> = [ArrayList<Int64>([1].toArray())].toArray()
    var a : Array<ArrayList<Int64>> = @{ArrayList<Int64>(@{1})}
    var b : ArrayList<ArrayList<Int64>> = ArrayList<ArrayList<Int64>>(a)
    return b.size() - 1
}