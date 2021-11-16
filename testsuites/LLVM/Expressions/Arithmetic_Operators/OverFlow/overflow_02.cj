// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    try {
        var i1:Int64 = -9223372036854775808
        var i:Int32 = Int32(i1-1)
    } catch (e: OverflowException) {
        return 0
    }
    return 1
}
