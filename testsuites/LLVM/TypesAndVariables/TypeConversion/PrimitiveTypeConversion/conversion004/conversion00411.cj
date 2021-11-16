// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt32 = 2147483647
    var aa : UInt32 = 0
    var b : Int32 = Int32(a)
    var bb : Int32 = Int32(aa)
    var c : Int32 = 2147483647
    var cc : Int32 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
