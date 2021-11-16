// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float64 = 2.2
    var b : UInt8 = UInt8(a)
    var c : UInt8 = 2

    if (b == c) {
        return 0
    }
    return 1
}
