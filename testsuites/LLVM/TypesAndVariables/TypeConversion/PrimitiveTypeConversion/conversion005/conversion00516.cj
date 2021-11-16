// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = -9223372036854775808
    var b : Float64 = Float64(a)
    var c : Float64 = -9223372036854775808.0

    if (b == c) {
        return 0
    }
    return 1
}
