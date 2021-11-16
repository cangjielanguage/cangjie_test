// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan NegativeArraySizeException

func main(): Int64 {
    let b = Array<Int32>(-1, {i => 0}) 
    return 0
}
