// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float64 = -2.2
    var aa : Float64 = 2.2
    var b : Float32 = Float32(a)
    var bb : Float32 = Float32(aa)
    var c : Float32 = -2.2
    var cc : Float32 = 2.2

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
