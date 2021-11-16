// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float64 = -0.2
    var aa : Float64 = 0.2
    var b : Float64 = Float64(a)
    var bb : Float64 = Float64(aa)
    var c : Float64 = -0.2
    var cc : Float64 = 0.2

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
