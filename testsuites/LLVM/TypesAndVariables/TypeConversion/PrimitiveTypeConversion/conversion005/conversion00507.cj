// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : UInt64 = 18446744073709551615
    var aa : UInt64 = 0
    var b : Float32 = Float32(a)
    var bb : Float32 = Float32(aa)
    var c : Float32 = 18446744073709551615.0
    var cc : Float32 = 0.0

    if (b == c && bb == cc) {
        return 0
    }
    return 1
}
