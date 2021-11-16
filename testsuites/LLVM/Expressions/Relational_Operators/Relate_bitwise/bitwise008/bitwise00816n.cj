// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 位操作符中定义函数
func main(): Int64 {
    var a = !10 >> !func foo(){1}    // EXPECTED: regex expected expression here
}