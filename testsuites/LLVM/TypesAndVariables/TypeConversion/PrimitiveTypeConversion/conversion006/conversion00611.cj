// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Float32 = 2.2
    var b : UInt32 = UInt32(a)
    var c : UInt32 = 2

    if (b == c) {
        return 0
    }
    return 1
}
