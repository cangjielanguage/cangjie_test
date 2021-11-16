// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int32 = 2147483647
    var aa : Int32 = -2147483648
    var aaa : Int32 = 0
    var b : Int64 = Int64(a)
    var bb : Int64 = Int64(aa)
    var bbb : Int64 = Int64(aaa)
    var c : Int64 = 2147483647
    var cc : Int64 = -2147483648
    var ccc : Int64 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
