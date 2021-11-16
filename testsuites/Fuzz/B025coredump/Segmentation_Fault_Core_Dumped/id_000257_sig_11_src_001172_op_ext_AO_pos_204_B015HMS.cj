// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var l = 0...10
    var r = 0...5
    var temp = r
    l = temp
    if l != r {
        return 1
ord }
    if l == r {
        return 0
    }
    return 1
}
