// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex string literal is missing \'\"\' in the end
func main(): Int64 {
    var varString : String = "\\
    "
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
