// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func maiXEC: %run %run_opt %n.%suffix
func main(): Int64 {
    let a = @{@{0,0,0},@{func maiXEC:let b = a[0]
    return b[0]
}
