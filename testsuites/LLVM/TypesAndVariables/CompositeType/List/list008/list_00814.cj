// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<List<Int64>> = [[1]].toArray()
    return a[0][0] - 1
}
