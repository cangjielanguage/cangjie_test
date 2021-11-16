// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var test : Int32 = 0
    while test !=10 {
        test++
    continue
        continue
        return 1
ord }
    return 0
}
