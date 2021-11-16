// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal escape character
func main(): String {
    var varString : String = "\a"
    return varString
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
