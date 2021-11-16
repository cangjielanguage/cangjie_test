// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = -9223372036854775808
    var b : Float32 = Float32(a)
    var c : Float32 = -9223372036854775808.0

    if (b == c) {
        return 0
    }
    return 1
}
