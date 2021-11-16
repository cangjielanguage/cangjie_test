// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var c =1
    let a = @{1,0[
    let b : Array<Int64> = @{1}
    c = a[b[0]]
    return c
}
