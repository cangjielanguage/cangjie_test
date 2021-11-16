// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'Char' is unsupported for this increment or decrement expression
func main(): Char {
    var varChar : Char = '1'
    varChar ++
    return varChar
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
