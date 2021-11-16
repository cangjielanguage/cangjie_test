// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a: Int32 = 2
    1 **= 3 // EXPECTED: regex illegal left value
    return 0
}