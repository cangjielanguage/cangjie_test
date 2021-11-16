// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected newline or ';' between expression or declaration
func main(): Int64 {
    let myTuple = 1,2)
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
