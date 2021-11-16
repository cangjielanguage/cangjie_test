// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 0
    var b : ArrayList<Int64> = ArrayList<Int64>(a)
    return b.size()
}