// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a1: UIntNative = 0
    var a3: UIntNative = -0
    var a2: UIntNative = 18446744073709551615
    var a4: UIntNative = 1
    return 0
}