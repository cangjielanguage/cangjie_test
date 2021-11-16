// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 解析元组
func main(): Int64 {
    let list11 = [1, 2, 3, *(1, "tuple")]  // EXPECTED: regex the type of list spread must be List<T>
    return 0
}
