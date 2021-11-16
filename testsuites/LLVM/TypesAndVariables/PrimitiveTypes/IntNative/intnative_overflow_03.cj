// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

//AR-SR-Lang-1014-27 overflow for IntNative
func main(): IntNative {
    try {
        var i1:IntNative = -9223372036854775808
        var i:Int32 = Int32(i1-1)
    } catch (e: OverflowException) {
        return 0
    }
    return 1
}
