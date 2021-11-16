// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex escape unicode must be 1 to 8 hexadecimal digits
func main(): Int64 {
    var varChar : Char = '\uu'
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
