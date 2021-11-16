// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex  too many characters between \'\'
// ASSERT: regex  too many characters between \'\'
func main(): Int64 {
    var varChar : Char = '    '
    let letChar : Char = '    '
    return 1
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
