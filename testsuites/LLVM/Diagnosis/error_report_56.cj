// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main():Int64 {
    spawn ;  // EXPECTED: regex expected lambda expression after 'spawn'
    return 0
}
