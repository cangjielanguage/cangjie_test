// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex tuple pattern with correct size expected
func main(): Int64 {
    var (a,b) = (0,0,0)
    return a+b
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
