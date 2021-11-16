// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int16 = 32767
    var aa : Int16 = -32768
    var aaa : Int16 = 0
    var b : Int32 = Int32(a)
    var bb : Int32 = Int32(aa)
    var bbb : Int32 = Int32(aaa)
    var c : Int32 = 32767
    var cc : Int32 = -32768
    var ccc : Int32 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
