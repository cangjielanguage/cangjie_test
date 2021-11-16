// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected ',' to separate or '\)' to close
func main(): Int64 {
    let myTuple = (1,2
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
