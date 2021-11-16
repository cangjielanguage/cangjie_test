// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

var a = RefArray<>() // EXPECTED: regex expected type argument

func main(): Int64 {
    var a = RefArray<>() // EXPECTED: regex expected type argument
    return 0
}
