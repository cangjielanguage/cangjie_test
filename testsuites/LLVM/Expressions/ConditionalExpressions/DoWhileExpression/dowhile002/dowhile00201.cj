// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto missing '(' in doWhile expression
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    do {
        return 0
    } while
    return 1
}
