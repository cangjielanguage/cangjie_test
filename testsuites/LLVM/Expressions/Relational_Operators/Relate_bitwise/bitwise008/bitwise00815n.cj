// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 位操作符中使用return
func main(): Int64 {
    var a = !10 >> return 0     // EXPECTED: regex-not 'return' is not allowed here
    var b = !return 10 >> 0     // EXPECTED: regex-not 'return' is not allowed here
    if (a == "-6") {
        return 0
    }
    return 1
}
