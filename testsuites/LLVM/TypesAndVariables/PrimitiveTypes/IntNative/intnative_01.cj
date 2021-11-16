// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main():Int64 {
    var a1: IntNative = -9223372036854775808
    var a2: IntNative = 9223372036854775807
    var a3: IntNative = 0
    var a4: IntNative = -1
    return 0
}