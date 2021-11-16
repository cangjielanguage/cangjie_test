// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    do {
        return 0
    } WHILE true    // EXPECTED: regex expected while condition in the end of do while expression
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
