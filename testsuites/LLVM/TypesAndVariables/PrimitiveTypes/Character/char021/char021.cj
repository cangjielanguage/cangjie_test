// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex empty character is not allowed
// ASSERT: regex-auto character literal is missing ''' in the end
// ASSERT: regex-auto expected newline or ';' between expression or declaration

func main(): Int64 {
    var varChar : Char = '\''
    var varChar2 : Char = '''
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
