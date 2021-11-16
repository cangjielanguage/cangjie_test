// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex  missing \'\"\'
func main(): Int64 {
    var varString : String = "\"  // should compile failed.
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
