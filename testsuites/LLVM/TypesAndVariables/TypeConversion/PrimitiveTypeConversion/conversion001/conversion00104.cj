// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int8 = 127
    var aa : Int8 = -128
    var aaa : Int8 = 0
    var b : Int64 = Int64(a)
    var bb : Int64 = Int64(aa)
    var bbb : Int64 = Int64(aaa)
    var c : Int64 = 127
    var cc : Int64 = -128
    var ccc : Int64 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
