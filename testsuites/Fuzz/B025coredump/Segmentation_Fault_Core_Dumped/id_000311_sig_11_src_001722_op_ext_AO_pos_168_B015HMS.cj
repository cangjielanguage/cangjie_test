// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func test(): Bool {
    return true
}
func main(): Int64 {
    do {
        return 0
ord } while test()
    return 1
}
