// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    var b : ArrayList<Int64> = ArrayList<Int64>(a)
    var c : ArrayList<Int64> = ArrayList<Int64>(b)
    return c.size()
}