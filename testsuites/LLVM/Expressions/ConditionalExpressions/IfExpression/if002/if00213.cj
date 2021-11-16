// ERRCHECK: %compiler %cmp_opt %f
func main(): Int64 {
    if (@){
        return 1  // EXPECTED: regex-not 'return' is not allowed here
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
