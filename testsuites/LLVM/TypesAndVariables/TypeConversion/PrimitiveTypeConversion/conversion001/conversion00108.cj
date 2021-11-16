// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int16 = 32767
    var aa : Int16 = -32768
    var aaa : Int16 = 0
    var b : Int64 = Int64(a)
    var bb : Int64 = Int64(aa)
    var bbb : Int64 = Int64(aaa)
    var c : Int64 = 32767
    var cc : Int64 = -32768
    var ccc : Int64 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
