// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt64 = 18446744073709551615
    var aa : UInt64 = 0
    var b : Float64 = Float64(a)
    var bb : Float64 = Float64(aa)
    var c : Float64 = 18446744073709551615.0
    var cc : Float64 = 0.0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
