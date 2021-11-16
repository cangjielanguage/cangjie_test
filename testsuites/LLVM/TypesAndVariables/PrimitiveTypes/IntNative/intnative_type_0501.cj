// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var range1: Range<IntNative> = 0..5
    var range2: Range<UIntNative> = 0..5
    return 0
}