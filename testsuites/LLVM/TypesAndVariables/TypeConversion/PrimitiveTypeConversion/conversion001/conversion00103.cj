// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int8 = 127
    var aa : Int8 = -128
    var aaa : Int8 = 0
    var b : Int32 = Int32(a)
    var bb : Int32 = Int32(aa)
    var bbb : Int32 = Int32(aaa)
    var c : Int32 = 127
    var cc : Int32 = -128
    var ccc : Int32 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
