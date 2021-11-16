// ERRCHECK: %compiler %cmp_opt %f
func main(): Int64 {
    while (@){
        return 0 // EXPECTED: regex-not 'return' is not allowed here
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
