// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IllegalArgumentException negative count

// * 后为负数
func main():Int64 {
    var s1 = "仓颉" * -1
    return 0
}
