// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    var b : ArrayList<Int64> = ArrayList<Int64>(a)
    var s_1 = b.size()
    b.iterator()
    var s_2 = b.size()
    if (s_1 != s_2) {
        return 1
    }
    return 0
}