// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var c = 0
    let b = @{1,0[
    c = b[if true {1}else{0}]
    return c
}
