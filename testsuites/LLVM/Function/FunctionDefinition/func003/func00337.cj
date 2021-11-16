// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal symbol
func test(a ： Int64): Int64 {
    return a
}

func main(): Int64 {
    return test(0)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
