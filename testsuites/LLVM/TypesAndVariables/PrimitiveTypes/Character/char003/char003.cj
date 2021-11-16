// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected variable pattern, tuple pattern or enum pattern after 'let'
// ASSERT: regex expected variable pattern, tuple pattern or enum pattern after 'var'
func main(): Int64 {
    let Char : Char = 'a'
    var Int32 : Char = 'a'
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
