// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : ArrayList<List<Int64>> = ArrayList<List<Int64>>(1)
    a.add([1])
    return a.get(0)[0] - 1
}
