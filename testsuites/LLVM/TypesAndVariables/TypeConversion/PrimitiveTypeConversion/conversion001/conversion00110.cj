// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int32 = 32767
    var aa : Int32 = -32768
    var aaa : Int32 = 0
    var b : Int16 = Int16(a)
    var bb : Int16 = Int16(aa)
    var bbb : Int16 = Int16(aaa)
    var c : Int16 = 32767
    var cc : Int16 = -32768
    var ccc : Int16 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
