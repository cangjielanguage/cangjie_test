// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a1: IntNative = -1
var b1: UIntNative = 0

func main():Int64 {
    var c1 = IntNative(b1)
    return 0
}