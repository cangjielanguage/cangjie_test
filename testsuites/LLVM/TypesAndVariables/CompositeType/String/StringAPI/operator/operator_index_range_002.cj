// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

// 索引操作符溢出
func main():Int64 {
//    var s1 = "仓颉"[..3]
//    var s2 = "cangjie"[-1..]
//    var s3 = "仓颉"[-1..0]
    var s4 = "仓颉"[2..4]
    return 0
}
