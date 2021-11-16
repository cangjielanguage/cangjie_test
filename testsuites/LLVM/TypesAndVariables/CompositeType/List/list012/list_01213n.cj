// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 解析自身List
func main(): Int64 {
    var a = [3,4]
    var b = [[*a],[*b]]  // EXPECTED: regex undeclared identifier 'b'
    return 0
}
