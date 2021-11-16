// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = -2.1
    var aa : Float32 = 2.1
    var b : Int64 = Int64(a)
    var bb : Int64 = Int64(aa)
    var c : Int64 = -2
    var cc : Int64 = 2

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
