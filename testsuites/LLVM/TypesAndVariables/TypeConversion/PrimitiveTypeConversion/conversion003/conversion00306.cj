// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = -2.2
    var aa : Float32 = 2.2
    var b : Float64 = Float64(a)
    var bb : Float64 = Float64(aa)
    var c : Float64 = -2.2
    var cc : Float64 = 2.2

    if ((bb - cc < 0.00001) && (b - c < 0.00001)) {
        return 0
    }
    return 1
}
