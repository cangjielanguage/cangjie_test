// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int32 = 2147483647
    var aa : Int32 = -2147483648
    var aaa : Int32 = 0
    var b : Int32 = Int32(a)
    var bb : Int32 = Int32(aa)
    var bbb : Int32 = Int32(aaa)
    var c : Int32 = 2147483647
    var cc : Int32 = -2147483648
    var ccc : Int32 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
