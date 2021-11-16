// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<List<Int64>> = [[1]].toArray()
    var b : ArrayList<List<Int64>> = ArrayList<List<Int64>>(a)
    return b.size() - 1
}