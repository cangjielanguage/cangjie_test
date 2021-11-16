// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 92
    var b : ArrayList<Int64> = ArrayList<Int64>(a)
    b.reserve(92)
    return 0
}
