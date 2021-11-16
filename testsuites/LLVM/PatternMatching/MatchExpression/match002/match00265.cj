// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected '=>' after pattern in case body
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    match (1) {
    case 1 = > 0
    }
    return 0
}

func main(): Int64 {
    return test()
}