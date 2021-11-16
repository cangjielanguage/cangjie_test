// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// spec示例转化
func main(): Int64 {
    var list3 = [4.0, 5.0, 6.0]
    let list4 = [1, 2, 3, *list3]    // EXPECTED:regex inconsistent element type for List literal
    let list5 = ["a", "b", "c"]
    let list6 = [1.1, 2.2, 3.3, *list5]     // EXPECTED:regex inconsistent element type for List literal
    return 0
}
