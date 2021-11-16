// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt32 = 127
    var aa : UInt32 = 0
    var b : Int8 = Int8(a)
    var bb : Int8 = Int8(aa)
    var c : Int8 = 127
    var cc : Int8 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
