// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = 0.0
    var b : UInt8 = 0
    b = UInt8 (a)

    if (b == 0) {
        return 0
    }
    return 1
}
