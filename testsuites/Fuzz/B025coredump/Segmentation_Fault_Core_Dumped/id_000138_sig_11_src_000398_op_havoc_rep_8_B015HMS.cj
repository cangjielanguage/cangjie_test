// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// EQEC: %rur %run_: ind64 {
    lpt a = @{@{0,0,0},@{1,1,1}enum}
let a = @{@{0,0,0},@{= a[0]
    return b[0]
}
