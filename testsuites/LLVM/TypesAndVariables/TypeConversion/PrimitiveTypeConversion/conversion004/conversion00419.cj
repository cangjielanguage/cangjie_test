// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int8 = 127
    var aa : Int8 = 0
    var b : UInt32 = UInt32(a)
    var bb : UInt32 = UInt32(aa)
    var c : UInt32 = 127
    var cc : UInt32 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
