// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex  character literal is missing \'\'\' in the end
func main(): Int64 {
    var varChar : Char = '
'
    return 1
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
