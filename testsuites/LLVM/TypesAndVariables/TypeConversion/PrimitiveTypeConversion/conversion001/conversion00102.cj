// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int8 = 127
    var aa : Int8 = -128
    var aaa : Int8 = 0
    var b : Int16 = Int16(a)
    var bb : Int16 = Int16(aa)
    var bbb : Int16 = Int16(aaa)
    var c : Int16 = 127
    var cc : Int16 = -128
    var ccc : Int16 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
