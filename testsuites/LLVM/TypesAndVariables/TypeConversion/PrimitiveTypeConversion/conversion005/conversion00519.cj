// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = -2.1
    var aa : Float32 = 2.1
    var b : Int32 = Int32(a)
    var bb : Int32 = Int32(aa)
    var c : Int32 = -2
    var cc : Int32 = 2

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
