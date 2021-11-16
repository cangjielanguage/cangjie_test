// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type of return expression is incompatible with return type
func main() : Int64 {
    return
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
