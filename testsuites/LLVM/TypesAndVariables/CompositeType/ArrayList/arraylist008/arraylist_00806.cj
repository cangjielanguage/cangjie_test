// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var b : ArrayList<Int64> = ArrayList<Int64>()
    return b.size()
}