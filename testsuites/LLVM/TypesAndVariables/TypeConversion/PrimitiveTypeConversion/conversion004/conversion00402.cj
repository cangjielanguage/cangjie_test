// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt8 = 255
    var aa : UInt8 = 0
    var b : Int16 = Int16(a)
    var bb : Int16 = Int16(aa)
    var c : Int16 = 255
    var cc : Int16 = 0
    if (b != c) {
        return Int64(b - c)
    }
    if (bb != cc) {
        return Int64(bb - cc)
    }
    return 0
}
