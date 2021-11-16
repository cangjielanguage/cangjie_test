// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt64 = 32767
    var aa : UInt64 = 0
    var b : Int16 = Int16(a)
    var bb : Int16 = Int16(aa)
    var c : Int16 = 32767
    var cc : Int16 = 0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
