// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    let a = @{@{0,0,0},@{  let a = @{@{0,0,0},@{1,1,1 return b[0]
}
