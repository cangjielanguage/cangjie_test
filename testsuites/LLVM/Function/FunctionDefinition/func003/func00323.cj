// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex illegal backquote identifier
func test(`te st`:Int64): Int64 {
    return `te st`
}

func main(): Int64 {
    return test(1)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
