// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int32 = 2147483647
    var aa : Int32 = 0
    var b : UInt64 = UInt64(a)
    var bb : UInt64 = UInt64(aa)
    var c : UInt64 = 2147483647
    var cc : UInt64 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
