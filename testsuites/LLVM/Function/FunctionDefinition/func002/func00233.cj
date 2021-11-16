// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
func test(): Int64 {
    return 1
}

func test(): Int64 {
    return 1
}

func main(): Int64 {
    return test() // EXPECTED: regex ambiguous match for function call
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
