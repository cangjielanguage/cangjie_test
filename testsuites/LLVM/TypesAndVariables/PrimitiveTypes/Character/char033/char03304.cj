// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type incompatible in this compound assignment expression
func main(): Char {
    var varChar : Char = '1'
    varChar -=1
    return varChar
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
