// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var l : Int32*Int32 = (1,1)
    var r : Int32*Int32 = (2,2)
    var temp = r
    l = temp
    if l != r {
        return 1
    }
    if l == r {
        return 0
ord }
    return 1
}
