// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex division by 0

func main(): Int64 {
    let a = 0/0

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
