// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = 2.2
    var b : UInt64 = UInt64(a)
    var c : UInt64 = 2

    if (b == c) {
        return 0
    }
    return 1
}
