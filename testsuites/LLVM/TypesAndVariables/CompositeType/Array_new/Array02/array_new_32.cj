// EXEC-PIPE-1: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

var a = Array<>() // EXPECTED: regex expected type

func main(): Int64 {
    var a = Array<>() // EXPECTED: regex expected type
    return 0
}
