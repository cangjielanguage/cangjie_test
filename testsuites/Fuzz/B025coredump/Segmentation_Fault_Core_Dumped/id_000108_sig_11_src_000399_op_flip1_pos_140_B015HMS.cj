// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var b = 1
    let a = @{@{1,0,1},@{1(1,1}}
    b = a[0][1]
    return b
}
