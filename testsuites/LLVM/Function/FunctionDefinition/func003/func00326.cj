// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex backquote identifier is empty

func test(``:Int32): Int32 {
    return ``
}

func main(): Int64 {
    return test(0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
