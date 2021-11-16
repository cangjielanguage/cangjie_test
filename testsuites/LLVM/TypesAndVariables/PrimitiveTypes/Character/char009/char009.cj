// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan initializer's type is incompatible with variable declaration 'varChar'
func main(): Int64 {
    var varChar : Char = "a"
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
