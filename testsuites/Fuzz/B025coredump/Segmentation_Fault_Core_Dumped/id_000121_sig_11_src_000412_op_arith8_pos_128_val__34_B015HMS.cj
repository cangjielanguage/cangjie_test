// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var c =1
    let a = @{2,1,0[
    c = a[1 << 1]  // 1 << 1 = 2
    return c
}
