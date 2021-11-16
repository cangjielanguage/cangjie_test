// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var c = 1
    var b = 0
    let a = @{1,0}
    c = a[~++]
    return c
}
