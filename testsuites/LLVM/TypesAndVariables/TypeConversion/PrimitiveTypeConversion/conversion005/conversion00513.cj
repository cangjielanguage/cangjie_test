// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int32 = -2147483648
    var b : Float32 = Float32(a)
    var c : Float32 = -2147483648.0

    if (b == c) {
        return 0
    }
    return 1
}
