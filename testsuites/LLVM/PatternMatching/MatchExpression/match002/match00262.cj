// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex at least one case expression in match case body
func test(): Int64 {
    match (1) {
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
