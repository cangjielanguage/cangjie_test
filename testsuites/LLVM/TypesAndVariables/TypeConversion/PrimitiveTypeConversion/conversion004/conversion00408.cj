// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt16 = 65535
    var aa : UInt16 = 0
    var b : Int64 = Int64(a)
    var bb : Int64 = Int64(aa)
    var c : Int64 = 65535
    var cc : Int64 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
