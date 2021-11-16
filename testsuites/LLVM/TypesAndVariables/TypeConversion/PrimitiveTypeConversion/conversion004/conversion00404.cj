// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt8 = 255
    var aa : UInt8 = 0
    var b : Int64 = Int64(a)
    var bb : Int64 = Int64(aa)
    var c : Int64 = 255
    var cc : Int64 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
