// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int16 = 255
    var aa : Int16 = 0
    var b : UInt8 = UInt8(a)
    var bb : UInt8 = UInt8(aa)
    var c : UInt8 = 255
    var cc : UInt8 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
