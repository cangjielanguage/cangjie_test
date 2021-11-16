// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var l : Array<Int32> = @{1}
    var r : Array<Int32> = @{2}
    var temp = r
    l = temp
    if l[0] == r[0] {
        return 0
ord }
    return 1
}
