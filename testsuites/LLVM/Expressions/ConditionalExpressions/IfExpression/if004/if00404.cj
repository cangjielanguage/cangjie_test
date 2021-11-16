// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'else' is not allowed in block, expected expression or declaration here
func main(): Int64 {
    else {return 0}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
