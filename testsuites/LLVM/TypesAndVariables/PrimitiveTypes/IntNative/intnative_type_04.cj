// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a1: IntNative = -1
var b1: UIntNative = 0

func main():Int64 {
    var c1 = Int32(a1)
    var c2 = UInt32(b1)
    var c3 = Int64(a1)
    if ( c1 != -1) {
        return 1
    }
    if ( c2 != 0) {
        return 1
    }
    if ( c3 != -1) {
        return 1
    }
    return 0
}
