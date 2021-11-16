// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// spec示例转化
func main(): Int64 {
    let list9 = [**[[1,2,3]],4,5,6]     // EXPECTED: regex inconsistent element type for List literal
    return 0
}
