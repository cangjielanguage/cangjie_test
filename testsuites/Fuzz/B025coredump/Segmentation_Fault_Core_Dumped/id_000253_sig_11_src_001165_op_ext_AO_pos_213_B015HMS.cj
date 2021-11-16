// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var l : bigInt = 0
    var r : bigInt = 1
    var temp = r
    l = temp
    if l == r {
        return 0
ord }
    return 1
}
